import 'package:flutter/material.dart';
import 'package:moducnu/presentation/school/component/section_title.dart';
import 'package:moducnu/presentation/theme/color.dart';
import 'package:intl/intl.dart';

/// 공사 소식을 표시하는 위젯
class ConstructionNews extends StatelessWidget {
  const ConstructionNews({super.key});

  @override
  Widget build(BuildContext context) {
    // 공사 소식 데이터 설정
    final List<Map<String, String>> constructionData = _getConstructionData();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 섹션 제목
          const SectionTitle(title: '🚨 공사 소식'),
          const SizedBox(height: 10.0),

          // 공사 소식 리스트 출력
          ...constructionData.map((news) => _buildNewsCard(news)).toList(),
        ],
      ),
    );
  }

  /// 현재 날짜와 시간 포맷팅하여 반환
  String _formattedDateTime() {
    final now = DateTime.now();
    return DateFormat('MM/dd일 HH:mm분의 소식').format(now);
  }

  /// 공사 소식 데이터를 반환
  List<Map<String, String>> _getConstructionData() {
    return [
      {
        'dateTime': _formattedDateTime(),
        'content': '공대 5호관 오른편 경사로가 공사중에 있습니다.\n다른 출입문을 이용해주시기 바랍니다.'
      }
    ];
  }

  /// 공사 소식 카드 위젯 생성
  Widget _buildNewsCard(Map<String, String> news) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.amber[50],
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: Colors.amber, width: 1.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 날짜 및 시간 표시
          Text(
            news['dateTime']!,
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.brown[700],
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8.0),

          // 공사 소식 내용 표시
          Text(
            news['content']!,
            style: const TextStyle(fontSize: 16.0, color: Colors.black87),
          ),
          const SizedBox(height: 16.0),

          // '자세히 보기' 버튼
          Center(
            child: ElevatedButton(
              onPressed: () => _onDetailButtonPressed(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 9.0),
              ),
              child: const Text(
                '자세히 보기',
                style: TextStyle(fontSize: 12.0, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// '자세히 보기' 버튼 클릭 이벤트 처리 (추후 구현 예정)
  void _onDetailButtonPressed() {
    // 버튼 클릭 이벤트 처리 로직 추가 필요
  }
}
