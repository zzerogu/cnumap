import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:moducnu/data/remote/api/map/map_api.dart';
import 'package:moducnu/data/remote/api/building/building_api.dart';
import 'package:moducnu/data/remote/dto/building/building_dto.dart';
import 'package:moducnu/presentation/common/building_detail_popup.dart';

class MapComponent extends StatefulWidget {
  final BuildingApi buildingApi;
  final String baseUrl;
  final String accessToken;

  const MapComponent({
    Key? key,
    required this.buildingApi,
    required this.baseUrl,
    required this.accessToken,
  }) : super(key: key);

  @override
  State<MapComponent> createState() => _MapComponentState();
}

class _MapComponentState extends State<MapComponent> {
  MapboxMap? _mapboxMap;

  @override
  Widget build(BuildContext context) {
    return MapWidget(
      key: ValueKey("mapWidget"),
      styleUri: "mapbox://styles/mapbox/streets-v11",
      cameraOptions: CameraOptions(
        center: Point(coordinates: Position(127.3467804, 36.3688066)),
        zoom: 14.0,
      ),
      onMapCreated: _onMapCreated,
      onTapListener: _onMapTapped, // onTapListener에 함수 연결
    );
  }

  void _onMapCreated(MapboxMap mapboxMap) {
    _mapboxMap = mapboxMap;

    // 사용자 타일 소스 추가
    _addCustomTileSource(mapboxMap);
  }

  Future<BuildingFullResponseDto?> _fetchBuildingDetails(String nodeId) async {
    print("buildingId: $nodeId");
    try {
      final response = await widget.buildingApi.getBuildingByNodeId(nodeId);
      print("response: $response");
      if (response != null) {
        return response;
      }
    } catch (e) {
      print("Error fetching building details: $e");
    }
    return null;
  }

  void _showBuildingDetailPopup(BuildingFullResponseDto buildingData) {
    final buildingName = buildingData.building.name.isNotEmpty
        ? buildingData.building.name
        : "Unknown Building";

    // 편의시설 정보를 BuildingFeature 리스트로 변환
    final features = [
      BuildingFeature(
        featureName: "Elevator",
        isAvailable:
            buildingData.elevators.isNotEmpty, // `elevators` 리스트가 비어있지 않은지 확인
      ),
      BuildingFeature(
        featureName: "Ramp",
        isAvailable: buildingData.ramps.isNotEmpty, // `ramps` 리스트가 비어있지 않은지 확인
      ),
      BuildingFeature(
        featureName: "Disabled Restroom",
        isAvailable: buildingData.disabledRestrooms
            .isNotEmpty, // `disabled_restrooms` 리스트가 비어있지 않은지 확인
      ),
    ];

    // 팝업 표시
    BuildingDetailPopup.showPopup(
      context,
      buildingName: buildingName,
      features: features,
    );
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
