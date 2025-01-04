// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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

RouteRequestDto _$RouteRequestDtoFromJson(Map<String, dynamic> json) =>
    RouteRequestDto(
      start: CoordinateDto.fromJson(json['start'] as Map<String, dynamic>),
      end: CoordinateDto.fromJson(json['end'] as Map<String, dynamic>),
      wheelchairVersion:
          $enumDecode(_$WheelchairVersionEnumMap, json['wheelchairVersion']),
    );

Map<String, dynamic> _$RouteRequestDtoToJson(RouteRequestDto instance) =>
    <String, dynamic>{
      'start': instance.start,
      'end': instance.end,
      'wheelchairVersion':
          _$WheelchairVersionEnumMap[instance.wheelchairVersion]!,
    };

const _$WheelchairVersionEnumMap = {
  WheelchairVersion.standardWheelchair: 'standard_wheelchair',
  WheelchairVersion.basicPowerWheelchair: 'basic_power_wheelchair',
  WheelchairVersion.advancedPowerWheelchair: 'advanced_power_wheelchair',
};

RouteResponseDto _$RouteResponseDtoFromJson(Map<String, dynamic> json) =>
    RouteResponseDto(
      duration: json['duration'] as String,
      distance: json['distance'] as String,
      route: (json['route'] as List<dynamic>)
          .map((e) => CoordinateDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      warnings:
          (json['warnings'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$RouteResponseDtoToJson(RouteResponseDto instance) =>
    <String, dynamic>{
      'duration': instance.duration,
      'distance': instance.distance,
      'route': instance.route,
      'warnings': instance.warnings,
    };
