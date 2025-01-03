import 'package:flutter/material.dart';
import 'package:moducnu/presentation/theme/color.dart'; 
import 'package:moducnu/presentation/common/route_finder_modal.dart'; 

/// 건물 편의시설 모델
class BuildingFeature {
  final String featureName;  
  final bool isAvailable;    

  BuildingFeature({
    required this.featureName,
    required this.isAvailable,
  });
}

/// "팝업(중앙 다이얼로그)" 형태로 건물 상세 정보 띄우는 클래스
class BuildingDetailPopup {
  static Future<void> showPopup(
    BuildContext context, {
    required String buildingName,
    required List<BuildingFeature> features,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext ctx) {
        return _BuildingDetailPopupContent(
          buildingName: buildingName,
          features: features,
        );
      },
    );
  }
}

/// 팝업 내부(AlertDialog)
class _BuildingDetailPopupContent extends StatelessWidget {
  final String buildingName;
  final List<BuildingFeature> features;

  const _BuildingDetailPopupContent({
    Key? key,
    required this.buildingName,
    required this.features,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      title: Text(
        buildingName,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 편의시설 리스트
            ...features.map((f) => _FeatureRow(feature: f)).toList(),
            const SizedBox(height: 16),

            // 아래쪽 버튼 2개 (평면도 보기, 경로 안내)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // TODO: 평면도 보기
                    Navigator.pop(context); // 팝업 닫기
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                    backgroundColor: Colors.white,
                
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  icon: Image.asset(
                    'assets/icons/ic_MapMarker.png',
                    width: 19,
                    height: 19,
                  ),
                  label: const Text(
                    '평면도 보기',
                    style: TextStyle(color: kButtonColor, fontSize: 15),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // (1) 현재 팝업(AlertDialog) 닫기
                    Navigator.pop(context);

                    // (2) 경로 안내 모달 띄우기
                    RouteFinderModal.showModal(
                      context, 
                      '경로 안내',
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                    backgroundColor: kButtonColor,
    
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  icon: Image.asset(
                    'assets/icons/ic_PlaceMarker.png',
                    width: 15,
                    height: 15,
                  ),
                  label: const Text(
                    '경로 안내',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// 편의시설 한 줄(아이콘 + 텍스트)
class _FeatureRow extends StatelessWidget {
  final BuildingFeature feature;
  const _FeatureRow({Key? key, required this.feature}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final iconData = feature.isAvailable ? Icons.check_circle : Icons.cancel;
    final iconColor = feature.isAvailable ? Colors.blueAccent : Colors.redAccent;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(iconData, color: iconColor),
          const SizedBox(width: 6),
          Text(feature.featureName),
        ],
      ),
    );
  }
}
