import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get_it/get_it.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:moducnu/navigation/main_navigation_page.dart';
import 'package:moducnu/presentation/map/map_page.dart';
import 'package:moducnu/presentation/saved/save_page.dart';
import 'package:moducnu/presentation/school/school_page.dart';
import 'package:moducnu/presentation/timetable/time_page.dart';
import 'package:sizing/sizing_builder.dart';
import 'di/service_locator.dart';
import 'domain/model/User.dart';
import 'domain/usecases/auto_login_usecase.dart';
import 'presentation/auth/login_page.dart';

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
    return SizingBuilder(
      builder: () => GetMaterialApp(
        color: Colors.white,
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        initialRoute: '/', // 초기 경로를 '/'로 설정
        getPages: [
          GetPage(name: '/', page: () => _initialScreen()), // 초기 경로 설정
          GetPage(name: '/login', page: () => LoginPage()), // 로그인 화면 경로
          GetPage(name: '/main', page: () => const MainNavigationPage()), // 메인 화면 경로
          GetPage(name: '/map', page: () => const MapPage()), // 채팅 화면 경로
          GetPage(name: '/school', page: () => const SchoolPage()), // 퀘스트 화면 경로
          GetPage(name: '/save', page: () => const SavePage()),
          GetPage(name: '/timetable', page: () => const TimetablePage())
        ],
      ),
    );
  }

  // 초기 화면 결정 함수 (자동 로그인 체크)
  Widget _initialScreen() {
    return FutureBuilder<User?>(
      future: _checkAutoLogin(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData && snapshot.data != null) {
          return const MainNavigationPage(); // 자동 로그인 성공 시 메인 화면으로 이동
        } else {
          return LoginPage(); // 자동 로그인 실패 시 로그인 화면으로 이동
        }
      },
    );
  }

  // 자동 로그인 체크 함수
  // - 현재는 null 을 리턴하도록 함 (TODO 해당 파트 추후 구현 필요)
  Future<User?> _checkAutoLogin() async {
    final autologinUsecase = GetIt.instance<AutoLoginUseCase>();
    return await autologinUsecase.execute();
  }
}

