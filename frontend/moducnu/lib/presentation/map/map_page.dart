import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import '../common/modal_bottom_sheet.dart'; // ModalBottomSheet 임포트

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
      body: Stack(
        children: [
          // Map 위젯
          MapWidget(
            key: const ValueKey("mapWidget"),
            styleUri: "mapbox://styles/mapbox/streets-v11", // Mapbox Streets 스타일
            cameraOptions: CameraOptions(
              center: Point(coordinates: Position(127.3467804, 36.3688066)),
              zoom: 14.0, // 초기 줌 레벨
            ),
            onMapCreated: _onMapCreated,
          ),

          // 모달창 열기 버튼
          Positioned(
            bottom: 16.0,
            left: 16.0,
            right: 16.0,
            child: ElevatedButton(
              onPressed: () {
                // ModalBottomSheet 표시
                ModalBottomSheet.showModal(
                  context,
                  '제목', // 제목
                  '부제목', // 부제목
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blueAccent,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('모달 열기'),
            ),
          ),
        ],
      ),
    );
  }

  void _onMapCreated(MapboxMap mapboxMap) {
    _mapboxMap = mapboxMap;

    // 초기 카메라 설정
    mapboxMap.setCamera(
      CameraOptions(
        center: Point(coordinates: Position(127.3467804, 36.3688066)),
        zoom: 15.0,
      ),
    );

    // 지도 스타일 변경
    mapboxMap.style.setStyleURI("mapbox://styles/mapbox/outdoors-v11");
  }
}
