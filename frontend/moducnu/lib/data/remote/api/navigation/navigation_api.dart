import 'package:dio/dio.dart';
import 'package:moducnu/data/remote/dto/navigation/navigation_dto.dart';
import 'package:retrofit/http.dart';

part 'navigation_api.g.dart';

@RestApi()
abstract class NavigationApi {
  factory NavigationApi(Dio dio, {String baseUrl}) = _NavigationApi;

  @POST("/api/navigation/route")
  Future<RouteResponseDto> calculateRoute(
      @Body() RouteRequestDto routeRequest,
      );
}
