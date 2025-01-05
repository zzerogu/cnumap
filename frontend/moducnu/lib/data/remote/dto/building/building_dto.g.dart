// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'building_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BuildingResponseDto _$BuildingResponseDtoFromJson(Map<String, dynamic> json) =>
    BuildingResponseDto(
      alias: json['alias'] as String,
      buildingId: (json['building_id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$BuildingResponseDtoToJson(
        BuildingResponseDto instance) =>
    <String, dynamic>{
      'alias': instance.alias,
      'building_id': instance.buildingId,
      'name': instance.name,
    };

BuildingDetailResponseDto _$BuildingDetailResponseDtoFromJson(
        Map<String, dynamic> json) =>
    BuildingDetailResponseDto(
      address: json['address'] as String,
      alias: json['alias'] as String,
      basementFloors: (json['basement_floors'] as num).toInt(),
      buildingId: (json['building_id'] as num).toInt(),
      category: json['category'] as String,
      groundFloors: (json['ground_floors'] as num).toInt(),
      name: json['name'] as String,
      nodeId: json['node_id'] as String,
      phoneNumber: json['phone_number'] as String,
      roofFloors: (json['roof_floors'] as num).toInt(),
      tags: json['tags'] as String,
    );

Map<String, dynamic> _$BuildingDetailResponseDtoToJson(
        BuildingDetailResponseDto instance) =>
    <String, dynamic>{
      'address': instance.address,
      'alias': instance.alias,
      'basement_floors': instance.basementFloors,
      'building_id': instance.buildingId,
      'category': instance.category,
      'ground_floors': instance.groundFloors,
      'name': instance.name,
      'node_id': instance.nodeId,
      'phone_number': instance.phoneNumber,
      'roof_floors': instance.roofFloors,
      'tags': instance.tags,
    };

BuildingFullResponseDto _$BuildingFullResponseDtoFromJson(
        Map<String, dynamic> json) =>
    BuildingFullResponseDto(
      building: BuildingDetailResponseDto.fromJson(
          json['building'] as Map<String, dynamic>),
      disabledRestrooms: (json['disabled_restrooms'] as List<dynamic>)
          .map((e) => RestroomDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      elevators: (json['elevators'] as List<dynamic>)
          .map((e) => ElevatorDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      ramps: (json['ramps'] as List<dynamic>)
          .map((e) => RampDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BuildingFullResponseDtoToJson(
        BuildingFullResponseDto instance) =>
    <String, dynamic>{
      'building': instance.building,
      'disabledRestrooms': instance.disabledRestrooms,
      'elevators': instance.elevators,
      'ramps': instance.ramps,
    };

RestroomDto _$RestroomDtoFromJson(Map<String, dynamic> json) => RestroomDto(
      restroomId: (json['restroom_id'] as num?)?.toInt() ?? 0, // null check 추가
      buildingId: (json['building_id'] as num?)?.toInt() ?? 0,
      nodeId: json['node_id'] as String? ?? '', // null check 추가
      floor: (json['floor'] as num?)!.toInt(), // nullable 적용
      locationDescription:
          json['location_description'] as String? ?? '위치 정보 없음',
    );

Map<String, dynamic> _$RestroomDtoToJson(RestroomDto instance) =>
    <String, dynamic>{
      'restroom_id': instance.restroomId,
      'building_id': instance.buildingId,
      'node_id': instance.nodeId,
      'floor': instance.floor,
      'location_description': instance.locationDescription,
    };

ElevatorDto _$ElevatorDtoFromJson(Map<String, dynamic> json) => ElevatorDto(
      elevatorId: (json['elevator_id'] as num?)?.toInt() ?? 0,
      buildingId: (json['building_id'] as num?)?.toInt() ?? 0,
      nodeId: json['node_id'] as String? ?? '',
      locationDescription:
          json['location_description'] as String? ?? '위치 정보 없음',
    );

Map<String, dynamic> _$ElevatorDtoToJson(ElevatorDto instance) =>
    <String, dynamic>{
      'elevator_id': instance.elevatorId,
      'building_id': instance.buildingId,
      'node_id': instance.nodeId,
      'location_description': instance.locationDescription,
    };

RampDto _$RampDtoFromJson(Map<String, dynamic> json) => RampDto(
      rampId: (json['ramp_id'] as num?)?.toInt() ?? 0,
      buildingId: (json['building_id'] as num?)?.toInt() ?? 0,
      nodeId: json['node_id'] as String? ?? '',
      floor: (json['floor'] as num?)!.toInt(),
      locationDescription:
          json['location_description'] as String? ?? '위치 정보 없음',
    );

Map<String, dynamic> _$RampDtoToJson(RampDto instance) => <String, dynamic>{
      'ramp_id': instance.rampId,
      'building_id': instance.buildingId,
      'node_id': instance.nodeId,
      'floor': instance.floor,
      'location_description': instance.locationDescription,
    };
