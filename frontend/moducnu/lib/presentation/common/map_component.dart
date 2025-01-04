import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:moducnu/data/remote/api/map/map_api.dart';
import 'package:moducnu/data/remote/api/building/building_api.dart';
import 'package:moducnu/data/remote/dto/building/building_dto.dart';
import 'package:moducnu/data/remote/api/navigation/navigation_api.dart';
import 'package:moducnu/data/remote/dto/navigation/navigation_dto.dart';
import 'package:moducnu/presentation/common/building_detail_popup.dart';
import 'package:geolocator/geolocator.dart' as geo;
import 'package:permission_handler/permission_handler.dart';

class MapComponent extends StatefulWidget {
  final BuildingApi buildingApi;
  final NavigationApi navigationApi;
  final String baseUrl;
  final String accessToken;

  const MapComponent({
    Key? key,
    required this.buildingApi,
    required this.navigationApi,
    required this.baseUrl,
    required this.accessToken,
  }) : super(key: key);

  @override
  State<MapComponent> createState() => MapComponentState();
}

class MapComponentState extends State<MapComponent> {
  MapboxMap? _mapboxMap;
  PointAnnotationManager? _pointAnnotationManager;
  String? selectedRampNodeId;
  final List<PointAnnotation> _annotations = [];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 지도 위젯
        MapWidget(
          key: const ValueKey("mapWidget"),
          styleUri: "mapbox://styles/mapbox/streets-v11",
          cameraOptions: CameraOptions(
            center: Point(coordinates: Position(127.3467804, 36.3688066)),
            zoom: 14.0,
          ),
          onMapCreated: _onMapCreated,
          onTapListener: _onMapTapped,
        ),

