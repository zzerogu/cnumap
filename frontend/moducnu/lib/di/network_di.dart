import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

final getIt = GetIt.instance;

void setupNetworkDependencies() {
  // 플랫폼별로 baseUrl 설정
  String baseUrl;

  if (Platform.isAndroid) {
    baseUrl = "http://10.0.2.2:8000/"; // Android 에뮬레이터
  } else if (Platform.isIOS) {
    baseUrl = "http://127.0.0.1:8000/"; // iOS 시뮬레이터
  } else {
    throw UnsupportedError("이 플랫폼은 지원되지 않습니다."); // 기타 플랫폼 예외 처리
  }

  getIt.registerSingleton<Dio>(
    Dio(BaseOptions(baseUrl: baseUrl)),
  );
}
