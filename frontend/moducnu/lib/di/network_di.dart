import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

final getIt = GetIt.instance;

void setupNetworkDependencies() {
  // Dio 설정 및 등록
  getIt.registerSingleton<Dio>(
    Dio(BaseOptions(
      // TODO: 여기 서버 API 주소로 변경
      baseUrl: "https://yourapi.com",
      headers: {
        "Content-Type": "application/json",
      },
    )),
  );
}