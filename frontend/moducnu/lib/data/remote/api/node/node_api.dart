import 'package:dio/dio.dart';
import 'package:moducnu/data/remote/dto/node/node_dto.dart';
import 'package:retrofit/http.dart';

part 'node_api.g.dart';

@RestApi()
abstract class NodeApi {
  factory NodeApi(Dio dio, {String baseUrl}) = _NodeApi;

  // TODO: NodeResponseDto 변경 필요
  @GET("/api/nodes/{node_id}")
  Future<NodeResponseDto> getNodeData(
      @Path("node_id") int nodeId,
      @Query("table") String tableName,
      );
}
