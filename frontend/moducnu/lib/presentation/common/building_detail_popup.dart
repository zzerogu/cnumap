import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:moducnu/data/remote/dto/navigation/navigation_dto.dart';
import 'package:moducnu/presentation/theme/color.dart';
import 'package:moducnu/presentation/common/route_finder_modal.dart';

/// 건물 편의시설 모델
class BuildingFeature {
  final String featureName;
  final bool isAvailable;
  final int? featureId;
  final int buildingId;
  final String nodeId;
  final int? floor;
  final String? locationDescription;

  BuildingFeature({
    required this.featureName,
    required this.isAvailable,
    this.featureId,
    required this.buildingId,
    required this.nodeId,
    this.floor,
    this.locationDescription,
  });
}

/// "팝업(중앙 다이얼로그)" 형태로 건물 상세 정보를 띄우는 클래스
class BuildingDetailPopup {
  static Future<void> showPopup(
    BuildContext context, {
    required String buildingName,
    required int buildingId,
    required String nodeId,
    required List<BuildingFeature> features,
    required Function(List<Position>, CoordinateDto) onRouteDraw,
    required Function(List<BuildingFeature>) onRampMarkersAdded, // ✅ 추가
    required Function(List<BuildingFeature>, String) onRampFocused, // ✅ 추가
  }) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext ctx) {
        return _BuildingDetailPopupContent(
          buildingName: buildingName,
          buildingId: buildingId,
          nodeId: nodeId,
          features: features,
          onRouteDraw: onRouteDraw,
          onRampMarkersAdded: onRampMarkersAdded,
          onRampFocused: onRampFocused,
        );
      },
    );
  }
}

/// 팝업 내부 (AlertDialog)
class _BuildingDetailPopupContent extends StatelessWidget {
  final String buildingName;
  final int buildingId;
  final String nodeId;
  final List<BuildingFeature> features;
  final Function(List<Position>, CoordinateDto) onRouteDraw;
  final Function(List<BuildingFeature>) onRampMarkersAdded; // ✅ 추가
  final Function(List<BuildingFeature>, String) onRampFocused; // ✅ 추가

  const _BuildingDetailPopupContent({
    Key? key,
    required this.buildingName,
    required this.buildingId,
    required this.nodeId,
    required this.features,
    required this.onRouteDraw,
    required this.onRampMarkersAdded,
    required this.onRampFocused,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      title: Text(
        buildingName,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ✅ 편의시설 리스트
            ...features.map((f) => _FeatureRow(feature: f)).toList(),
            const SizedBox(height: 16),

            // ✅ 버튼 섹션 (평면도 보기 & 경로 안내)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context); // 평면도 보기 (닫기)
                  },
                  style: ElevatedButton.styleFrom(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  icon: Image.asset(
                    'assets/icons/ic_MapMarker.png',
                    width: 18,
                    height: 19,
                  ),
                  label: const Text('상세페이지',
                      style: TextStyle(color: kButtonColor)),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                    // ✅ features에서 직접 ramp 데이터 추출
                    final rampFeatures = features
                        .where((f) => f.featureName == 'Ramp')
                        .map((f) => Ramp(
                              nodeId: f.nodeId,
                              locationDescription:
                                  f.locationDescription ?? "위치 정보 없음",
                            ))
                        .toList();
                    RouteFinderModal.showModal(
                      context,
                      title: '경로 안내',
                      buildingName: buildingName,
                      buildingId: buildingId,
                      nodeId: nodeId,
                      ramps: rampFeatures,
                      onRouteDraw: onRouteDraw,
                      onRampMarkersAdded: onRampMarkersAdded,
                      onRampFocused: onRampFocused,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                    backgroundColor: kButtonColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  icon: Image.asset(
                    'assets/icons/ic_PlaceMarker.png',
                    width: 25,
                    height: 25,
                  ),
                  label: const Text('경로 안내',
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// ✅ 편의시설 한 줄(아이콘 + 텍스트 + 상세정보)
class _FeatureRow extends StatelessWidget {
  final BuildingFeature feature;
  const _FeatureRow({Key? key, required this.feature}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final iconData = feature.isAvailable ? Icons.check_circle : Icons.cancel;
    final iconColor =
        feature.isAvailable ? Colors.blueAccent : Colors.redAccent;

    // ✅ 영어 → 한글 변환 + null 방지 처리
    final displayName = _translateFeatureName(feature.featureName);
    final floorInfo = feature.floor != null ? "${feature.floor}층" : "층 정보 없음";
    final locationInfo = feature.locationDescription ?? "위치 정보 없음";
    final nodeIdInfo = feature.nodeId.isNotEmpty ? feature.nodeId : "노드 ID 없음";

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(iconData, color: iconColor),
              const SizedBox(width: 6),
              Text(displayName,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32),
            child: Text("층: $floorInfo"),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32),
            child: Text("위치: $locationInfo"),
          ),
        ],
      ),
    );
  }

  /// ✅ 영어 → 한글 변환 함수
  String _translateFeatureName(String featureName) {
    switch (featureName) {
      case 'Elevator':
        return '엘리베이터';
      case 'Ramp':
        return '경사로';
      case 'Disabled Restroom':
        return '장애인 화장실';
      default:
        return featureName;
    }
  }
}
