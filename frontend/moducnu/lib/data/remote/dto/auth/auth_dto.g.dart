// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponseDto _$LoginResponseDtoFromJson(Map<String, dynamic> json) =>
    LoginResponseDto(
      userId: (json['userId'] as num).toInt(),
      accountId: json['accountId'] as String,
      name: json['name'] as String,
      studentNumber: (json['studentNumber'] as num).toInt(),
    );

Map<String, dynamic> _$LoginResponseDtoToJson(LoginResponseDto instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'accountId': instance.accountId,
      'name': instance.name,
      'studentNumber': instance.studentNumber,
    };

LoginRequestDto _$LoginRequestDtoFromJson(Map<String, dynamic> json) =>
    LoginRequestDto(
      accountId: json['accountId'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$LoginRequestDtoToJson(LoginRequestDto instance) =>
    <String, dynamic>{
      'accountId': instance.accountId,
      'password': instance.password,
    };

UserCreateRequestDto _$UserCreateRequestDtoFromJson(
        Map<String, dynamic> json) =>
    UserCreateRequestDto(
      accountId: json['accountId'] as String,
      name: json['name'] as String,
      studentNumber: (json['studentNumber'] as num).toInt(),
      password: json['password'] as String,
    );

Map<String, dynamic> _$UserCreateRequestDtoToJson(
        UserCreateRequestDto instance) =>
    <String, dynamic>{
      'accountId': instance.accountId,
      'name': instance.name,
      'studentNumber': instance.studentNumber,
      'password': instance.password,
    };

UserCreateResponseDto _$UserCreateResponseDtoFromJson(
        Map<String, dynamic> json) =>
    UserCreateResponseDto(
      userId: (json['userId'] as num).toInt(),
      accountId: json['accountId'] as String,
      name: json['name'] as String,
      studentNumber: (json['studentNumber'] as num).toInt(),
      password: json['password'] as String,
    );

Map<String, dynamic> _$UserCreateResponseDtoToJson(
        UserCreateResponseDto instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'accountId': instance.accountId,
      'name': instance.name,
      'studentNumber': instance.studentNumber,
      'password': instance.password,
    };
