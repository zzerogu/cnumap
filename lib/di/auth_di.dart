import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:moducnu/data/remote/api/auth/auth_api.dart';
import 'package:moducnu/data/repository/auth_repositoryimpl.dart';
import 'package:moducnu/domain/repository/auth_repository.dart';
import 'package:moducnu/domain/usecases/auto_login_usecase.dart';
import 'package:moducnu/domain/usecases/login_usecase.dart';
import 'package:moducnu/presentation/auth/login_viewmodel.dart';

/*
<의존성 등록 순서>
의존성은 반드시 다음의 순서대로 등록되어야 힘
1. Dio와 같은 네트워크 객체를 먼저 등록 (이건 사전에 일괄적으로 처리할 예정)
2. AuthApi와 같은 API 클래스를 등록
3. Repository를 등록하며, 이때 AuthApi를 주입
4. UseCase를 등록하며, Repository를 주입
5. 마지막으로 ViewModel을 등록
 */

final getIt = GetIt.instance;

void setupAuthDependencies() {
  //1.  AuthApi 의존성 등록
  getIt.registerSingleton<AuthApi>(
    AuthApi(getIt<Dio>()),
  );
  // 2. AuthRepository 의존성 등록
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(getIt<AuthApi>()));
  // 3. UseCase 의존성 등록
  getIt.registerFactory<LoginUseCase>(() => LoginUseCase(getIt<AuthRepository>()));
  getIt.registerFactory<AutoLoginUseCase>(() => AutoLoginUseCase(getIt<AuthRepository>()));
  // 4. ViewModel 의존성 등록
  getIt.registerFactory<LoginViewModel>(() => LoginViewModel(getIt<LoginUseCase>()));
}

