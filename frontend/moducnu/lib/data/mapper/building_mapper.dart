import 'package:moducnu/data/local/entity/location_entity.dart';
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

class LocationToPlaceMapper {
  /// `Location` -> `Place`
  static Place fromLocationEntity(LocationEntity location) {
    return Place(
      id: location.buildingId,
      placeName: location.name,
      category: location.category ?? "-",
      contact: location.contact ?? "-",
      alias: location.alias,
    );
  }

  /// `Place` -> `Location`
  static LocationEntity toLocationEntity(Place place) {
    return LocationEntity(
      buildingId: place.id!,
      name: place.placeName,
      alias: place.alias,
      contact: place.contact,
      category: place.category,
    );
  }
}