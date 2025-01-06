import 'package:json_annotation/json_annotation.dart';

part 'navigation_dto.g.dart';

/// 좌표를 나타내는 DTO
@JsonSerializable()
class CoordinateDto {
  final double latitude;
  final double longitude;

  CoordinateDto({required this.latitude, required this.longitude});

  factory CoordinateDto.fromJson(Map<String, dynamic> json) =>
      _$CoordinateDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CoordinateDtoToJson(this);
}

/// 휠체어 버전 ENUM
enum WheelchairVersion {
  @JsonValue('standard_wheelchair')
  standardWheelchair,
  @JsonValue('basic_power_wheelchair')
  basicPowerWheelchair,
  @JsonValue('advanced_power_wheelchair')
  advancedPowerWheelchair
}

/// 경로 요청 DTO
@JsonSerializable()
class RouteRequestDto {
  final CoordinateDto start;
  final CoordinateDto end;
  final WheelchairVersion wheelchairVersion;

  RouteRequestDto({
    required this.start,
    required this.end,
    required this.wheelchairVersion,
  });

  factory RouteRequestDto.fromJson(Map<String, dynamic> json) =>
      _$RouteRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$RouteRequestDtoToJson(this);
}

/// 경로 응답 DTO
@JsonSerializable()
class RouteResponseDto {
  final String duration;
  final String distance;
  final List<CoordinateDto> route;
  final List<String> warnings;

  RouteResponseDto({
    required this.duration,
    required this.distance,
    required this.route,
    required this.warnings,
  });

  factory RouteResponseDto.fromJson(Map<String, dynamic> json) =>
      _$RouteResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$RouteResponseDtoToJson(this);
}
