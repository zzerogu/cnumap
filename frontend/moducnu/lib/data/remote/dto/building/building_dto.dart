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
  @JsonKey(name: 'phone_number', defaultValue: '없음')
  final String? phoneNumber;
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

@JsonSerializable()
class BuildingFullResponseDto {
  final BuildingDetailResponseDto building;
  @JsonKey(defaultValue: [])
  final List<RestroomDto> disabledRestrooms;
  @JsonKey(defaultValue: [])
  final List<ElevatorDto> elevators;
  @JsonKey(defaultValue: [])
  final List<RampDto> ramps;

  BuildingFullResponseDto({
    required this.building,
    required this.disabledRestrooms,
    required this.elevators,
    required this.ramps,
  });

  factory BuildingFullResponseDto.fromJson(Map<String, dynamic> json) =>
      _$BuildingFullResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$BuildingFullResponseDtoToJson(this);
}


/// ✅ RestroomDto 정의
@JsonSerializable()
class RestroomDto {
  @JsonKey(name: 'restroom_id', defaultValue: -1)
  final int restroomId;
  @JsonKey(name: 'building_id', defaultValue: -1)
  final int buildingId;
  @JsonKey(name: 'node_id', defaultValue: "")
  final String nodeId;
  @JsonKey(name: 'floor', defaultValue: 1)
  final int floor;
  @JsonKey(name: 'location_description', defaultValue: "없음")
  final String locationDescription;

  RestroomDto({
    required this.restroomId,
    required this.buildingId,
    required this.nodeId,
    required this.floor,
    required this.locationDescription,
  });

  factory RestroomDto.fromJson(Map<String, dynamic> json) =>
      _$RestroomDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RestroomDtoToJson(this);
}

/// ✅ ElevatorDto 정의
@JsonSerializable()
class ElevatorDto {
  @JsonKey(name: 'elevator_id', defaultValue: -1)
  final int elevatorId;
  @JsonKey(name: 'building_id', defaultValue: -1)
  final int buildingId;
  @JsonKey(name: 'node_id', defaultValue: "")
  final String nodeId;
  @JsonKey(name: 'location_description', defaultValue: "없음")
  final String locationDescription;

  ElevatorDto({
    required this.elevatorId,
    required this.buildingId,
    required this.nodeId,
    required this.locationDescription,
  });

  factory ElevatorDto.fromJson(Map<String, dynamic> json) =>
      _$ElevatorDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ElevatorDtoToJson(this);
}

/// ✅ RampDto 정의
@JsonSerializable()
class RampDto {
  @JsonKey(name:'ramp_id', defaultValue: -1)
  final int rampId;
  @JsonKey(name:'building_id', defaultValue: -1)
  final int buildingId;
  @JsonKey(name:'node_id', defaultValue: "")
  final String nodeId;
  @JsonKey(name:"floor", defaultValue: 0)
  final int floor;
  @JsonKey(name:'location_description', defaultValue: "없음")
  final String locationDescription;

  RampDto({
    required this.rampId,
    required this.buildingId,
    required this.nodeId,
    required this.floor,
    required this.locationDescription,
  });

  factory RampDto.fromJson(Map<String, dynamic> json) =>
      _$RampDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RampDtoToJson(this);
}
