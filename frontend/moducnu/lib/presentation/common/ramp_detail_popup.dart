import 'package:flutter/material.dart';
import 'package:moducnu/data/remote/api/building/building_api.dart';

/// 경사로 상세 정보 팝업
class RampDetailPopup {
  static Future<void> showPopup(
    BuildContext context, {
    required BuildingApi buildingApi,
    required int buildingId,
    required String location,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext ctx) {
        return _RampDetailPopupContent(
          buildingApi: buildingApi,
          buildingId: buildingId,
          location: location,
        );
      },
    );
  }
}

/// 팝업 내부 구성
class _RampDetailPopupContent extends StatefulWidget {
  final BuildingApi buildingApi;
  final int buildingId;
  final String location;

  const _RampDetailPopupContent({
    Key? key,
    required this.buildingApi,
    required this.buildingId,
    required this.location,
  }) : super(key: key);

  @override
  State<_RampDetailPopupContent> createState() =>
      _RampDetailPopupContentState();
}

class _RampDetailPopupContentState extends State<_RampDetailPopupContent> {
  String? buildingName;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchBuildingName();
  }

  Future<void> _fetchBuildingName() async {
    try {
      final name = await widget.buildingApi
          .getBuildingNameByBuildingId(widget.buildingId);
      setState(() {
        buildingName = name;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        buildingName = "이름을 불러올 수 없음";
        isLoading = false;
      });
    }
  }

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
            isLoading
                ? '로딩 중...'
                : (buildingName ?? '알 수 없는 건물').replaceAll('"', ''),
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
            _InfoRow(label: '위치', value: widget.location),
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
