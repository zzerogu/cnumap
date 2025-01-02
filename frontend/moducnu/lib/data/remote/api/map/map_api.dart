import 'package:dio/dio.dart';
import 'package:moducnu/data/remote/api/parse_error_loger.dart';
import 'package:retrofit/http.dart';

part 'map_api.g.dart';

@RestApi()
abstract class MapApi {
  factory MapApi(Dio dio, {String baseUrl}) = _MapApi;

  // /api/map/tiles/{z}/{x}/{y}.pbf
  @GET("/api/map/tiles/{z}/{x}/{y}.pbf")
  Future getTile(
      @Path("z") int zoomLevel,
      @Path("x") int tileX,
      @Path("y") int tileY,
      );

  // // /api/user/location
  // @GET("/api/user/location")
  // Future<UserLocationResponseDto> getUserLocation();
}
