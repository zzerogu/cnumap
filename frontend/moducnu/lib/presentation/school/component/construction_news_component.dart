import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get_it/get_it.dart';
import 'package:moducnu/domain/model/construction_news.dart';
import 'package:moducnu/presentation/school/component/section_title.dart';
import 'package:moducnu/presentation/theme/color.dart';
import 'package:intl/intl.dart';

import 'construction_news_viewmodel.dart';

/// 공사 소식을 표시하는 위젯
class ConstructionNewsComponent extends StatelessWidget {
  const ConstructionNewsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    // ViewModel 주입
    final ConstructionViewModel viewModel = GetIt.instance<ConstructionViewModel>();
    // 데이터 로드
    viewModel.fetchAllConstructionNews();

    return Obx(() {
      if (viewModel.constructionNews.isEmpty) {
        // 데이터가 없으면 빈 컨테이너 반환
        return const SizedBox.shrink();
      }

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 섹션 제목
            const SectionTitle(title: '🚨 공사 소식'),
            const SizedBox(height: 10.0),

            // 공사 소식 리스트 출력
            Column(
              children: viewModel.constructionNews
                  .map((news) => _buildNewsCard(news))
                  .toList(),
            ),
          ],
        ),
      );
    });
  }

  /// 날짜와 시간 포맷팅
  String _formattedDateRange(DateTime startTime, DateTime endTime) {
    return '${DateFormat('MM/dd HH:mm').format(startTime)} ~ ${DateFormat('MM/dd HH:mm').format(endTime)}의 소식';
  }

  /// 공사 소식 카드 위젯 생성
  Widget _buildNewsCard(ConstructionNews news) {
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
            _formattedDateRange(news.startTime, news.endTime),
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.brown[700],
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8.0),

          // 공사 소식 내용 표시
          Text(
            news.content,
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
