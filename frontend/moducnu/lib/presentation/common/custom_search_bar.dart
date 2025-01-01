import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moducnu/presentation/map/search_page.dart';
import 'package:moducnu/presentation/theme/color.dart';
import 'package:sizing/sizing.dart';

class CustomSearchBar extends StatelessWidget {
  final bool hasShadow; // 그림자 여부를 결정하는 변수

  const CustomSearchBar({super.key, this.hasShadow = true}); // 기본값은 true


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
      // Get 패키지를 사용하여 검색 화면으로 이동
      Get.to(() => const SearchPage());
    },
    child: Container(
      margin: const EdgeInsets.all(12.0),
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
      decoration: BoxDecoration(
        color: Colors.transparent, // 배경색
        borderRadius: BorderRadius.circular(10.0), // 둥근 모서리
        boxShadow: hasShadow // 그림자 여부를 결정
            ? [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2), // 그림자 색상
            spreadRadius: 3, // 그림자의 확산 정도
            blurRadius: 5, // 그림자의 흐림 정도
            offset: const Offset(0, 3), // 그림자의 위치 (x, y)
          ),
        ]
            : [], // 그림자가 없을 경우 빈 리스트
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 검색 텍스트 필드
          SizedBox(
            width: 0.74.sw,
            // 텍스트필드의 색을 하얀색으로해야햄
            child: TextField(
              cursorColor: Colors.grey.shade900,
              enabled: !hasShadow, // 그림자가 없는 경우 텍스트 필드 활성화
              decoration: InputDecoration(
                hintText: '학교 장소 검색', // Placeholder text
                contentPadding: const EdgeInsets.only(top: 12.0, left: 16.0, bottom: 12.0), // 텍스트 필드 안의 텍스트 여백
                hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 16.0),
                fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  borderSide: hasShadow
                      ? BorderSide.none // 그림자가 있는 경우 경계선 제거
                      : BorderSide(
                    color: Colors.grey.shade500, // 회색 경계선
                    width: 0.6, // 얇은 두께
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  borderSide: BorderSide(
                    color: Colors.grey.shade700, // 포커스 시 회색 경계선
                    width: 0.6, // 얇은 두께
                  ),
                ),
              ),
            ),
          ),
          // 텍스트 필드와 버튼 사이의 여백
          const SizedBox(width: 12.0), // 여백 추가
          // 검색 버튼
          Container(
              width: 0.13.sw,
              height: 0.13.sw,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.orange, // Orange button color
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const Center( // Center 위젯을 사용하여 아이콘을 정 가운데 배치
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
            ),
        ],
      ),
    ),
    );
  }
}
