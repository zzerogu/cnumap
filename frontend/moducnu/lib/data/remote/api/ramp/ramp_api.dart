import 'package:dio/dio.dart';
import 'package:moducnu/data/remote/api/parse_error_loger.dart';
import 'package:moducnu/data/remote/dto/ramp/ramp_dto.dart';
import 'package:retrofit/http.dart';

part 'ramp_api.g.dart';

@RestApi()
abstract class RampApi {
  factory RampApi(Dio dio, {String baseUrl}) = _RampApi;

  @GET("/api/ramps")
  Future<List<RampResponseDto>> getAllRamps();
}
