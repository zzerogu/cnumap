import 'package:flutter/material.dart';
import 'package:moducnu/presentation/school/component/section_title.dart';
import 'package:moducnu/presentation/theme/color.dart';


class ChaChaInfoSection extends StatelessWidget {
  const ChaChaInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(title: '📻 차차 정보'),
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
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: kInfoBorderColor, width: 1.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 1.5,
        children: const [
          InfoCard(title: '공사 소식', icon: Icons.construction),
          InfoCard(title: '도움 요청', icon: Icons.help),
          InfoCard(title: '휠체어 충전소', icon: Icons.electric_scooter),
          InfoCard(title: '장애학습 지원센터', icon: Icons.accessible),
        ],
      ),
    );
  }
}


class InfoCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const InfoCard({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140.0,
      height: 95.0,
      decoration: BoxDecoration(
        color: kInfoBackgroundColor, // 배경색
        borderRadius: BorderRadius.circular(8.0), // 모서리 둥글게
        border: Border.all(color: kInfoBorderColor, width: 0.8), // 보더 추가
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 16.0),
          ),
          const SizedBox(height: 8),
          Icon(icon, size: 36, color: kNoticeButtonColor),
        ],
      ),
    );
  }
}