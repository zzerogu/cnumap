// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'construction_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConstructionResponseDto _$ConstructionResponseDtoFromJson(
        Map<String, dynamic> json) =>
    ConstructionResponseDto(
      content: json['content'] as String,
      endTime: DateTime.parse(json['end_time'] as String),
      location: json['location'] as String,
      newsId: (json['news_id'] as num).toInt(),
      startTime: DateTime.parse(json['start_time'] as String),
    );

Map<String, dynamic> _$ConstructionResponseDtoToJson(
        ConstructionResponseDto instance) =>
    <String, dynamic>{
      'content': instance.content,
      'end_time': instance.endTime.toIso8601String(),
      'location': instance.location,
      'news_id': instance.newsId,
      'start_time': instance.startTime.toIso8601String(),
    };
