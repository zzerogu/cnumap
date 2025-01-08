import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'building_info_viewmodel.dart';

class SchoolSearchBar extends StatelessWidget {
  final bool hasShadow;
  final VoidCallback? onTap;

  const SchoolSearchBar({
    super.key,
    this.hasShadow = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = GetIt.instance<BuildingInfoViewModel>(); // GetIt에서 ViewModel 가져오기
    final TextEditingController controller = TextEditingController();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
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
          Expanded(
            child: TextField(
              controller: controller,
              cursorColor: Colors.grey.shade400,
              onChanged: (value) {
                viewModel.searchBuildings(value); // 검색 실행
              },
              decoration: InputDecoration(
                hintText: '학교 장소 검색',
                hintStyle: const TextStyle(color: Color(0xffA5A5A5), fontSize: 14.0),
                fillColor: Colors.white,
                filled: true,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 12.0,
                ),
                border: hasShadow
                    ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.0),
                  borderSide: BorderSide.none,
                )
                    : null,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.0),
                  borderSide: const BorderSide(
                    color: Color.fromRGBO(169, 169, 169, 1.0),
                    width: 0.6,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.0),
                  borderSide: const BorderSide(
                    color: Color.fromRGBO(100, 100, 100, 1.0),
                    width: 0.8,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12.0),
          GestureDetector(
            onTap: () => viewModel.searchBuildings(controller.text), // 검색 버튼 클릭
            child: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const Icon(Icons.search, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
