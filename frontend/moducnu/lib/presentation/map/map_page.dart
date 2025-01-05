import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:moducnu/presentation/map/search_page.dart';
import '../common/route_finder_modal.dart';
import '../common/building_detail_popup.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:moducnu/data/remote/api/disabled_restroom/disabled_restroom_api.dart';
import 'package:moducnu/data/remote/api/map/map_api.dart';
import 'package:moducnu/data/remote/api/building/building_api.dart';
import 'package:moducnu/data/remote/api/navigation/navigation_api.dart';
import 'package:moducnu/data/remote/api/ramp/ramp_api.dart';
import 'package:moducnu/presentation/common/category_list.dart';
import 'package:moducnu/presentation/common/custom_search_bar.dart';
import 'package:moducnu/presentation/common/map_component.dart';
import 'package:moducnu/presentation/common/ramp_detail_popup.dart';
import 'package:moducnu/presentation/common/restroom_detail_popup.dart'; // 추가된 import

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late BuildingApi _buildingApi;
  late NavigationApi _navigationApi;
  late RampApi _rampApi;
  late DisabledRestroomApi _disabledRestroomApi;
  late String _baseUrl;
  late String _accessToken;

  final GlobalKey<MapComponentState> _mapComponentKey =
      GlobalKey<MapComponentState>();

  @override
  void initState() {
    super.initState();
    final dio = Dio();
    _baseUrl = "http://localhost:8000/"; // .env에서 타일 서버 URL 가져오기
    _accessToken =
        dotenv.env['MAPBOX_ACCESS_TOKEN'] ?? ""; // .env에서 Access Token 가져오기
    _buildingApi = BuildingApi(dio, baseUrl: _baseUrl); // 사용자 API 설정
    _navigationApi = NavigationApi(dio, baseUrl: _baseUrl); // 사용자 API 설정
    _rampApi = RampApi(dio, baseUrl: _baseUrl); // 사용자 API 설정
    _disabledRestroomApi =
        DisabledRestroomApi(dio, baseUrl: _baseUrl); // 사용자 API 설정
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Map 위젯
          MapComponent(
            key: _mapComponentKey,
            buildingApi: _buildingApi,
            navigationApi: _navigationApi,
            baseUrl: _baseUrl,
            accessToken: _accessToken,
          ),
          // 검색바
          Positioned(
            top: 70.0, // 화면 상단에서 50px 떨어짐
            left: 4.0, // 화면 좌측에서 16px 떨어짐
            right: 4.0, // 화면 우측에서 16px 떨어짐
            child: Column(
              children: [
                CustomSearchBar(
                  hasShadow: true,
                  readOnly: true,
                  onTap: () {
                    Get.to(() => const SearchPage());
                  },
                ),
                const SizedBox(height: 12.0),
                CategoryList(
                  rampApi: _rampApi,
                  disabledRestroomApi: _disabledRestroomApi,
                  navigationApi: _navigationApi,
                  onDisplayMarkers: (coordinates) {
                    _mapComponentKey.currentState?.addMarkers(
                        coordinates); // ✅ MapComponent의 마커 추가 함수 호출
                  },
                )
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'ramp_button', // Hero 태그 추가
            onPressed: () {
              RampDetailPopup.showPopup(context, rampIndex: 0);
            },
            child: const Icon(Icons.accessible),
          ),
          const SizedBox(height: 12.0), // 버튼 사이 간격 추가
          FloatingActionButton(
            heroTag: 'restroom_button', // Hero 태그 추가
            onPressed: () {
              RestroomDetailPopup.showPopup(context, restroomIndex: 0);
            },
            child: const Icon(Icons.wc),
          ),
        ],
      ),
    );
  }
}
