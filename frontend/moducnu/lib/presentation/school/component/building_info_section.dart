import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:moducnu/domain/model/place.dart';
import 'package:moducnu/presentation/school/component/section_title.dart';
import 'package:moducnu/presentation/theme/color.dart';

import '../../../di/place_di.dart';
import 'building_info_viewmodel.dart';


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


class BuildingList extends StatelessWidget {
  const BuildingList({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = getIt<BuildingInfoViewModel>();
    viewModel.init();

    return Obx(() {
      if (viewModel.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (viewModel.errorMessage.isNotEmpty) {
        return Center(child: Text(viewModel.errorMessage.value));
      }

      if (viewModel.buildings.isEmpty) {
        return const Center(child: Text('건물 데이터를 찾을 수 없습니다.'));
      }

      // 데이터를 3개의 페이지로 나누기
      final groupSize = (viewModel.buildings.length / 20).ceil();
      final List<List<Place>> buildingPages = List.generate(
        18,
            (index) {
          final start = index * groupSize;
          final end = (start + groupSize).clamp(0, viewModel.buildings.length);
          return viewModel.buildings.sublist(start, end);
        },
      );

      return SizedBox(
        height: 320, // 높이 제한 설정
        child: PageView.builder(
          itemCount: buildingPages.length,
          itemBuilder: (context, pageIndex) {
            final buildingsForPage = buildingPages[pageIndex];
            return Column(
              children: buildingsForPage.map((building) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: BuildingCard(name: building.placeName),
                );
              }).toList(),
            );
          },
        ),
      );
    });
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
            // Handle navigation or click event
          },
        ),
      ),
    );
  }
}