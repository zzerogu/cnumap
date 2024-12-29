import 'package:get/get.dart';
import 'package:moducnu/domain/usecases/login_usecase.dart';


class LoginViewModel extends GetxController {
  final LoginUseCase loginUseCase;

  // Rx 상태 변수 선언
  var loginStatus = ''.obs;
  var isLoading = false.obs;

  LoginViewModel(this.loginUseCase);

  Future<void> login(String accountId, String password) async {
    isLoading.value = true; // 로딩 상태 활성화
    try {
      // UseCase를 사용하여 로그인 로직 실행
      final user = await loginUseCase.execute(accountId, password);
      loginStatus.value = "Welcome, ${user.name}!"; // 성공 메시지 업데이트
    } catch (error) {
      loginStatus.value = "Login Failed: ${error.toString()}"; // 에러 메시지 업데이트
    } finally {
      isLoading.value = false; // 로딩 상태 비활성화
    }
  }
}
