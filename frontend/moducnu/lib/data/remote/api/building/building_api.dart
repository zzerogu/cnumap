import 'package:dio/dio.dart';
import 'package:moducnu/data/remote/dto/building/building_dto.dart';
import 'package:retrofit/http.dart';

part 'building_api.g.dart';

@RestApi()
abstract class BuildingApi {
  factory BuildingApi(Dio dio, {String baseUrl}) = _BuildingApi;

  @GET("api/building")
  Future<List<BuildingResponseDto>> getBuildingsByName(@Query("name") String name);

  /// Retrieve building categories.
  @GET("api/building/category")
  Future<List<BuildingResponseDto>> getBuildingCategories(@Query("category") String category);

  /// Retrieve building tags.
  @GET("api/building/tag")
  Future<List<BuildingResponseDto>> getBuildingTags(@Query("tag") String tag);

  /// Retrieve all buildings.
  @GET("api/buildings")
  Future<List<BuildingDetailResponseDto>> getAllBuildings();

  /// Retrieve a specific building by its ID.
  @GET("api/buildings/{id}")
  Future<BuildingDetailResponseDto> getBuildingById(@Path("id") int id);

}


