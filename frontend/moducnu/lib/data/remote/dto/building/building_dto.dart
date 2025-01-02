import 'package:json_annotation/json_annotation.dart';

part 'building_dto.g.dart';

@JsonSerializable()
class BuildingResponseDto {
  final String alias;
  @JsonKey(name: 'building_id')
  final int buildingId;
  final String name;

  BuildingResponseDto({
    required this.alias,
    required this.buildingId,
    required this.name,
  });

  factory BuildingResponseDto.fromJson(Map<String, dynamic> json) =>
      _$BuildingResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$BuildingResponseDtoToJson(this);
}

@JsonSerializable()
class BuildingDetailResponseDto {
  final String address;
  final String alias;
  @JsonKey(name: 'basement_floors')
  final int basementFloors;
  @JsonKey(name: 'building_id')
  final int buildingId;
  final String category;
  @JsonKey(name: 'ground_floors')
  final int groundFloors;
  final String name;
  @JsonKey(name: 'node_id')
  final String nodeId;
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  @JsonKey(name: 'roof_floors')
  final int roofFloors;
  final String tags;

  BuildingDetailResponseDto({
    required this.address,
    required this.alias,
    required this.basementFloors,
    required this.buildingId,
    required this.category,
    required this.groundFloors,
    required this.name,
    required this.nodeId,
    required this.phoneNumber,
    required this.roofFloors,
    required this.tags,
  });

  factory BuildingDetailResponseDto.fromJson(Map<String, dynamic> json) =>
      _$BuildingDetailResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$BuildingDetailResponseDtoToJson(this);
}
