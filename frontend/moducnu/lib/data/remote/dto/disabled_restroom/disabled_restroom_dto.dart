import 'package:json_annotation/json_annotation.dart';

part 'disabled_restroom_dto.g.dart';

@JsonSerializable()
class DisabledRestroomResponseDto {
  @JsonKey(name: 'building_id')
  final int buildingId;

  final int floor;

  @JsonKey(name: 'location_description')
  final String locationDescription;

  @JsonKey(name: 'node_id')
  final int nodeId;

  @JsonKey(name: 'restroom_id')
  final int restroomId;

  DisabledRestroomResponseDto({
    required this.buildingId,
    required this.floor,
    required this.locationDescription,
    required this.nodeId,
    required this.restroomId,
  });

  factory DisabledRestroomResponseDto.fromJson(Map<String, dynamic> json) =>
      _$DisabledRestroomResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DisabledRestroomResponseDtoToJson(this);
}
