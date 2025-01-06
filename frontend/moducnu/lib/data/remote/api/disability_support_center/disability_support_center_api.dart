import 'package:dio/dio.dart';
import 'package:moducnu/data/remote/api/parse_error_loger.dart';
import 'package:moducnu/data/remote/dto/disability_support_center/disability_support_center_dto.dart';
import 'package:retrofit/http.dart';

part 'disability_support_center_api.g.dart';


@RestApi()
abstract class DisabilitySupportCenterApi {
  factory DisabilitySupportCenterApi(Dio dio, {String baseUrl}) = _DisabilitySupportCenterApi;

  @GET("/disability_support_centers")
  Future<List<DisabilitySupportCentersResponseDto>> getAllSupportCenters();
}
