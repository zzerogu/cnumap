import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:moducnu/navigation/main_navigation_page.dart';
import 'di/service_locator.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env"); // .env 파일 로드
  setupDependencies(); // 모든 의존성 등록
  MapboxOptions.setAccessToken(dotenv.env["MAPBOX_ACCESS_TOKEN"]!); // Mapbox 액세스 토큰 설정
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      home: MainNavigationPage(),
    );
  }
}

