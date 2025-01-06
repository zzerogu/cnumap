import 'package:flutter/material.dart';
import 'package:moducnu/presentation/school/component/section_title.dart';
import 'package:moducnu/presentation/school/component/building_detail.dart';
import 'package:moducnu/presentation/theme/color.dart';


class BuildingInfoSection extends StatelessWidget {
  const BuildingInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(title: '🏫 우리 학교 건물'),
          SizedBox(height: 10.0),
          BuildingList(),
        ],
      ),
    );
  }
}


class BuildingList extends StatefulWidget {
  const BuildingList({super.key});

  @override
  _BuildingListState createState() => _BuildingListState();
}

class _BuildingListState extends State<BuildingList> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<List<String>> _buildings = [
    ['공과대학 5호관', '중앙도서관', '제2학생회관'],
    ['체육관', '기숙사', '학생식당'],
    ['음악관', '미술관', '언어교육원'],
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 210,
          child: PageView.builder(
            controller: _pageController,
            itemCount: _buildings.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, pageIndex) {
              return Column(
                children: _buildings[pageIndex].map((buildingName) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: BuildingCard(name: buildingName),
                  );
                }).toList(),
              );
            },
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            _buildings.length,
                (index) => GestureDetector(
              onTap: () {
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                width: _currentPage == index ? 12.0 : 8.0,
                height: 8.0,
                decoration: BoxDecoration(
                  color: _currentPage == index ? Colors.orange : Colors.grey,
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class BuildingCard extends StatelessWidget {
  final String name;

  const BuildingCard({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2.0), // 아이템 간 간격
      decoration: BoxDecoration(
        color: kInfoBackgroundColor,
        borderRadius: BorderRadius.circular(6.0),
        border: Border.all(color: kInfoBorderColor, width: 0.8),
      ),
      child: Center( // 내용물을 수직으로 가운데 정렬
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 12.0), // 패딩 조정
          title: Text(
            name,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 16.0),
          ),
          trailing: const Row(
            mainAxisSize: MainAxisSize.min, // Row가 최소 크기만 차지하도록 설정
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // 양 끝 정렬
            crossAxisAlignment: CrossAxisAlignment.center, // 수직 가운데 정렬
            children: [
              Text(
                '도면보기',
                style: TextStyle(color: Colors.grey, fontSize: 12.0),
              ),
              SizedBox(width: 8), // 텍스트와 아이콘 사이 간격
              Icon(Icons.arrow_circle_right, color: Colors.orange),
            ],
          ),
          onTap: () {
             Navigator.push(
             context,
             MaterialPageRoute(
             builder: (context) => BuildingDetailPage(buildingName: name),
              ),
            );
            // Handle navigation or click event
          },
        ),
      ),
    );
  }
}