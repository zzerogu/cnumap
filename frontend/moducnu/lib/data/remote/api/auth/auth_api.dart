import 'package:dio/dio.dart';
import 'package:moducnu/data/remote/api/parse_error_loger.dart';
import 'package:moducnu/data/remote/dto/auth/auth_dto.dart';
import 'package:retrofit/http.dart';

part 'auth_api.g.dart';

@RestApi()
abstract class AuthApi {
  factory AuthApi(Dio dio, {String baseUrl}) = _AuthApi;

  @POST("api/auth/login")
  Future<LoginResponseDto> login(@Body() LoginRequestDto body);

  @POST("api/auth/register")
  Future<UserCreateResponseDto> signUp(@Body() UserCreateRequestDto body);
}
