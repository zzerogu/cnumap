import 'package:dio/dio.dart';
import 'package:moducnu/data/remote/dto/building/building_dto.dart';
import 'package:moducnu/data/remote/dto/construction/construction_dto.dart';
import 'package:retrofit/http.dart';

part 'construction_api.g.dart';

@RestApi()
abstract class ConstructionApi {
  factory ConstructionApi(Dio dio, {String baseUrl}) = _ConstructionApi;

  @GET("api/construction-news")
  Future<List<ConstructionResponseDto>> getAllConstructionNews();
}


