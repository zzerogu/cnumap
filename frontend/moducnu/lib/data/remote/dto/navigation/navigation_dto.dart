import 'package:json_annotation/json_annotation.dart';

part 'navigation_dto.g.dart';

@JsonSerializable()
class RouteRequestDto {
  @JsonKey(name: 'avoid_areas')
  final List<AvoidAreaDto> avoidAreas;
  final CoordinateDto start;
  final CoordinateDto end;
  @JsonKey(name: 'max_slope')
  final double maxSlope;
  @JsonKey(name: 'min_slope')
  final double minSlope;

  RouteRequestDto({
    required this.avoidAreas,
    required this.start,
    required this.end,
    required this.maxSlope,
    required this.minSlope,
  });

  factory RouteRequestDto.fromJson(Map<String, dynamic> json) =>
      _$RouteRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RouteRequestDtoToJson(this);
}


@JsonSerializable()
class RouteResponseDto {
  final String distance;
  final String duration;
  final List<CoordinateDto> route;
  final List<String> warnings;

  RouteResponseDto({
    required this.distance,
    required this.duration,
    required this.route,
    required this.warnings,
  });

  factory RouteResponseDto.fromJson(Map<String, dynamic> json) => _$RouteResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RouteResponseDtoToJson(this);
}


@JsonSerializable()
class AvoidAreaDto {
  @JsonKey(name: 'min_latitude')
  final double minLatitude;
  @JsonKey(name: 'min_longitude')
  final double minLongitude;
  @JsonKey(name: 'max_latitude')
  final double maxLatitude;
  @JsonKey(name: 'max_longitude')
  final double maxLongitude;

  AvoidAreaDto({
    required this.minLatitude,
    required this.minLongitude,
    required this.maxLatitude,
    required this.maxLongitude,
  });

  factory AvoidAreaDto.fromJson(Map<String, dynamic> json) =>
      _$AvoidAreaDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AvoidAreaDtoToJson(this);
}

@JsonSerializable()
class CoordinateDto {
  final double latitude;
  final double longitude;

  CoordinateDto({
    required this.latitude,
    required this.longitude,
  });

  factory CoordinateDto.fromJson(Map<String, dynamic> json) =>
      _$CoordinateDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CoordinateDtoToJson(this);
}
