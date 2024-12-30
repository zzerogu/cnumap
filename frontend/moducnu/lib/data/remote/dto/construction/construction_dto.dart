import 'package:json_annotation/json_annotation.dart';

part 'construction_dto.g.dart';

@JsonSerializable()
class ConstructionResponseDto {
  final String content;
  @JsonKey(name: 'end_time')
  final DateTime endTime;
  final String location;
  @JsonKey(name: 'news_id')
  final int newsId;
  @JsonKey(name: 'start_time')
  final DateTime startTime;

  ConstructionResponseDto({
    required this.content,
    required this.endTime,
    required this.location,
    required this.newsId,
    required this.startTime,
  });

  factory ConstructionResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ConstructionResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ConstructionResponseDtoToJson(this);
}
