// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RouteRequestDto _$RouteRequestDtoFromJson(Map<String, dynamic> json) =>
    RouteRequestDto(
      avoidAreas: (json['avoid_areas'] as List<dynamic>)
          .map((e) => AvoidAreaDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      start: CoordinateDto.fromJson(json['start'] as Map<String, dynamic>),
      end: CoordinateDto.fromJson(json['end'] as Map<String, dynamic>),
      maxSlope: (json['max_slope'] as num).toDouble(),
      minSlope: (json['min_slope'] as num).toDouble(),
    );

Map<String, dynamic> _$RouteRequestDtoToJson(RouteRequestDto instance) =>
    <String, dynamic>{
      'avoid_areas': instance.avoidAreas,
      'start': instance.start,
      'end': instance.end,
      'max_slope': instance.maxSlope,
      'min_slope': instance.minSlope,
    };

RouteResponseDto _$RouteResponseDtoFromJson(Map<String, dynamic> json) =>
    RouteResponseDto(
      distance: json['distance'] as String,
      duration: json['duration'] as String,
      route: (json['route'] as List<dynamic>)
          .map((e) => CoordinateDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      warnings:
          (json['warnings'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$RouteResponseDtoToJson(RouteResponseDto instance) =>
    <String, dynamic>{
      'distance': instance.distance,
      'duration': instance.duration,
      'route': instance.route,
      'warnings': instance.warnings,
    };

AvoidAreaDto _$AvoidAreaDtoFromJson(Map<String, dynamic> json) => AvoidAreaDto(
      minLatitude: (json['min_latitude'] as num).toDouble(),
      minLongitude: (json['min_longitude'] as num).toDouble(),
      maxLatitude: (json['max_latitude'] as num).toDouble(),
      maxLongitude: (json['max_longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$AvoidAreaDtoToJson(AvoidAreaDto instance) =>
    <String, dynamic>{
      'min_latitude': instance.minLatitude,
      'min_longitude': instance.minLongitude,
      'max_latitude': instance.maxLatitude,
      'max_longitude': instance.maxLongitude,
    };

CoordinateDto _$CoordinateDtoFromJson(Map<String, dynamic> json) =>
    CoordinateDto(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$CoordinateDtoToJson(CoordinateDto instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
