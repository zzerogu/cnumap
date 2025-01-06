import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:moducnu/data/remote/api/map/map_api.dart';
import 'package:moducnu/data/remote/api/building/building_api.dart';
import 'package:moducnu/data/remote/dto/building/building_dto.dart';
import 'package:moducnu/data/remote/api/navigation/navigation_api.dart';
import 'package:moducnu/data/remote/dto/disabled_restroom/disabled_restroom_dto.dart';
import 'package:moducnu/data/remote/dto/navigation/navigation_dto.dart';
import 'package:moducnu/data/remote/dto/ramp/ramp_dto.dart';
import 'package:moducnu/presentation/common/building_detail_popup.dart';
import 'package:geolocator/geolocator.dart' as geo;
import 'package:moducnu/presentation/common/ramp_detail_popup.dart';
import 'package:moducnu/presentation/common/restroom_detail_popup.dart';
import 'package:permission_handler/permission_handler.dart';

class CustomPointAnnotationClickListener
    implements OnPointAnnotationClickListener {
  final Function(PointAnnotation) onClick;

  CustomPointAnnotationClickListener(this.onClick);

  @override
  bool onPointAnnotationClick(PointAnnotation annotation) {
    onClick(annotation);
    return true; // 클릭 이벤트가 소비됨
  }
}

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
  final Map<String, Map<String, dynamic>> _markerData = {};

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 지도 위젯
        MapWidget(
          key: const ValueKey("mapWidget"),
          styleUri: "mapbox://styles/mapbox/outdoors-v12",
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
          child: FloatingActionButton.small(
            onPressed: _moveToCurrentLocation,
            backgroundColor: Color.fromRGBO(136, 181, 197, 1),
            child: const Icon(Icons.my_location, color: Colors.white),
          ),
        ),
      ],
    );
  }

  /// ✅ 카테고리별 아이콘을 결정하는 함수
  String _getIconForCategory(String category) {
    switch (category) {
      case "경사로":
        return "ramp-icon";
      case "화장실":
        return "restroom-icon";
      case "편의점":
        return "store-icon";
      case "휴게실":
        return "wheel-icon";
      default:
        return "marker-15"; // 기본 아이콘
    }
  }

  void _onMapCreated(MapboxMap mapboxMap) async {
    _mapboxMap = mapboxMap;
    _addCustomTileSource(mapboxMap);
    _initializeAnnotationManager();

    await _addIcon("ic_ramp", "ramp-icon", 2.7);
    await _addIcon("ic_restroom", "restroom-icon", 2.7);
    await _addIcon("ic_store", "store-icon", 2.7);
    await _addIcon("ic_wheelchairCharge", "wheel-icon", 2.7);
    await _addIcon("ic_CurrentUser", "current-icon", 2.7);
    await _addIcon("ic_PlaceMarker", "placeMarker-icon", 2.7);
  }

  Future<void> _addIcon(
      String assetFileName, String iconId, double scale) async {
    final ByteData raw =
        await rootBundle.load('assets/icons/$assetFileName.png');
    final Uint8List bytes = raw.buffer.asUint8List();

    final MbxImage mbxImage = MbxImage(
      data: bytes,
      width: 64,
      height: 64,
    );

    await _mapboxMap?.style.addStyleImage(
      iconId,
      scale,
      mbxImage,
      false,
      [],
      [],
      null,
    );
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
          center: Point(
              coordinates: Position(127.3455249809536, 36.363905525179774)),
          zoom: 16.0,
        ),
      );

      await _pointAnnotationManager?.deleteAll();

      // 새로운 마커 추가
      await _pointAnnotationManager?.create(
        PointAnnotationOptions(
          geometry: Point(
              coordinates: Position(127.3455249809536, 36.363905525179774)),
          iconSize: 1.0,
          iconImage: "current-icon", // Mapbox 기본 아이콘 사용
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
        lineCap: LineCap.ROUND, // ✅ 라인 끝을 둥글게
        lineJoin: LineJoin.ROUND, // ✅ 라인 연결부 둥글게
        lineColorExpression: [
          'rgb', 100, 149, 237 // ✅ RGB 포맷 사용 (파란색)
        ],
      ));

      await _pointAnnotationManager?.deleteAll();

      // 새로운 마커 추가
      await _pointAnnotationManager?.create(
        PointAnnotationOptions(
          geometry: Point(
              coordinates: Position(127.3455249809536, 36.363905525179774)),
          iconSize: 1.0,
          iconImage: "current-icon", // Mapbox 기본 아이콘 사용
        ),
      );

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
            iconSize: 1.5,
            iconImage: "ramp-icon",
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
            iconSize: isSelected ? 2.0 : 1.5, // ✅ 포커스 여부에 따라 크기 변경
            iconImage: "ramp-icon",
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

  //// ✅ 검색 후 건물을 선택했을 때 포커스
  Future<void> focusOnBuilding(String nodeId) async {
    try {
      final CoordinateDto coordinate =
          await widget.navigationApi.getNodePolygonCoordinates(nodeId);
      // ✅ 기존 마커를 삭제하고 다시 생성 (크기 조정)
      await _pointAnnotationManager?.deleteAll();
      _annotations.clear();
      final annotation = await _pointAnnotationManager!.create(
        PointAnnotationOptions(
          geometry: Point(
              coordinates: Position(coordinate.longitude, coordinate.latitude)),
          iconSize: 0.7, // ✅ 포커스 여부에 따라 크기 변경
          iconImage: "placeMarker-icon",
        ),
      );
      _annotations.add(annotation);
      // ✅ 선택한 경사로로 카메라 이동
      _mapboxMap?.setCamera(
        CameraOptions(
          center: Point(
              coordinates: Position(coordinate.longitude, coordinate.latitude)),
          zoom: 16.0,
        ),
      );

      _pointAnnotationManager?.addOnPointAnnotationClickListener(
        CustomPointAnnotationClickListener((clickedAnnotation) async {
          try {
            final response =
                await widget.buildingApi.getBuildingByNodeId(nodeId);

            if (response != null) {
              _showBuildingDetailPopup(response);
            } else {
              print("Building data not found.");
            }
          } catch (e) {
            print("Error handling marker click: $e");
          }
          return true;
        }),
      );
    } catch (e) {
      print("Failed to focus on building: $e");
    }
  }

  /// ✅ 새로운 마커를 추가하는 함수 (화장실 및 경사로 등)
  void addMarkers(List<dynamic> items, String category) async {
    await _pointAnnotationManager?.deleteAll(); // 기존 마커 제거
    _annotations.clear(); // 수동 마커 리스트 초기화
    _markerData.clear(); // 마커 데이터 초기화

    for (int index = 0; index < items.length; index++) {
      var item = items[index];
      try {
        double latitude = 0.0;
        double longitude = 0.0;
        String locationDescription = "";
        int buildingId = 0;
        String nodeId = "";

        // ✅ RampResponseDto 처리
        if (item is RampResponseDto) {
          final coordinate =
              await widget.navigationApi.getNodeCoordinates(item.nodeId);
          latitude = coordinate.latitude;
          longitude = coordinate.longitude;
          locationDescription = item.locationDescription;
          buildingId = item.buildingId;
        }

        // ✅ DisabledRestroomResponseDto 처리
        else if (item is DisabledRestroomResponseDto) {
          final coordinate =
              await widget.navigationApi.getNodeCoordinates(item.nodeId);
          latitude = coordinate.latitude;
          longitude = coordinate.longitude;
          locationDescription = item.locationDescription;
          buildingId = item.buildingId;
        }

        // ✅ BuildingDetailResponseDto 처리
        else if (item is BuildingDetailResponseDto) {
          final coordinate =
              await widget.navigationApi.getNodePolygonCoordinates(item.nodeId);
          latitude = coordinate.latitude;
          longitude = coordinate.longitude;
          locationDescription = item.address;
          buildingId = item.buildingId;
          nodeId = item.nodeId;
        }

        final String iconImage = _getIconForCategory(category);

        // ✅ 마커 추가
        final annotation = await _pointAnnotationManager!.create(
          PointAnnotationOptions(
            geometry: Point(coordinates: Position(longitude, latitude)),
            iconSize: 2.0,
            iconImage: iconImage,
          ),
        );
        _markerData[annotation.id] = {
          'buildingId': buildingId,
          'locationDescription': locationDescription,
          'nodeId': nodeId
        };

        // ✅ 마커 클릭 이벤트 (category에 따라 다르게 처리)
        _pointAnnotationManager?.addOnPointAnnotationClickListener(
          CustomPointAnnotationClickListener((clickedAnnotation) async {
            try {
              // ✅ 클릭된 마커의 ID로 데이터 조회
              final userData = _markerData[clickedAnnotation.id];
              if (userData == null) return false;

              final buildingId = userData['buildingId'];
              final locationDescription = userData['locationDescription'];
              final nodeId = userData['nodeId'];

              if (category == "경사로") {
                await RampDetailPopup.showPopup(
                  context,
                  buildingApi: widget.buildingApi,
                  buildingId: buildingId,
                  location: locationDescription,
                );
              } else if (category == "화장실") {
                await RestroomDetailPopup.showPopup(
                  context,
                  buildingApi: widget.buildingApi,
                  buildingId: buildingId,
                  location: locationDescription,
                );
              } else if (category == "편의점" || category == "휴게실") {
                final response =
                    await widget.buildingApi.getBuildingByNodeId(nodeId);
                if (response != null) {
                  _showBuildingDetailPopup(response);
                } else {
                  print("Building data not found.");
                }
              } else {
                print("클릭된 마커: $locationDescription (건물 ID: $buildingId)");
              }
            } catch (e) {
              print("Error handling marker click: $e");
            }
            return true;
          }),
        );

        _annotations.add(annotation);
      } catch (e) {
        print("Failed to add marker: $e");
      }
    }

    print("${items.length}개의 마커를 추가했습니다.");
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
    final tileUrl = "${widget.baseUrl}api/map/tiles/{z}/{x}/{y}.pbf";

    mapboxMap.style.addSource(
      VectorSource(
        id: "customTileSource",
        tiles: [tileUrl],
        minzoom: 0,
        maxzoom: 14,
      ),
    );

    final slopeStyles = [
      {
        'slope_bucket': 'slope_-∞_~_-10',
        'color': ['rgba', 100, 0, 0, 1.0], // 진한 어두운 빨강
      },
      {
        'slope_bucket': 'slope_-9_-8',
        'color': ['rgba', 120, 0, 0, 1.0], // 조금 밝아진 빨강
      },
      {
        'slope_bucket': 'slope_-8_-7',
        'color': ['rgba', 140, 0, 0, 1.0], // 더 밝은 빨강
      },
      {
        'slope_bucket': 'slope_-7_-6',
        'color': ['rgba', 160, 0, 0, 1.0], // 더 밝은 빨강
      },
      {
        'slope_bucket': 'slope_-6_-5',
        'color': ['rgba', 180, 0, 0, 1.0], // 더 밝은 빨강
      },
      {
        'slope_bucket': 'slope_6_7',
        'color': ['rgba', 180, 0, 0, 1.0], // 밝은 빨강
      },
      {
        'slope_bucket': 'slope_7_8',
        'color': ['rgba', 160, 0, 0, 1.0], // 더 밝은 빨강
      },
      {
        'slope_bucket': 'slope_8_9',
        'color': ['rgba', 140, 0, 0, 1.0], // 거의 완전 빨강
      },
      {
        'slope_bucket': 'slope_9_10',
        'color': ['rgba', 120, 0, 0, 1.0], // 순수 빨강
      },
      {
        'slope_bucket': 'slope_10_∞',
        'color': ['rgba', 100, 0, 0, 1.0], // 약간 연한 빨강
      }
    ];

    for (var style in slopeStyles) {
      final String slopeBucket = style['slope_bucket'] as String;
      final List<Object> color = style['color'] as List<Object>;

      mapboxMap.style.addLayer(
        LineLayer(
          id: "gradientLineLayer_$slopeBucket",
          sourceId: "customTileSource",
          sourceLayer: "osm_lines",
          lineWidth: 4,
          lineBlur: 10,
          lineCap: LineCap.ROUND, // ✅ 라인 끝을 둥글게
          lineJoin: LineJoin.ROUND, // ✅ 라인 연결부 둥글게
          lineColorExpression: [
            'match',
            ['get', 'slope_bucket'],
            slopeBucket, color,
            ['rgba', 150, 150, 150, 0.0] // ✅ 기본값 회색
          ],
        ),
      );
    }
  }

  void _onMapTapped(MapContentGestureContext context) {
    final position = context.point.coordinates;

    print(
        "Map tapped at coordinates: longitude = ${position.lng}, latitude = ${position.lat}");

    if (_mapboxMap == null) return;

    // ✅ 마커 클릭 여부 검사
    for (var annotation in _annotations) {
      final tappedPosition = annotation.geometry.coordinates;
      if ((tappedPosition.lat - position.lat).abs() < 0.0001 &&
          (tappedPosition.lng - position.lng).abs() < 0.0001) {
        print("마커가 클릭되었습니다. 지도 클릭 이벤트를 무시합니다.");
        return; // ✅ 마커 클릭 시, 건물 이벤트 방지
      }
    }

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
