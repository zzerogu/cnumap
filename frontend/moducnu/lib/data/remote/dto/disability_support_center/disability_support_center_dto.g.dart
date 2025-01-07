// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'disability_support_center_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DisabilitySupportCentersResponseDto
    _$DisabilitySupportCentersResponseDtoFromJson(Map<String, dynamic> json) =>
        DisabilitySupportCentersResponseDto(
          buildingId: (json['building_id'] as num).toInt(),
          id: (json['id'] as num).toInt(),
          name: json['name'] as String,
          phoneNumber: json['phone_number'] as String?,
          position: json['position'] as String,
        );

Map<String, dynamic> _$DisabilitySupportCentersResponseDtoToJson(
        DisabilitySupportCentersResponseDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'position': instance.position,
      'phone_number': instance.phoneNumber,
      'building_id': instance.buildingId,
    };
