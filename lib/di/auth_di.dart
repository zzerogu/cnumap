import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:moducnu/data/remote/api/auth/auth_api.dart';

/*
<의존성 등록 순서>
의존성은 반드시 다음의 순서대로 등록되어야 힘
1. Dio와 같은 네트워크 객체를 먼저 등록
2. AuthApi와 같은 API 클래스를 등록
3. Repository를 등록하며, 이때 AuthApi를 주입
4. UseCase를 등록하며, Repository를 주입
5. 마지막으로 ViewModel을 등록
 */

final getIt = GetIt.instance;

void setupAuthDependencies() {
  // AuthApi 의존성 등록
  getIt.registerSingleton<AuthApi>(
    AuthApi(getIt<Dio>()),
  );
  // getIt.registerFactory<LoginUseCase>(() => LoginUseCase(getIt<AuthRepository>()));
  // getIt.registerFactory<SignUpUseCase>(() => SignUpUseCase(getIt<AuthRepository>()));
  // getIt.registerFactory<LoginViewModel>(() => LoginViewModel(loginUseCase: getIt<LoginUseCase>()));
  // getIt.registerFactory<SignupViewModel>(() => SignupViewModel(signUpUseCase: getIt<SignUpUseCase>()));
  // getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(getIt<AuthApi>(), getIt<UserApi>(), prefs));
  // getIt.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(prefs, getIt<UserApi>()));
}

