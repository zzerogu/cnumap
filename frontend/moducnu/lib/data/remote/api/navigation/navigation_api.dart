import 'package:dio/dio.dart';
import 'package:moducnu/data/remote/dto/navigation/navigation_dto.dart';
import 'package:retrofit/http.dart';
import 'package:moducnu/data/remote/api/parse_error_loger.dart';

part 'navigation_api.g.dart';

@RestApi()
abstract class NavigationApi {
  factory NavigationApi(Dio dio, {String baseUrl}) = _NavigationApi;

  /// 경로 계산 API
  @POST("/api/navigation/route")
  Future<RouteResponseDto> calculateRoute(
    @Body() RouteRequestDto routeRequest,
  );

  /// node_id를 이용한 좌표 조회 API
  @GET("/api/navigation/node_coordinates/{nodeId}")
  Future<CoordinateDto> getNodeCoordinates(
    @Path("nodeId") String nodeId,
  );
}
