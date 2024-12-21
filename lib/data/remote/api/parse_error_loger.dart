import 'package:dio/dio.dart';

class ParseErrorLogger {
  void logError(Object error, StackTrace stackTrace, RequestOptions options) {
    // 로깅 구현
    print('Error: $error');
    print('StackTrace: $stackTrace');
    print('Request: ${options.uri}');
  }
}