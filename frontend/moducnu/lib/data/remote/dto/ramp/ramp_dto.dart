import 'package:json_annotation/json_annotation.dart';

part 'ramp_dto.g.dart';

@JsonSerializable()
class RampResponseDto {
  @JsonKey(name: "building_id")
  final int buildingId;
  final int floor;
  @JsonKey(name: "location_description")
  final String locationDescription;
  @JsonKey(name: "node_id")
  final String nodeId;
  @JsonKey(name: "ramp_id")
  final int rampId;

  RampResponseDto({
    required this.buildingId,
    required this.floor,
    required this.locationDescription,
    required this.nodeId,
    required this.rampId,
  });

  factory RampResponseDto.fromJson(Map<String, dynamic> json) =>
      _$RampResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RampResponseDtoToJson(this);
}
