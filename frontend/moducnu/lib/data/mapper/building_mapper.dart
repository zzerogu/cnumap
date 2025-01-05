import 'package:moducnu/data/remote/dto/building/building_dto.dart';
import 'package:moducnu/domain/model/place.dart';

class BuildingToPlaceMapper {
  /// `BuildingResponseDto` -> `Place`
  static Place fromResponseDto(BuildingResponseDto dto) {
    return Place(
      id: dto.buildingId,
      placeName: dto.name,
      category: dto.alias, // Assume `alias` is used as the category here
      contact: "", // Contact is not present in `BuildingResponseDto`
      alias: "", // Address is not present in `BuildingResponseDto`
    );
  }

  /// `BuildingDetailResponseDto` -> `Place`
  static Place fromDetailResponseDto(BuildingDetailResponseDto dto) {
    return Place(
      id: dto.buildingId,
      placeName: dto.name,
      category: dto.category ?? "없음",
      contact: dto.phoneNumber ?? "없음",
      alias: dto.alias,
    );
  }
}
