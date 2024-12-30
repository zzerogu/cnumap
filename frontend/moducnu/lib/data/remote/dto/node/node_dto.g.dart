// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'node_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NodeResponseDto _$NodeResponseDtoFromJson(Map<String, dynamic> json) =>
    NodeResponseDto(
      nodeId: (json['nodeId'] as num).toInt(),
      table: json['table'] as String,
      data: json['data'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$NodeResponseDtoToJson(NodeResponseDto instance) =>
    <String, dynamic>{
      'nodeId': instance.nodeId,
      'table': instance.table,
      'data': instance.data,
    };
