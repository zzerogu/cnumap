import 'package:flutter/material.dart';
import 'package:moducnu/data/remote/api/disabled_restroom/disabled_restroom_api.dart';
import 'package:moducnu/data/remote/api/navigation/navigation_api.dart';
import 'package:moducnu/data/remote/api/ramp/ramp_api.dart';
import 'package:moducnu/data/remote/dto/navigation/navigation_dto.dart';
import 'category_chip.dart';

class CategoryList extends StatefulWidget {
  final RampApi rampApi;
  final DisabledRestroomApi disabledRestroomApi;
  final NavigationApi navigationApi;
  final Function(List<CoordinateDto>) onDisplayMarkers; // ✅ 마커 추가 콜백

  const CategoryList({
    Key? key,
    required this.rampApi,
    required this.disabledRestroomApi,
    required this.navigationApi,
    required this.onDisplayMarkers, // ✅ 콜백 추가
  }) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int? activeIndex;

  final List<String> categories = ['화장실', '경사로'];

  /// ✅ nodeId를 기반으로 경도, 위도를 가져오는 함수
  Future<List<CoordinateDto>> _fetchCoordinatesByNodeIds(
      List<String> nodeIds) async {
    List<CoordinateDto> coordinates = [];
    for (var nodeId in nodeIds) {
      try {
        final coordinate =
            await widget.navigationApi.getNodeCoordinates(nodeId.toString());
        coordinates.add(coordinate);
      } catch (e) {
        print('Failed to fetch coordinates for nodeId $nodeId: $e');
      }
    }
    return coordinates;
  }

  /// ✅ 카테고리 클릭 시 마커 추가를 위한 데이터 요청 로직
  Future<void> _fetchMarkers(String category) async {
    List<String> nodeIds = [];
    List<CoordinateDto> coordinates = [];
    try {
      if (category == '화장실') {
        final restrooms = await widget.disabledRestroomApi.getAllRestrooms();
        nodeIds = restrooms.map((restroom) => restroom.nodeId).toList();
      } else if (category == '경사로') {
        final ramps = await widget.rampApi.getAllRamps();
        nodeIds = ramps.map((ramp) => ramp.nodeId).toList();
      }

      // ✅ nodeId로 좌표 요청
      coordinates = await _fetchCoordinatesByNodeIds(nodeIds);

      // ✅ 마커 추가 콜백 실행
      widget.onDisplayMarkers(coordinates);
    } catch (e) {
      print('Failed to fetch markers for $category: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          const SizedBox(width: 16),
          MyPlaceCategoryChip(
            isActive: activeIndex == -1,
            onTap: () {
              setState(() {
                activeIndex = activeIndex == -1 ? null : -1;
              });
            },
          ),
          const SizedBox(width: 6),
          ...List.generate(categories.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(right: 4.0),
              child: CategoryChip(
                label: categories[index],
                isActive: activeIndex == index,
                onTap: () async {
                  setState(() {
                    activeIndex = activeIndex == index ? null : index;
                  });
                  await _fetchMarkers(categories[index]);
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}
