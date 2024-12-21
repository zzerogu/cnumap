import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';
part 'auth_dto.g.dart';

@JsonSerializable()
class LoginResponseDto {
  final int userId;
  final String accountId;
  final String name;
  final int studentNumber;

  LoginResponseDto({
    required this.userId,
    required this.accountId,
    required this.name,
    required this.studentNumber,
  });

  factory LoginResponseDto.fromJson(Map<String, dynamic> json) => _$LoginResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseDtoToJson(this);
}

@JsonSerializable()
class LoginRequestDto {
  final String accountId;
  final String password;

  LoginRequestDto({
    required this.accountId,
    required this.password,
  });

  factory LoginRequestDto.fromJson(Map<String, dynamic> json) => _$LoginRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestDtoToJson(this);
}


@JsonSerializable()
class UserCreateRequestDto {
  final String accountId; // 유저 아이디
  final String name; // 유저 이름
  final int studentNumber; // 학번
  final String password; // 비밀번호

  UserCreateRequestDto({
    required this.accountId,
    required this.name,
    required this.studentNumber,
    required this.password,
  });

  factory UserCreateRequestDto.fromJson(Map<String, dynamic> json) => _$UserCreateRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserCreateRequestDtoToJson(this);
}


@JsonSerializable()
class UserCreateResponseDto {
  final int userId;
  final String accountId;
  final String name;
  final int studentNumber;
  final String password;

  UserCreateResponseDto({
    required this.userId,
    required this.accountId,
    required this.name,
    required this.studentNumber,
    required this.password,
  });

  factory UserCreateResponseDto.fromJson(Map<String, dynamic> json) => _$UserCreateResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserCreateResponseDtoToJson(this);
}