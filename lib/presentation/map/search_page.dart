import 'package:flutter/material.dart';
import 'package:moducnu/domain/model/Place.dart';
import 'package:moducnu/presentation/common/custom_search_bar.dart';
import 'package:moducnu/presentation/common/place_item.dart';
import 'package:moducnu/presentation/theme/color.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  // 더미 데이터 리스트
  final List<Place> places = const [
    Place(
      placeName: '충남대학교 도서관',
      category: '도서관',
      address: '충남대학교 도서관',
      contact: '041-123-4567',
    ),
    Place(
      placeName: '한누리회관',
      category: '강의실',
      address: '충남대학교 한누리회관',
      contact: '041-234-5678',
    ),
    Place(
      placeName: '학생회관',
      category: '식당',
      address: '충남대학교 학생회관',
      contact: '041-345-6789',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: const Text('검색'),
      ),
      body: ListView(
        children: [
          const CustomSearchBar(),  // 검색 바 추가
          // PlaceItem 리스트를 동적으로 표시
          for (var place in places)
            PlaceItem(
              place: place,
            ),
        ],
      ),
    );
  }
}
