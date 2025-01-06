import 'package:json_annotation/json_annotation.dart';

part 'disability_support_center_dto.g.dart';

@JsonSerializable()
class DisabilitySupportCentersResponseDto {
  final int id;
  final String name;
  final String position;
  @JsonKey(name: 'phone_number')
  final String? phoneNumber;
  @JsonKey(name: 'building_id')
  final int buildingId;

  DisabilitySupportCentersResponseDto({
    required this.buildingId,
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.position
  });


  factory DisabilitySupportCentersResponseDto.fromJson(Map<String, dynamic> json) =>
      _$DisabilitySupportCentersResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DisabilitySupportCentersResponseDtoToJson(this);
}
