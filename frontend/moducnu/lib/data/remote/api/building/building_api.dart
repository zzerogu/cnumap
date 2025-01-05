import 'package:dio/dio.dart';
import 'package:moducnu/data/remote/api/parse_error_loger.dart';
import 'package:moducnu/data/remote/dto/building/building_dto.dart';
import 'package:retrofit/http.dart';

part 'building_api.g.dart';

@RestApi()
abstract class BuildingApi {
  factory BuildingApi(Dio dio, {String baseUrl}) = _BuildingApi;

  @GET("/api/building")
  Future<List<BuildingDetailResponseDto>> getBuildingsByName(
      @Query("name") String name);

  /// Retrieve building categories.
  @GET("/api/building/category")
  Future<List<BuildingDetailResponseDto>> getBuildingCategories(
      @Query("category") String category);

  /// Retrieve building tags.
  @GET("/api/building/tag")
  Future<List<BuildingDetailResponseDto>> getBuildingTags(
      @Query("tag") String tag);

  /// Retrieve all buildings.
  @GET("/api/buildings")
  Future<List<BuildingDetailResponseDto>> getAllBuildings();

  /// Retrieve a specific building by its ID.
  @GET("/api/buildings/{id}")
  Future<BuildingDetailResponseDto> getBuildingById(@Path("id") int id);

  @GET("/api/buildings_node/{node_id}")
  Future<BuildingFullResponseDto> getBuildingByNodeId(
      @Path("node_id") String nodeId);
}
