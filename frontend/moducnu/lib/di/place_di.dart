import 'package:get_it/get_it.dart';
import 'package:moducnu/data/local/dao/location_data_source.dart';
import 'package:moducnu/data/remote/api/building/building_api.dart';
import 'package:moducnu/data/repository/place_repositoryImpl.dart';
import 'package:moducnu/domain/repository/place_repository.dart';
import 'package:moducnu/domain/usecases/get_all_buildings_usecase.dart';
import 'package:moducnu/domain/usecases/get_place_by_name_usecase.dart';
import 'package:moducnu/domain/usecases/get_places_by_category_usecase.dart';
import 'package:dio/dio.dart';
import 'package:moducnu/presentation/map/search_viewmodel.dart';
import 'package:moducnu/presentation/school/component/building_info_viewmodel.dart';

/*
<의존성 등록 순서>
1. Dio와 같은 네트워크 객체를 먼저 등록 (이건 사전에 일괄적으로 처리할 예정)
2. BuildingApi와 같은 API 클래스를 등록
3. Repository를 등록하며, 이때 BuildingApi를 주입
4. UseCase를 등록하며, Repository를 주입
5. 마지막으로 ViewModel을 등록
*/

final getIt = GetIt.instance;

void setupPlaceDependencies() {
  // 1. BuildingApi 의존성 등록
  getIt.registerSingleton<BuildingApi>(
    BuildingApi(getIt<Dio>()),
  );

  // 2. LocationDataSource 의존성 등록
  getIt.registerLazySingleton<LocationDataSource>(
        () => LocationDataSourceImpl(),
  );


  // 3. PlaceRepository 의존성 등록
  getIt.registerLazySingleton<PlaceRepository>(
        () => PlaceRepositoryImpl(
      getIt<BuildingApi>(),
      getIt<LocationDataSource>(),
    ),
  );

  // 4. UseCase 의존성 등록
  getIt.registerFactory<GetPlacesByNameUseCase>(
        () => GetPlacesByNameUseCase(getIt<PlaceRepository>()),
  );
  getIt.registerFactory<GetPlacesByCategoryUseCase>(
        () => GetPlacesByCategoryUseCase(getIt<PlaceRepository>()),
  );
  getIt.registerFactory<GetAllBuildingsUsecase>(
        () => GetAllBuildingsUsecase(getIt<PlaceRepository>()),
  );

  // 5. ViewModel 의존성 등록
  getIt.registerFactory<SearchViewModel>(
        () => SearchViewModel(
      getPlacesByNameUseCase: getIt<GetPlacesByNameUseCase>(),
      getPlacesByCategoryUseCase: getIt<GetPlacesByCategoryUseCase>(),
    ),
  );
  getIt.registerFactory<BuildingInfoViewModel>(
        () => BuildingInfoViewModel(getIt<GetAllBuildingsUsecase>()),
  );
}

