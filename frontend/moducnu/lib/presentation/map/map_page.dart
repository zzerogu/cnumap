import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:moducnu/data/remote/api/map/map_api.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:moducnu/presentation/common/custom_search_bar.dart';
import '../common/modal_bottom_sheet.dart'; // ModalBottomSheet 임포트
import 'package:moducnu/presentation/common/map_component.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late MapApi _mapApi;
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
    _mapApi = MapApi(dio, baseUrl: _baseUrl); // 사용자 API 설정
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Map 위젯
          MapComponent(
            mapApi: _mapApi,
            baseUrl: _baseUrl,
            accessToken: _accessToken,
          ),
          // 검색바
          const Positioned(
            top: 56.0, // 화면 상단에서 50px 떨어짐
            child: CustomSearchBar(),
          ),
          // 모달창 열기 버튼
          Positioned(
            bottom: 16.0,
            left: 16.0,
            right: 16.0,
            child: ElevatedButton(
              onPressed: () {
                // ModalBottomSheet 표시
                ModalBottomSheet.showModal(
                  context,
                  '제목', // 제목
                  '부제목', // 부제목
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blueAccent,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text('모달 열기'),
            ),
          ),
        ],
      ),
    );
  }
}
