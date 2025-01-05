import 'package:flutter/material.dart';

/// 경사로 상세 정보 팝업
class RampDetailPopup {
  static Future<void> showPopup(
    BuildContext context, {
    required int buildingId,
    required String location,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext ctx) {
        return _RampDetailPopupContent(
          buildingId: buildingId,
          location: location,
        );
      },
    );
  }
}

/// 팝업 내부 구성
class _RampDetailPopupContent extends StatelessWidget {
  final int buildingId;
  final String location;

  const _RampDetailPopupContent({
    Key? key,
    required this.buildingId,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white, // 팝업 색상을 흰색으로 설정
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '건물 ID: $buildingId',
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
            _InfoRow(label: '위치', value: location),
            const Divider(),
            _InfoRow(
              label: '휠체어 출입 가능 여부',
              value: '가능', // ✅ 항상 '가능'으로 고정
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
                  '아직 등록된 사진이 없습니다.',
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

  const _InfoRow({Key? key, required this.label, required this.value})
      : super(key: key);

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
