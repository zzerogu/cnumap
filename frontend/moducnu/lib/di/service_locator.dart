import 'package:moducnu/di/school_di.dart';
import 'package:moducnu/di/place_di.dart';
import 'network_di.dart';

void setupDependencies() {
  setupNetworkDependencies(); // Dio 설정 및 등록
  setupPlaceDependencies();
  setupSchoolDependencies();
}