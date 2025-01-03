import 'package:flutter/material.dart';

/// 경사로 정보 모델
class RampInfo {
  final String location;
  final bool wheelchairAccessible;

  RampInfo({
    required this.location,
    required this.wheelchairAccessible,
  });
}

/// 더미 데이터 리스트
List<RampInfo> dummyData = [
  RampInfo(location: '1층 왼쪽 입구쪽', wheelchairAccessible: true),
  RampInfo(location: '2층 오른쪽 출입구', wheelchairAccessible: false),
  RampInfo(location: '지하 1층 엘리베이터 옆', wheelchairAccessible: true),
];

/// 경사로 상세 정보 팝업
class RampDetailPopup {
  static Future<void> showPopup(
    BuildContext context, {
    required int rampIndex,
  }) {
    final RampInfo info = dummyData[rampIndex]; // 더미 데이터 사용

    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext ctx) {
        return _RampDetailPopupContent(
          rampName: '공과대학 5호관 경사로',
          info: info,
        );
      },
    );
  }
}

/// 팝업 내부 구성
class _RampDetailPopupContent extends StatelessWidget {
  final String rampName;
  final RampInfo info;

  const _RampDetailPopupContent({
    Key? key,
    required this.rampName,
    required this.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white, // 팝업 색상을 흰색으로 변경
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            rampName,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _InfoRow(label: '위치', value: info.location),
            const Divider(),
            _InfoRow(
              label: '휠체어 출입',
              value: info.wheelchairAccessible ? '가능' : '불가',
            ),
            const Divider(),
            const SizedBox(height: 16),
            // 사진 공간
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Text(
                  '아직 등록된 사진이 없어요.',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 정보 표시 행 위젯
class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({Key? key, required this.label, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          Text(value),
        ],
      ),
    );
  }
}