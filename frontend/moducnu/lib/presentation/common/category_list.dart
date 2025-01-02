import 'package:flutter/material.dart';

import 'category_chip.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int? activeIndex; // 스크롤 가능한 카테고리 활성화 상태 기본값

  final List<String> categories = [
    '화장실',
    '휠체어 충전소',
    '경사로',
    '편의점',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          const SizedBox(width: 16),
          // 내 장소 카테고리
          MyPlaceCategoryChip(
            isActive: activeIndex == -1, // 활성화 상태 확인 (-1로 설정)
            onTap: () {
              setState(() {
                activeIndex = activeIndex == -1 ? null : -1; // 선택 해제 가능
              });
            },
          ),
          const SizedBox(width: 6), // 간격 추가
          // 나머지 카테고리
          ...List.generate(categories.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(right: 4.0), // 간격 추가
              child: CategoryChip(
                label: categories[index],
                isActive: activeIndex == index, // 활성화 상태 확인
                onTap: () {
                  setState(() {
                    activeIndex = activeIndex == index ? null : index; // 선택 해제 가능
                  });
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}