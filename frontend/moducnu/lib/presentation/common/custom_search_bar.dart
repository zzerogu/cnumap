import 'package:flutter/material.dart';
import 'package:moducnu/presentation/map/search_viewmodel.dart';
import 'package:moducnu/presentation/theme/color.dart';
import 'package:sizing/sizing.dart';

class CustomSearchBar extends StatelessWidget {
  final bool hasShadow;
  final VoidCallback? onTap;
  final bool readOnly; // 텍스트 입력 비활성화 여부
  final SearchViewModel? viewModel; // ViewModel 주입

  const CustomSearchBar({
    super.key,
    this.hasShadow = true,
    this.onTap,
    this.readOnly = false, // 기본값: 텍스트 입력 가능
    this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return GestureDetector(
      onTap: readOnly ? onTap : null, // readOnly가 false일 때는 탭 이벤트를 무시
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: hasShadow
              ? [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ]
              : [],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 0.72.sw, // 화면 너비의 72%를 사용
              child: TextField(
                controller: controller,
                cursorColor: Colors.grey.shade400,
                readOnly: readOnly, // readOnly 여부 설정
                onTap: () {
                  if (readOnly && onTap != null) {
                    onTap!(); // readOnly가 true일 때 onTap 호출
                  }
                },
                onChanged: (value) {
                  if (!readOnly && viewModel != null) {
                    viewModel!.searchPlaces(value); // 검색어 변경 시 ViewModel 호출
                  }
                },
                decoration: InputDecoration(
                  hintText: '학교 장소 검색',
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 14.0, // 텍스트 필드 내부 위아래 여백 줄임
                    horizontal: 12.0, // 기본 좌우 여백 유지
                  ),
                  border: hasShadow
                      ? OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.0),
                          borderSide: BorderSide.none, // 테두리 없음
                        )
                      : null, // 기본 테두리는 enabledBorder로 대체
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0),
                    borderSide: const BorderSide(
                      color: Color.fromRGBO(169, 169, 169, 1.0), // 적당한 회색
                      width: 0.6, // 테두리 두께
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0),
                    borderSide: const BorderSide(
                      color:
                          Color.fromRGBO(100, 100, 100, 1.0), // 포커스 상태 연한 검정색
                      width: 0.8,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12.0),
            GestureDetector(
              onTap: onTap,
              child: Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Icon(Icons.search, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
