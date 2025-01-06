import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moducnu/presentation/common/custom_search_bar.dart';
import 'package:moducnu/presentation/common/place_item.dart';
import 'package:moducnu/presentation/map/search_viewmodel.dart';
import '../../di/place_di.dart'; // getIt import

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    // GetIt으로 ViewModel 가져오기
    final SearchViewModel viewModel = getIt<SearchViewModel>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('검색'),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          CustomSearchBar(
            hasShadow: false,
            readOnly: false, // 텍스트 입력 활성화
            viewModel: viewModel, // ViewModel 주입
          ),
          const SizedBox(height: 16.0),
          Expanded(
            child: Obx(() {
              if (viewModel.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (viewModel.error.isNotEmpty) {
                return const Center(
                  child: Text(
                    '오류가 발생했습니다.',
                    style: TextStyle(color: Colors.red),
                  ),
                );
              }
              if (viewModel.places.isEmpty) {
                return const Center(
                  child: Text(
                    '검색 결과가 없습니다.',
                    style: TextStyle(fontSize: 16.0, color: Colors.black54),
                  ),
                );
              }
              return ListView.builder(
                itemCount: viewModel.places.length,
                itemBuilder: (context, index) {
                  return PlaceItem(place: viewModel.places[index]);
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
