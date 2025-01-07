import 'package:flutter/material.dart';

import 'package:moducnu/presentation/school/component/section_title.dart';
import 'package:moducnu/presentation/theme/color.dart';
import 'package:moducnu/presentation/school/component/disabled_center_detail.dart'; // 추가된 파일 임포트
import 'package:moducnu/presentation/school/component/lounge.dart';



class ChaChaInfoSection extends StatelessWidget {
  const ChaChaInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(title: 'ℹ️ 도움이 필요하신가요?'),
          SizedBox(height: 10.0),
          InfoGrid(),
        ],
      ),
    );
  }
}


class InfoGrid extends StatelessWidget {
  const InfoGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 1.5,
        children: [
          
          InfoCard(
            title: '장애학습 지원센터',
            icon: Icons.accessible,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DisabledCenterDetail(),
                ),
              );
            },
          ),
          InfoCard(
            title: '휴게실',
            icon: Icons.local_cafe,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Lounge(),
                ),
              ); // 오류 수정: 닫는 괄호 추가
            },
          ),
        ],
      ),
    );
  }
}


class InfoCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback? onTap; // 클릭 이벤트 추가

  const InfoCard({super.key, required this.title, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // 클릭 이벤트 연결
      child: Container(
        width: 140.0,
        height: 95.0,
        decoration: BoxDecoration(
          color: kInfoBackgroundColor, // 배경색
          boxShadow:  [
            BoxShadow(
              color: const Color(0xff000000).withOpacity(0.2), // 그림자 색상
              offset: const Offset(0, 4),
              blurRadius: 4,
            ),
          ],
          borderRadius: BorderRadius.circular(6.0), // 모서리 둥글게
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 16.0, fontWeight: FontWeight.w500), // 텍스트 스타일
            ),
            const SizedBox(height: 6),
            Icon(icon, size: 36, color: kNoticeButtonColor),
          ],
        ),
      ),
    );
  }
}
