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