        // 내 위치 보기 버튼 (우측 하단 고정)
        Positioned(
          bottom: 20,
          right: 20,
          child: FloatingActionButton(
            onPressed: _moveToCurrentLocation,
            backgroundColor: Colors.blueAccent,
            child: const Icon(Icons.my_location, color: Colors.white),
          ),
        ),
      ],
    );
  }

  void _onMapCreated(MapboxMap mapboxMap) {
    _mapboxMap = mapboxMap;
    // 사용자 타일 소스 추가
    _addCustomTileSource(mapboxMap);

    _initializeAnnotationManager();
  }

  Future<void> _initializeAnnotationManager() async {
    _pointAnnotationManager =
        await _mapboxMap?.annotations.createPointAnnotationManager();
  }

  Future<void> _moveToCurrentLocation() async {
    try {
      // var status = await Permission.location.request();
      // if (status.isGranted) {
      //   print("위치 권한 승인됨.");
      // } else if (status.isDenied) {
      //   print("위치 권한 거부됨. 다시 요청");
      //   await Permission.location.request();
      // } else if (status.isPermanentlyDenied) {
      //   print("위치 권한 영구적으로 거부됨. 설정으로 이동");
      //   await openAppSettings(); // 설정 화면 열기
      // }

      // geolocator의 Position 사용
      // geo.Position position = await geo.Geolocator.getCurrentPosition(
      //   desiredAccuracy: geo.LocationAccuracy.high,
      // );

      // mapbox의 Position 사용 (경도, 위도)
      _mapboxMap?.setCamera(
        CameraOptions(
          center: Point(coordinates: Position(127.344919, 36.364029)),
          zoom: 16.0,
        ),
      );

      await _pointAnnotationManager?.deleteAll();

      // 새로운 마커 추가
      await _pointAnnotationManager?.create(
        PointAnnotationOptions(
          geometry: Point(coordinates: Position(127.344919, 36.364029)),
          iconSize: 2.0,
          iconImage: "marker-15", // Mapbox 기본 아이콘 사용
        ),
      );

      // print("현재 위치: ${position.latitude}, ${position.longitude}");
    } catch (e) {
      print("위치 가져오기 실패: $e");
    }
  }

  Future<BuildingFullResponseDto?> _fetchBuildingDetails(String nodeId) async {
    try {
      final response = await widget.buildingApi.getBuildingByNodeId(nodeId);
      if (response != null) {
        return response;
      }
    } catch (e) {
      print("Error fetching building details: $e");
    }
    return null;
  }

  Future<void> _drawRouteOnMap(List<Position> route) async {
    try {
      final style = _mapboxMap?.style;

      if (style == null) {
        print("스타일을 찾을 수 없습니다.");
        return;
      }

      // ✅ 기존 레이어와 소스 제거 전에 존재 여부 확인
      try {
        await style.getLayer("routeLayer");
        await style.removeStyleLayer("routeLayer");
      } catch (e) {
        print("routeLayer가 존재하지 않음: $e");
      }

      try {
        await style.getSource("routeSource");
        await style.removeStyleSource("routeSource");
      } catch (e) {
        print("routeSource가 존재하지 않음: $e");
      }

      // ✅ Polyline 좌표를 GeoJSON 형식으로 변환
      final geoJsonRoute = jsonEncode({
        "type": "Feature",
        "geometry": {
          "type": "LineString",
          "coordinates":
              route.map((position) => [position.lng, position.lat]).toList(),
        }
      });

      // ✅ GeoJSON 소스 추가
      await style.addSource(GeoJsonSource(
        id: "routeSource",
        data: geoJsonRoute,
      ));

      // ✅ 경로를 시각적으로 표현하는 라인 레이어 추가
      await style.addLayer(LineLayer(
        id: "routeLayer",
        sourceId: "routeSource",
        lineWidth: 5.0,
        lineColorExpression: [
          'rgb', 0, 0, 255 // ✅ RGB 포맷 사용 (파란색)
        ],
      ));

      print("경로가 성공적으로 추가되었습니다.");
    } catch (e) {
      print("경로 그리기 오류 발생: $e");
    }
  }

  /// ✅ 경사로 마커를 추가하는 함수 (node_id 기반 좌표 적용)
  /// ✅ 경사로 마커를 추가하는 함수 (수동 리스트에 저장)
  Future<void> _addRampMarkers(List<BuildingFeature> ramps) async {
    await _pointAnnotationManager?.deleteAll(); // 기존 마커 삭제
    _annotations.clear(); // 수동 관리하는 리스트 초기화

    for (var ramp in ramps) {
      try {
        final CoordinateDto coordinate =
            await widget.navigationApi.getNodeCoordinates(ramp.nodeId);
        final annotation = await _pointAnnotationManager!.create(
          PointAnnotationOptions(
            geometry: Point(
                coordinates:
                    Position(coordinate.longitude, coordinate.latitude)),
            iconSize: 2.0,
            iconImage: "marker-15",
          ),
        );
        _annotations.add(annotation); // ✅ 리스트에 마커 추가
      } catch (e) {
        print("Failed to fetch ramp coordinates: $e");
      }
    }
  }

  //// ✅ 특정 경사로를 선택했을 때 해당 마커만 포커스 및 크기 조정 (마커 삭제 후 재생성)
  Future<void> _focusOnRamp(
      List<BuildingFeature> ramps, String rampNodeId) async {
    try {
      final CoordinateDto coordinate =
          await widget.navigationApi.getNodeCoordinates(rampNodeId);

      // ✅ 기존 마커를 삭제하고 다시 생성 (크기 조정)
      await _pointAnnotationManager?.deleteAll();
      _annotations.clear();

      for (var ramp in ramps) {
        final CoordinateDto rampCoordinate =
            await widget.navigationApi.getNodeCoordinates(ramp.nodeId);

        final isSelected = ramp.nodeId == rampNodeId;
        final annotation = await _pointAnnotationManager!.create(
          PointAnnotationOptions(
            geometry: Point(
                coordinates: Position(
                    rampCoordinate.longitude, rampCoordinate.latitude)),
            iconSize: isSelected ? 3.0 : 2.0, // ✅ 포커스 여부에 따라 크기 변경
            iconImage: "marker-15",
          ),
        );
        _annotations.add(annotation);
      }

      // ✅ 선택한 경사로로 카메라 이동
      _mapboxMap?.setCamera(
        CameraOptions(
          center: Point(
              coordinates: Position(coordinate.longitude, coordinate.latitude)),
          zoom: 16.0,
        ),
      );

      setState(() {
        selectedRampNodeId = rampNodeId;
      });
    } catch (e) {
      print("Failed to focus on ramp: $e");
    }
  }

  /// ✅ 새로운 마커를 추가하는 함수 (화장실 및 경사로 등)
  void addMarkers(List<CoordinateDto> coordinates) async {
    print(11111);
    await _pointAnnotationManager?.deleteAll(); // 기존 마커 제거
    _annotations.clear(); // 수동 마커 리스트 초기화

    for (var coordinate in coordinates) {
      try {
        final annotation = await _pointAnnotationManager!.create(
          PointAnnotationOptions(
            geometry: Point(
                coordinates:
                    Position(coordinate.longitude, coordinate.latitude)),
            iconSize: 2.0,
            iconImage: "marker-15",
          ),
        );
        _annotations.add(annotation);
      } catch (e) {
        print("Failed to add marker: $e");
      }
    }
    print("${coordinates.length}개의 마커를 추가했습니다.");
  }

  void _showBuildingDetailPopup(BuildingFullResponseDto buildingData) {
    final buildingName = buildingData.building.name.isNotEmpty
        ? buildingData.building.name
        : "Unknown Building";

    final buildingId = buildingData.building.buildingId;
    final nodeId = buildingData.building.nodeId;

    // ✅ buildingData에서 상세 정보를 변환하여 BuildingFeature 리스트로 변환
    final List<BuildingFeature> features = [];

    // ✅ 장애인 화장실 데이터 변환
    for (var restroom in buildingData.disabledRestrooms) {
      features.add(BuildingFeature(
        featureName: "Disabled Restroom",
        isAvailable: true,
        featureId: restroom.restroomId, // ✅ dot notation 사용
        buildingId: restroom.buildingId, // ✅ dot notation 사용
        nodeId: restroom.nodeId, // ✅ dot notation 사용
        floor: restroom.floor, // ✅ dot notation 사용
        locationDescription: restroom.locationDescription, // ✅ dot notation 사용
      ));
    }

// ✅ 엘리베이터 데이터 변환 (비어있으므로 처리 제외)
    if (buildingData.elevators.isEmpty) {
      features.add(BuildingFeature(
        featureName: "Elevator",
        isAvailable: false,
        buildingId: buildingId,
        nodeId: nodeId,
      ));
    } else {
      // ✅ 엘리베이터 데이터가 존재할 경우
      for (var elevator in buildingData.elevators) {
        features.add(BuildingFeature(
          featureName: "Elevator",
          isAvailable: true,
          featureId: elevator.elevatorId, // ✅ dot notation 사용
          buildingId: elevator.buildingId, // ✅ dot notation 사용
          nodeId: elevator.nodeId, // ✅ dot notation 사용
          floor: elevator.floor, // ✅ dot notation 사용
          locationDescription:
              elevator.locationDescription, // ✅ dot notation 사용
        ));
      }
    }

// ✅ 램프 데이터 변환
    for (var ramp in buildingData.ramps) {
      features.add(BuildingFeature(
        featureName: "Ramp",
        isAvailable: true,
        featureId: ramp.rampId, // ✅ dot notation 사용
        buildingId: ramp.buildingId, // ✅ dot notation 사용
        nodeId: ramp.nodeId, // ✅ dot notation 사용
        floor: ramp.floor, // ✅ dot notation 사용
        locationDescription: ramp.locationDescription, // ✅ dot notation 사용
      ));
    }

    // ✅ BuildingDetailPopup에 데이터 전달
    BuildingDetailPopup.showPopup(context,
        buildingName: buildingName,
        buildingId: buildingId,
        nodeId: nodeId,
        features: features,
        onRouteDraw: _drawRouteOnMap,
        onRampMarkersAdded: _addRampMarkers,
        onRampFocused: _focusOnRamp);
  }

  void _addCustomTileSource(MapboxMap mapboxMap) {
    final tileUrl = "${widget.baseUrl}/api/map/tiles/{z}/{x}/{y}.pbf";

    mapboxMap.style.addSource(
      VectorSource(
        id: "customTileSource",
        tiles: [tileUrl],
        minzoom: 0,
        maxzoom: 14,
      ),
    );

    mapboxMap.style.addLayer(
      LineLayer(
        id: "lineLayer",
        sourceId: "customTileSource",
        sourceLayer: "osm_lines",
        lineWidth: 8,
        lineColorExpression: [
          'match',
          ['get', 'slope_bucket'],
          'slope_-7_-6',
          '#AA0000',
          'slope_-6_-5',
          '#AA0000',
          'slope_-5_-4',
          '#AA0000',
          'slope_-4_-3',
          '#AA0000',
          'slope_-3_-2',
          '#FFCCCC',
          'slope_-2_-1',
          '#FFCCCC',
          'slope_-1_0',
          '#FFCCCC',
          'slope_0_1',
          '#FFCCCC',
          'slope_1_2',
          '#FFCCCC',
          'slope_2_3',
          '#FFCCCC',
          'slope_3_4',
          '#AA0000',
          'slope_4_5',
          '#AA0000',
          'slope_5_6',
          '#AA0000',
          'slope_6_7',
          '#AA0000',
          '#FF0000',
        ],
      ),
    );

    mapboxMap.style.addLayer(
      SymbolLayer(
        id: "markerLayer",
        sourceId: "customTileSource",
        iconImage: "marker-15",
      ),
    );
  }

  void _onMapTapped(MapContentGestureContext context) {
    final position = context.point.coordinates;

    print(
        "Map tapped at coordinates: longitude = ${position.lng}, latitude = ${position.lat}");

    if (_mapboxMap == null) return;

    try {
      _mapboxMap!
          .pixelForCoordinate(
        Point(coordinates: Position(position.lng, position.lat)),
      )
          .then((screenCoordinate) {
        final geometry =
            RenderedQueryGeometry.fromScreenCoordinate(screenCoordinate);

        final renderedQueryOptions = RenderedQueryOptions(
          layerIds: ["building"],
          filter: null,
        );

        _mapboxMap!
            .queryRenderedFeatures(geometry, renderedQueryOptions)
            .then((features) async {
          if (features != null && features.isNotEmpty) {
            for (var feature in features) {
              final buildingId = feature?.queriedFeature.feature['id'];
              if (buildingId != null) {
                // 서버 요청으로 빌딩 상세 정보 가져오기
                final buildingData =
                    await _fetchBuildingDetails(buildingId.toString());

                // 팝업 띄우기
                if (buildingData != null) {
                  _showBuildingDetailPopup(buildingData);
                } else {
                  print("Building data not found.");
                }
              }
            }
          } else {
            print("No features found at tapped location.");
          }
        }).catchError((e) {
          print("Error querying features: $e");
        });
      }).catchError((e) {
        print("Error getting screen coordinate: $e");
      });
    } catch (e) {
      print("Unexpected error: $e");
    }
  }
}
