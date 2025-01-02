import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import '../common/route_finder_modal.dart';
import '../common/building_detail_popup.dart';
import 'package:moducnu/presentation/common/category_list.dart';
import 'package:moducnu/presentation/common/custom_search_bar.dart';
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
          // 지도 위젯
          MapWidget(
            key: ValueKey("mapWidget"),
            styleUri: "mapbox://styles/mapbox/streets-v11", // Mapbox Streets 스타일
            cameraOptions: CameraOptions(
              center: Point(coordinates: Position(127.3467804, 36.3688066)),
              zoom: 14.0,
            ),
            onMapCreated: _onMapCreated,
          ),

          // 지도 위에 GestureDetector (투명)
          Positioned.fill(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTapUp: (details) async {
                if (_mapboxMap == null) return;

                // 탭한 화면좌표 -> 지도 좌표 변환
                final dx = details.localPosition.dx;
                final dy = details.localPosition.dy;
                final screenCoordinate = ScreenCoordinate(x: dx, y: dy);

                final point = await _mapboxMap!.coordinateForPixel(screenCoordinate);
                if (point == null) return;

                final position = point.coordinates; 
                final double lng = position.lng.toDouble();
                final double lat = position.lat.toDouble();

                // 실제론 (lng, lat)로 어떤 건물이냐 판별 후 해당 정보 주입
                BuildingDetailPopup.showPopup(
                  
          // 검색바
          const Positioned(
            top: 70.0, // 화면 상단에서 50px 떨어짐
            left: 4.0, // 화면 좌측에서 16px 떨어짐
            right: 4.0, // 화면 우측에서 16px 떨어짐
            child: Column(
              children: [
                CustomSearchBar(),
                SizedBox(height: 12.0),
                CategoryList()
              ],
            ),
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
                  buildingName: '공과대학 5호관',
                  features: [
                    BuildingFeature(featureName: '경사로 출입구', isAvailable: true),
                    BuildingFeature(featureName: '승강기', isAvailable: false),
                    BuildingFeature(featureName: '장애인 화장실', isAvailable: true),
                    BuildingFeature(featureName: '휠체어 충전', isAvailable: false),
                  ],
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blueAccent,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text('모달 열기'),
            ),
          ),
        ],
      ),
    );
  }

  void _onMapCreated(MapboxMap mapboxMap) {
    _mapboxMap = mapboxMap;

    _mapboxMap!.setCamera(
      CameraOptions(
        center: Point(coordinates: Position(127.3467804, 36.3688066)),
        zoom: 15.0,
      ),
    );

    _mapboxMap!.style.setStyleURI("mapbox://styles/mapbox/outdoors-v11");
  }
}
