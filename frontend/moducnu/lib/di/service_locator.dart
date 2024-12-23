import 'auth_di.dart';
import 'network_di.dart';

void setupDependencies() {
  setupNetworkDependencies(); // Dio 설정 및 등록
  setupAuthDependencies(); // Auth 관련 의존성 등록
}