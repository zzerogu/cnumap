import 'package:moducnu/data/remote/dto/building/building_dto.dart';
import 'package:moducnu/domain/model/place.dart';

class BuildingToPlaceMapper {
  /// `BuildingDetailResponseDto` -> `Place`
  static Place fromDetailResponseDto(BuildingDetailResponseDto dto) {
    return Place(
      nodeId: dto.nodeId,
      placeName: dto.name,
      category: dto.category,
      contact: dto.phoneNumber,
      alias: dto.alias,
    );
  }
}
