import 'package:json_annotation/json_annotation.dart';

part 'node_dto.g.dart';

@JsonSerializable()
class NodeResponseDto {
  final int nodeId;
  final String table;
  final Map<String, dynamic> data;

  NodeResponseDto({
    required this.nodeId,
    required this.table,
    required this.data,
  });

  factory NodeResponseDto.fromJson(Map<String, dynamic> json) =>
      _$NodeResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$NodeResponseDtoToJson(this);
}
