import 'package:flutter/material.dart';
import 'package:moducnu/presentation/theme/color.dart';

class BuildingDetailPage extends StatefulWidget {
  final String buildingName;

  const BuildingDetailPage({super.key, required this.buildingName});

  @override
  State<BuildingDetailPage> createState() => _BuildingDetailPageState();
}

// 시설 정보 데이터 클래스
class FacilityInfo {
  final String title;
  final String description;

  const FacilityInfo({required this.title, required this.description});
}

// 층별 평면도 데이터 클래스
class FloorPlan {
  final int floorNumber;
  final String imagePath;

  const FloorPlan({required this.floorNumber, required this.imagePath});
}

// 시설 정보 리스트
final List<FacilityInfo> facilities = const [
  FacilityInfo(title: '장애인 화장실', description: '1층 후출입구 쪽'),
  FacilityInfo(title: '승강기', description: '공과대학 5호관 입구쪽'),
  FacilityInfo(title: '휠체어 충전', description: '불가능'),
  FacilityInfo(title: '휠체어 리프트', description: '없음'),
  FacilityInfo(title: '경사로 입구', description: '건물 왼편 및 오른편'),
];

// 층별 평면도 리스트
final List<FloorPlan> floorPlans = const [
  FloorPlan(floorNumber: 1, imagePath: 'assets/images/floor1.png'),
  FloorPlan(floorNumber: 2, imagePath: 'assets/images/floor2.png'),
  FloorPlan(floorNumber: 3, imagePath: 'assets/images/floor3.png'),
  FloorPlan(floorNumber: 4, imagePath: 'assets/images/floor4.png'),
  FloorPlan(floorNumber: 5, imagePath: 'assets/images/floor5.png'),
];

class _BuildingDetailPageState extends State<BuildingDetailPage> {
  int selectedFloor = 1; // 선택된 층수 상태 관리

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(), // 상단 바 구성
      backgroundColor: kBackgroundColor, // 배경색 설정
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildFloorSelector(), // 층 선택 버튼 UI
              const SizedBox(height: 20.0),
              _buildFloorPlan(), // 선택된 층수 평면도 UI
              const SizedBox(height: 40.0),
              _buildFacilityInfo(), // 시설 정보 섹션
            ],
          ),
        ),
      ),
    );
  }

  // 상단 바 구성 메서드
  AppBar _buildAppBar() {
    return AppBar(
      title: Text(widget.buildingName),
      backgroundColor: kBackgroundColor,
    );
  }

  // 층 선택 버튼 UI 구성 메서드
  Widget _buildFloorSelector() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: floorPlans.map((floorPlan) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: ElevatedButton(
              onPressed: () => _selectFloor(floorPlan.floorNumber),
              style: ElevatedButton.styleFrom(
                backgroundColor: _isSelectedFloor(floorPlan.floorNumber)
                    ? kButtonColor
                    : Colors.white,
                foregroundColor: _isSelectedFloor(floorPlan.floorNumber)
                    ? Colors.white
                    : kButtonColor,
              ),
              child: Text('${floorPlan.floorNumber}층'),
            ),
          );
        }).toList(),
      ),
    );
  }

  // 층수 선택 상태 변경 메서드
  void _selectFloor(int floorNumber) {
    setState(() {
      selectedFloor = floorNumber;
    });
  }

  // 선택된 층수 확인 메서드
  bool _isSelectedFloor(int floorNumber) {
    return selectedFloor == floorNumber;
  }

  // 층수에 따른 평면도 UI 구성 메서드
  Widget _buildFloorPlan() {
    return Center(
      child: Container(
        height: 200,
        width: double.infinity,
        color: Colors.grey[300],
        child: Center(
          child: Text('층수 $selectedFloor 평면도'),
        ),
      ),
    );
  }

  // 시설 정보 섹션 UI 구성 메서드
  Widget _buildFacilityInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '🚧 시설 정보',
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10.0),
        ...facilities.map((facility) => _buildFacilityItem(facility)).toList(),
      ],
    );
  }

  // 개별 시설 정보 항목 UI 구성 메서드
  Widget _buildFacilityItem(FacilityInfo facility) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                facility.title,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Colors.grey[430]),
              ),
              Text(
                facility.description,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        const Divider(color: Colors.grey),
      ],
    );
  }
}
