import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:moducnu/presentation/saved/componenet/saved_bottomsheet.dart';
import 'package:moducnu/presentation/saved/save_viewmodel.dart';
import 'package:moducnu/presentation/theme/color.dart';
import 'package:moducnu/presentation/common/map_component.dart';

class SavePage extends StatefulWidget {
  const SavePage({super.key});

  @override
  _SavePageState createState() => _SavePageState();
}

class _SavePageState extends State<SavePage> {
  final SaveViewmodel viewModel = GetIt.instance<SaveViewmodel>();
  final GlobalKey<MapComponentState> _mapComponentKey =
  GlobalKey<MapComponentState>();

  @override
  void initState() {
    super.initState();
    viewModel.fetchSavedLocations(); // 저장된 장소 데이터 로드
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _addMarkersToMap();
    });
  }

  Future<void> _addMarkersToMap() async {
    if (_mapComponentKey.currentState == null) return;

    final markerData = await viewModel.getMarkerData();
    // 이 마커데이터 : 'latitude': position.latitude,
    //           'longitude': position.longitude,
    //           'name': place.placeName,
    // TODO 이 부분 수정 필요함
    _mapComponentKey.currentState?.addMarkers(markerData, "저장");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: const Text('나의 저장 장소'),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.4),
          child: Container(
            color: kBordercolor, // 보더 색상
            height: 0.8, // 보더 두께
          ),
        ),
      ),
      body: Stack(
        children: [
          // 지도 컴포넌트
          MapComponent(
            key: _mapComponentKey,
            buildingApi: GetIt.instance.get(), // BuildingApi 주입
            navigationApi: GetIt.instance.get(), // NavigationApi 주입
            baseUrl: "http://localhost:8000", // Base URL
            accessToken: dotenv.env['MAPBOX_ACCESS_TOKEN'] ?? "", // Mapbox Access Token
          ),
          // 저장된 장소 목록
          SavedBottomsheet(),
        ],
      ),
    );
  }
}
