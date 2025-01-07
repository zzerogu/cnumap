import 'package:flutter/material.dart';
import 'package:moducnu/presentation/theme/color.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:moducnu/domain/model/building.dart';
import 'package:moducnu/presentation/theme/color.dart';
import 'building_detail_viewmodel.dart';

class BuildingDetailPage extends StatelessWidget {
  final int buildingId; // buildingId를 전달받음
  final BuildingDetailViewmodel viewModel = GetIt.instance<BuildingDetailViewmodel>();

  BuildingDetailPage({super.key, required this.buildingId}) {
    viewModel.fetchBuildingDetail(buildingId); // 초기화 시 데이터 로드
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() {
          final building = viewModel.building.value;
          return Text(building?.name ?? '건물 상세 정보');
        }),
        backgroundColor: kBackgroundColor,
      ),
      backgroundColor: kBackgroundColor,
      body: Obx(() {
        if (viewModel.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (viewModel.errorMessage.isNotEmpty) {
          return Center(child: Text(viewModel.errorMessage.value));
        }

        final building = viewModel.building.value;
        if (building == null) {
          return const Center(child: Text('건물 데이터를 찾을 수 없습니다.'));
        }

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildFloorSelector(building),
                const SizedBox(height: 20.0),
                _buildFloorPlan(building),
                const SizedBox(height: 40.0),
                _buildFacilityInfo(context, building),
              ],
            ),
          ),
        );
      }),
    );
  }


  Widget _buildFloorSelector(Building building) {
    // Building 데이터를 기반으로 층수 리스트 생성
    final List<FloorPlan> defaultFloorPlans = [];

    // 지하층 추가
    if (building.basementFloors != null && building.basementFloors! > 0) {
      for (int i = 1; i <= building.basementFloors!; i++) {
        defaultFloorPlans.add(
          FloorPlan(floorNumber: -i, imagePath: 'assets/images/floor_basement_$i.png'),
        );
      }
    }

    // 지상층 추가
    if (building.groundFloors != null && building.groundFloors! > 0) {
      for (int i = 1; i <= building.groundFloors!; i++) {
        defaultFloorPlans.add(
          FloorPlan(floorNumber: i, imagePath: 'assets/images/floor${i}.png'),
        );
      }
    }

    // 옥상층 추가
    if (building.roofFloors != null && building.roofFloors! > 0) {
      for (int i = 1; i <= building.roofFloors!; i++) {
        defaultFloorPlans.add(
          FloorPlan(floorNumber: building.groundFloors! + i, imagePath: 'assets/images/roof_floor_$i.png'),
        );
      }
    }

    // 실제 데이터 또는 기본 데이터 설정
    final displayFloorPlans = building.floorPlans?.isNotEmpty == true
        ? building.floorPlans!
        : defaultFloorPlans;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: displayFloorPlans.map((floorPlan) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: Obx(() {
              final isSelected = viewModel.selectedFloor.value == floorPlan.floorNumber;
              return ElevatedButton(
                onPressed: () => viewModel.selectedFloor.value = floorPlan.floorNumber,
                style: ElevatedButton.styleFrom(
                  backgroundColor: isSelected ? kButtonColor : Colors.white,
                  foregroundColor: isSelected ? Colors.white : kButtonColor,
                ),
                child: Text(
                  floorPlan.floorNumber > 0
                      ? '${floorPlan.floorNumber}층'
                      : 'B${-floorPlan.floorNumber}층', // 지하층은 'B' 접두사 추가
                ),
              );
            }),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildFloorPlan(Building building) {
    final selectedFloor = viewModel.selectedFloor.value;
    final defaultFloorPlans = List.generate(
      5,
          (index) => FloorPlan(floorNumber: index + 1, imagePath: 'assets/images/floor${index + 1}.png'),
    );

    final floorPlan = (building.floorPlans?.isNotEmpty == true
        ? building.floorPlans
        : defaultFloorPlans)
        ?.firstWhere(
          (plan) => plan.floorNumber == selectedFloor,
      orElse: () => FloorPlan(floorNumber: selectedFloor, imagePath: 'assets/images/floor1.png'),
    );

    return Center(
      child: Image.asset(
        floorPlan?.imagePath ?? "assets/images/floor1.png",
        height: 200,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }


  Widget _buildFacilityInfo(BuildContext context, Building building) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '🚧 시설 정보',
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12.0),
        // NOTE: 실제로는 존재하지 않는 데이터
        _buildFacilityItem(context, "휠체어 충전", "불가능"),
        _buildFacilityItem(context, "휠체어 리프트", "없음"),
        // 실제 데이터
        _buildFacilityItem(context, "장애인 화장실", building.disabledRestrooms),
        _buildFacilityItem(context, "승강기", building.elevators),
        _buildFacilityItem(context, "경사로 입구", building.ramps),
      ],
    );
  }

  Widget _buildFacilityItem(BuildContext context, String title, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // 세로로 늘어날 수 있도록 정렬
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // title과 description 사이 공간 조정
            crossAxisAlignment: CrossAxisAlignment.start, // 텍스트 정렬을 위쪽으로
            children: [
              Expanded(
                flex: 2, // title은 상대적으로 적은 공간을 차지
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.grey[430]),
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(width: 10), // 제목과 설명 사이 간격 추가
              Expanded(
                flex: 3, // description은 더 많은 공간을 차지
                child: Text(
                  description,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.right,
                  softWrap: true, // 텍스트를 자동으로 줄바꿈
                  overflow: TextOverflow.visible, // 텍스트가 잘리지 않도록 설정
                ),
              ),
            ],
          ),
        ),
        const Divider(color: Colors.grey),
      ],
    );
  }
}