import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:moducnu/data/remote/api/map/map_api.dart';
import 'package:moducnu/data/remote/api/building/building_api.dart';
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
  late String _baseUrl;
  late String _accessToken;

  @override
  void initState() {
    super.initState();
    final dio = Dio();
    _baseUrl = dotenv.env['SERVER_URL'] ??
        "http://localhost:8000"; // .env에서 타일 서버 URL 가져오기
    _accessToken =
        dotenv.env['MAPBOX_ACCESS_TOKEN'] ?? ""; // .env에서 Access Token 가져오기
    _buildingApi = BuildingApi(dio, baseUrl: _baseUrl); // 사용자 API 설정
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Map 위젯
          MapComponent(
            buildingApi: _buildingApi,
            baseUrl: _baseUrl,
            accessToken: _accessToken,
          ),
          // 검색바
          const Positioned(
            top: 70.0,
            left: 4.0,
            right: 4.0,
            child: Column(
              children: [
                CustomSearchBar(),
                SizedBox(height: 12.0),
                CategoryList()
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
