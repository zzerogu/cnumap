import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:moducnu/data/remote/api/construction/construction_api.dart';
import 'package:moducnu/data/remote/api/disability_support_center/disability_support_center_api.dart';
import 'package:moducnu/data/repository/construction_repositoryImpl.dart';
import 'package:moducnu/data/repository/school_repositoryImpl.dart';
import 'package:moducnu/domain/repository/construction_repository.dart';
import 'package:moducnu/domain/repository/place_repository.dart';
import 'package:moducnu/domain/repository/school_repository.dart';
import 'package:moducnu/domain/usecases/get_all_construction_news_usecase.dart';
import 'package:moducnu/domain/usecases/get_all_support_centers_usecase.dart';
import 'package:moducnu/domain/usecases/get_building_name_by_id_usecase.dart';
import 'package:moducnu/domain/usecases/get_latest_construction_news_usecase.dart';
import 'package:moducnu/presentation/school/component/construction_news_viewmodel.dart';
import 'package:moducnu/presentation/school/component/disabled_center_viewmodel.dart';

/*
<의존성 등록 순서>
1. Dio와 같은 네트워크 객체를 먼저 등록 (이건 사전에 일괄적으로 처리할 예정)
2. ConstructionApi와 같은 API 클래스를 등록
3. Repository를 등록하며, 이때 ConstructionApi를 주입
4. UseCase를 등록하며, Repository를 주입
5. 마지막으로 ViewModel을 등록
*/

final getIt = GetIt.instance;

void setupSchoolDependencies() {
  // 1. ConstructionApi 의존성 등록
  getIt.registerSingleton<ConstructionApi>(
    ConstructionApi(getIt<Dio>()),
  );
  getIt.registerSingleton<DisabilitySupportCenterApi>(
    DisabilitySupportCenterApi(getIt<Dio>()),
  );


  // 2. ConstructionRepository 의존성 등록
  getIt.registerLazySingleton<ConstructionRepository>(
        () =>
        ConstructionRepositoryImpl(constructionApi: getIt<ConstructionApi>()),
  );
  getIt.registerLazySingleton<SchoolRepository>(
        () =>
        SchoolRepositoryImpl(disabilitySupportCenterApi: getIt<DisabilitySupportCenterApi>()),
  );

  // 3. UseCase 의존성 등록
  getIt.registerFactory<GetAllConstructionNewsUseCase>(
        () =>
        GetAllConstructionNewsUseCase(
            repository: getIt<ConstructionRepository>()),
  );
  getIt.registerFactory<GetLatestConstructionNewsUseCase>(
        () =>
        GetLatestConstructionNewsUseCase(
            repository: getIt<ConstructionRepository>()),
  );
  getIt.registerFactory<GetAllSupportCentersUseCase>(
      () => GetAllSupportCentersUseCase(
          repository: getIt<SchoolRepository>()));

  getIt.registerFactory<GetBuildingNameByIdUsecase>(
          () => GetBuildingNameByIdUsecase(
              repository: getIt<PlaceRepository>())
  );

  // 4. ViewModel 의존성 등록
  getIt.registerFactory<ConstructionViewModel>(
        () =>
        ConstructionViewModel(
          getAllConstructionNewsUseCase: getIt<GetAllConstructionNewsUseCase>(),
          getLatestConstructionNewsUseCase: getIt<
              GetLatestConstructionNewsUseCase>(),
        ),
  );
  getIt.registerSingleton<DisabledCenterViewModel>(
    DisabledCenterViewModel(
        getAllSupportCentersUseCase: getIt<GetAllSupportCentersUseCase>(),
        getBuildingNameByIdUsecase: getIt<GetBuildingNameByIdUsecase>()),
  );
}
