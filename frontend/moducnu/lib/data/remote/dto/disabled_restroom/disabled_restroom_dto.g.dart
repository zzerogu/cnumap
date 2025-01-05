// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'disabled_restroom_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DisabledRestroomResponseDto _$DisabledRestroomResponseDtoFromJson(
        Map<String, dynamic> json) =>
    DisabledRestroomResponseDto(
      buildingId: (json['building_id'] as num).toInt(),
      floor: (json['floor'] as num).toInt(),
      locationDescription: json['location_description'] as String,
      nodeId: json['node_id'] as String,
      restroomId: (json['restroom_id'] as num).toInt(),
    );

Map<String, dynamic> _$DisabledRestroomResponseDtoToJson(
        DisabledRestroomResponseDto instance) =>
    <String, dynamic>{
      'building_id': instance.buildingId,
      'floor': instance.floor,
      'location_description': instance.locationDescription,
      'node_id': instance.nodeId,
      'restroom_id': instance.restroomId,
    };
