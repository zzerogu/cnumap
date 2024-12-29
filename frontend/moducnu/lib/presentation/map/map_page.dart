import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  MapboxMap? _mapboxMap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MapWidget(
        key: const ValueKey("mapWidget"),
        styleUri: "mapbox://styles/mapbox/streets-v11", // Mapbox Streets 스타일
        cameraOptions: CameraOptions(
          center: Point(coordinates: Position(127.3467804, 36.3688066)), // 충대 도서관 좌표
          zoom: 14.0, // 초기 줌 레벨
        ),
        onMapCreated: _onMapCreated,
      ),
    );
  }

  void _onMapCreated(MapboxMap mapboxMap) {
    _mapboxMap = mapboxMap;

    // 초기 카메라 설정
    mapboxMap.setCamera(
      CameraOptions(
        center: Point(coordinates: Position(127.3467804, 36.3688066)), // 충대 도서관 좌표
        zoom: 15.0,
      ),
    );

    // 지도 스타일 변경
    mapboxMap.style.setStyleURI("mapbox://styles/mapbox/outdoors-v11");
  }
}
