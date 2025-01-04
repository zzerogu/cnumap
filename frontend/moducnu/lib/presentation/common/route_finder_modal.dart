import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:moducnu/presentation/common/building_detail_popup.dart';
import 'package:moducnu/presentation/theme/color.dart';
import 'package:moducnu/data/remote/api/navigation/navigation_api.dart';
import 'package:moducnu/data/remote/dto/navigation/navigation_dto.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:dio/dio.dart';

/// 경사로 데이터 모델 (nodeId + locationDescription)
class Ramp {
  final String nodeId;
  final String locationDescription;

  Ramp({required this.nodeId, required this.locationDescription});
}

class RouteFinderModal extends StatefulWidget {
  final String title;
  final String buildingName;
  final int buildingId;
  final String nodeId;
  final List<Ramp> ramps; // ✅ Ramp 모델 사용
  final Function(List<Position>) onRouteDraw;
  final Function(List<BuildingFeature>) onRampMarkersAdded; // ✅ 추가
  final Function(List<BuildingFeature>, String) onRampFocused;

  const RouteFinderModal({
    Key? key,
    required this.title,
    required this.buildingName,
    required this.buildingId,
    required this.nodeId,
    required this.ramps, // ✅ 수정됨
    required this.onRouteDraw,
    required this.onRampMarkersAdded,
    required this.onRampFocused,
  }) : super(key: key);

  static Future<void> showModal(
    BuildContext context, {
    required String title,
    required String buildingName,
    required int buildingId,
    required String nodeId,
    required List<Ramp> ramps, // ✅ 수정됨
    required Function(List<Position>) onRouteDraw,
    required Function(List<BuildingFeature>) onRampMarkersAdded, // ✅ 추가
    required Function(List<BuildingFeature>, String) onRampFocused, // ✅ 추가
  }) async {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => RouteFinderModal(
          title: title,
          buildingName: buildingName,
          buildingId: buildingId,
          nodeId: nodeId,
          ramps: ramps, // ✅ 수정됨
          onRouteDraw: onRouteDraw,
          onRampMarkersAdded: onRampMarkersAdded,
          onRampFocused: onRampFocused),
    );
  }

  @override
  State<RouteFinderModal> createState() => _RouteFinderModalState();
}

class _RouteFinderModalState extends State<RouteFinderModal> {
  TextEditingController startController = TextEditingController(text: "내 위치");
  TextEditingController endController = TextEditingController();
  String? selectedRampNodeId; // ✅ 선택된 경사로의 nodeId만 저장
  final Dio dio = Dio();
  final _baseUrl = "http://localhost:8000";
  late final NavigationApi navigationApi =
      NavigationApi(dio, baseUrl: _baseUrl);

  @override
  void initState() {
    super.initState();
    endController.text = widget.buildingName;

    // ✅ 모달 창이 켜질 때, 램프 마커를 추가
    final List<BuildingFeature> buildingFeatures = widget.ramps.map((ramp) {
      return BuildingFeature(
        featureName: "Ramp",
        isAvailable: true,
        featureId: int.tryParse(ramp.nodeId) ?? 0,
        buildingId: widget.buildingId,
        nodeId: ramp.nodeId,
        floor: 1,
        locationDescription: ramp.locationDescription,
      );
    }).toList();

    widget.onRampMarkersAdded(buildingFeatures);
  }

  /// ✅ 경로 안내 요청 함수
  Future<void> _requestRoute() async {
    if (selectedRampNodeId == null) {
      print("경사로를 선택해주세요.");
      return;
    }

    try {
      // 1️⃣ 선택한 경사로의 위도/경도 가져오기
      final destinationCoordinate =
          await navigationApi.getNodeCoordinates(selectedRampNodeId!);

      // 2️⃣ 출발지 좌표 (고정값 사용)
      final startCoordinate =
          CoordinateDto(latitude: 36.364029, longitude: 127.344919);

      // 3️⃣ 경로 요청 객체 생성
      final routeRequest = RouteRequestDto(
        start: startCoordinate,
        end: destinationCoordinate,
        wheelchairVersion: WheelchairVersion.standardWheelchair,
      );

      // 4️⃣ 경로 요청 API 호출
      final routeResponse = await navigationApi.calculateRoute(routeRequest);
      // 5️⃣ 경로 데이터를 디코딩하고 그리기
      final decodedRoute = routeResponse.route
          .map(
            (coord) => Position(coord.longitude, coord.latitude),
          )
          .toList();

      widget.onRouteDraw(decodedRoute); // ✅ 경로 그리기 함수 호출
      Navigator.pop(context);
      print(
          "경로 안내 결과: 거리 = ${routeResponse.distance}, 소요 시간 = ${routeResponse.duration}");
    } catch (e) {
      print("경로 요청 실패: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          color: kbackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            const SizedBox(height: 16),
            _buildRouteInputs(startController, endController),
            const SizedBox(height: 16),
            _buildRampSelector(), // ✅ 경사로 선택 추가
            const SizedBox(height: 16),
            _buildGuideButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            widget.title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.close, size: 24, color: Colors.grey),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }

  Widget _buildRouteInputs(TextEditingController startController,
      TextEditingController endController) {
    return Column(
      children: [
        _buildInputField(
          icon: Icons.accessible,
          controller: startController,
          hintText: '출발지 입력',
          isActive: false,
        ),
        const SizedBox(height: 8),
        _buildInputField(
          icon: Icons.location_on,
          controller: endController,
          hintText: '도착지 입력',
          isActive: true,
        ),
      ],
    );
  }

  Widget _buildInputField({
    required IconData icon,
    required TextEditingController controller,
    required String hintText,
    required bool isActive,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: isActive ? Colors.blue : Colors.grey),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey.shade400),
        suffixIcon: const Icon(Icons.search, color: Colors.orange),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  /// ✅ 경사로 선택 (locationDescription 사용, nodeId 저장)
  Widget _buildRampSelector() {
    if (widget.ramps.isEmpty) {
      return const Text("등록된 경사로가 없습니다.");
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "경사로 선택",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8.0,
          children: widget.ramps.map((ramp) {
            return ChoiceChip(
              label: Text(ramp.locationDescription), // ✅ locationDescription 표시
              selected: selectedRampNodeId == ramp.nodeId,
              onSelected: (isSelected) {
                setState(() {
                  selectedRampNodeId = isSelected ? ramp.nodeId : null;
                });

                // ✅ 특정 램프 선택 시 포커스 적용
                final selectedFeature = widget.ramps.map((ramp) {
                  return BuildingFeature(
                    featureName: "Ramp",
                    isAvailable: true,
                    featureId: int.tryParse(ramp.nodeId) ?? 0,
                    buildingId: widget.buildingId,
                    nodeId: ramp.nodeId,
                    floor: 1,
                    locationDescription: ramp.locationDescription,
                  );
                }).toList();

                if (selectedRampNodeId != null) {
                  widget.onRampFocused(selectedFeature, selectedRampNodeId!);
                }
              },
              selectedColor: Colors.blueAccent,
              labelStyle: TextStyle(
                  color: selectedRampNodeId == ramp.nodeId
                      ? Colors.white
                      : Colors.black),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildGuideButton() {
    return Center(
      child: ElevatedButton(
        onPressed: _requestRoute,
        style: ElevatedButton.styleFrom(
          backgroundColor: kButtonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          child: Text(
            '안내 받기',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
