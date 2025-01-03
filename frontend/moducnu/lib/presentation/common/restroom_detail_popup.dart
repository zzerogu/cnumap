import 'package:flutter/material.dart';
import 'package:moducnu/presentation/theme/color.dart'; 

/// 화장실 정보 모델
class RestroomInfo {
  final String location;
  final String entranceWidth;
  final bool accessible;
  final String rampLocation;

  RestroomInfo({
    required this.location,
    required this.entranceWidth,
    required this.accessible,
    required this.rampLocation,
  });
}

/// 더미 데이터 리스트
List<RestroomInfo> restroomData = [
  RestroomInfo(
    location: '1층 복도 끝',
    entranceWidth: '90cm',
    accessible: true,
    rampLocation: '입구 오른쪽 경사로',
  ),
  RestroomInfo(
    location: '2층 엘리베이터 옆',
    entranceWidth: '85cm',
    accessible: false,
    rampLocation: '없음',
  ),
  RestroomInfo(
    location: '지하 1층 주차장 근처',
    entranceWidth: '95cm',
    accessible: true,
    rampLocation: '입구 앞 경사로',
  ),
];

/// 화장실 상세 정보 팝업
class RestroomDetailPopup {
  static Future<void> showPopup(
    BuildContext context, {
    required int restroomIndex,
  }) {
    final RestroomInfo info = restroomData[restroomIndex];

    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext ctx) {
        return _RestroomDetailPopupContent(
          restroomName: '화장실 상세 정보',
          info: info,
        );
      },
    );
  }
}

/// 팝업 내부 구성
class _RestroomDetailPopupContent extends StatelessWidget {
  final String restroomName;
  final RestroomInfo info;

  const _RestroomDetailPopupContent({
    Key? key,
    required this.restroomName,
    required this.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white, // 팝업 색상 흰색
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            restroomName,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
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
            _InfoRow(label: '출입구 너비', value: info.entranceWidth),
            const Divider(),
            _InfoRow(
              label: '장애인 화장실',
              value: info.accessible ? '있음' : '없음',
            ),
            const Divider(),
            _InfoRow(label: '경사로 위치', value: info.rampLocation),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
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
                    Navigator.pop(context);
                    // TODO: 경로 안내 모달 띄우기
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
