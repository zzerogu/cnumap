// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ramp_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RampResponseDto _$RampResponseDtoFromJson(Map<String, dynamic> json) =>
    RampResponseDto(
      buildingId2: (json['building_id2'] as num).toInt(),
      floor: (json['floor'] as num).toInt(),
      locationDescription: json['location_description'] as String,
      nodeId: (json['node_id'] as num).toInt(),
      rampId: (json['ramp_id'] as num).toInt(),
    );

Map<String, dynamic> _$RampResponseDtoToJson(RampResponseDto instance) =>
    <String, dynamic>{
      'building_id2': instance.buildingId2,
      'floor': instance.floor,
      'location_description': instance.locationDescription,
      'node_id': instance.nodeId,
      'ramp_id': instance.rampId,
    };
