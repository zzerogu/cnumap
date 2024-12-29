import 'package:flutter/material.dart';
import 'package:moducnu/presentation/theme/color.dart';
import 'package:sizing/sizing.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 검색 텍스트 필드
          SizedBox(
            width: 0.72.sw,
            // 텍스트필드의 색을 하얀색으로해야햄
            child: TextField(
              decoration: InputDecoration(
                hintText: '학교 장소 검색', // Placeholder text
                hintStyle: TextStyle(color: Colors.grey.shade600, fontSize: 16.0),
                fillColor: Colors.white,
                filled: true,
                focusColor: kSelectedColor,
                // 텍스트 필드에 포커스가 있을 때 보더 색상 설정
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  borderSide: const BorderSide(
                    color: Colors.orange, // 액티브 상태일 때의 보더 색상 (예: 오렌지)
                    width: 0.8,
                  ),
                ),
                // 텍스트 필드가 포커스를 받지 않았을 때의 보더 색상 설정
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  borderSide: BorderSide(
                    color: Colors.grey.shade500, // 비활성 상태일 때의 보더 색상
                    width: 0.8,
                  ),
                ),
              ),
            ),
          ),
          // 텍스트 필드와 버튼 사이의 여백
          const SizedBox(width: 12.0), // 여백 추가
          // 검색 버튼
          GestureDetector(
            onTap: () {
              // TODO: 검색 기능 구현
            },
            child: Container(
              width: 0.14.sw,
              height: 0.14.sw,
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
          ),
        ],
      ),
    );
  }
}
