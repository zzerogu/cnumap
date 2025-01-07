import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get_it/get_it.dart';
import 'package:moducnu/domain/model/construction_news.dart';
import 'package:moducnu/presentation/school/component/section_title.dart';
import 'package:moducnu/presentation/theme/color.dart';
import 'package:intl/intl.dart';
import 'package:moducnu/presentation/school/component/construction_news_detail.dart';

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
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 섹션 제목
            // const SectionTitle(title: '🚨 공사 소식'),
            // const SizedBox(height: 10.0),

            // 공사 소식 리스트 출력
            Column(
              children: viewModel.constructionNews
                  .map((news) => _buildNewsCard(context, news))
                  .toList(),
            ),
          ],
        ),
      );
    });
  }

  /// 날짜와 시간 포맷팅
  String _formattedDateRange(DateTime startTime, DateTime endTime) {
    return '${DateFormat('MM/dd HH:mm').format(startTime)} ~ ${DateFormat('MM/dd HH:mm').format(endTime)} 소식';
  }

  /// 공사 소식 카드 위젯 생성
  Widget _buildNewsCard(BuildContext context, ConstructionNews news) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: kNoticeBackgroundColor,
        borderRadius: BorderRadius.circular(12.0),
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
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6.0),

          // 공사 소식 내용 표시
          Text(
            news.content,
            style: const TextStyle(
                fontSize: 16.0, color: Colors.black87,
                fontWeight: FontWeight.bold,
                height: 1.4
            ),
          ),
          const SizedBox(height: 8.0),
          // '자세히 보기' 버튼
          Center(
            child: ElevatedButton(
              onPressed: () => _onDetailButtonPressed(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: kNoticeButtonColor,
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                minimumSize: const Size(0, 30),
                padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
              ),
              child: const Text(
                '자세히 보기',
                style: TextStyle(fontSize: 12.0, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onDetailButtonPressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ConstructionNewsDetail(),
      ),
    );
  }
}
