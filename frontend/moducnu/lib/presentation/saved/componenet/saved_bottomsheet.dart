import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get_it/get_it.dart';
import 'package:moducnu/presentation/saved/componenet/saved_item.dart';
import 'package:moducnu/presentation/saved/save_viewmodel.dart';
import 'package:sizing/sizing.dart';

class SavedBottomsheet extends StatelessWidget {
  final SaveViewmodel viewModel = GetIt.instance<SaveViewmodel>();

  SavedBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (viewModel.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }
      return DraggableScrollableSheet(
        initialChildSize: 0.4, // 처음 보이는 높이 비율
        minChildSize: 0.2, // 최소 높이 비율
        maxChildSize: 0.6, // 최대 높이 비율
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(24),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10.0,
                  offset: Offset(0, -2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 드래그 핸들러
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 8),
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 0.01.sh),
                // 드래그 핸들러와 텍스트 사이의 간격
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  // '저장리스트' 텍스트는 가로 단의 가운데에 위치해야함
                  child: Align(
                    child: Text(
                      '저장 리스트',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Divider(
                    indent: 0.1.sw, endIndent: 0.1.sw, color: Colors.grey[300]),
                Expanded(
                  child: viewModel.savedLocations.isEmpty
                      ? const Center(
                    child: Text(
                      '저장된 장소가 없습니다.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  )
                      : ListView.builder(
                    controller: scrollController, // 스크롤 컨트롤러 연결
                    itemCount: viewModel.savedLocations.length,
                    itemBuilder: (context, index) {
                      return SavedItem(
                        place: viewModel.savedLocations[index],
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      );
    });
  }
}