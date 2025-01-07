import 'package:moducnu/data/local/entity/location_entity.dart';
import 'package:moducnu/data/remote/dto/building/building_dto.dart';
import 'package:moducnu/domain/model/building.dart';
import 'package:moducnu/domain/model/place.dart';

import '../../presentation/school/component/building_detail.dart';

class BuildingToPlaceMapper {
  /// `BuildingResponseDto` -> `Place`
  static Place fromResponseDto(BuildingResponseDto dto) {
    return Place(
      id: dto.buildingId,
      nodeId: "",
      placeName: dto.name,
      category: dto.alias,
      // Assume `alias` is used as the category here
      contact: "",
      // Contact is not present in `BuildingResponseDto`
      alias: "", // Address is not present in `BuildingResponseDto`
    );
  }

  /// `BuildingDetailResponseDto` -> `Place`
  static Place fromDetailResponseDto(BuildingDetailResponseDto dto) {
    return Place(
      id: dto.buildingId,
      nodeId: dto.nodeId,
      placeName: dto.name,
      category: dto.category ?? "없음",
      contact: dto.phoneNumber ?? "없음",
      alias: dto.alias,
    );
  }

  /// `BuildingDetailResponseDto` -> `Building`
  static Building fromFullResponse(BuildingFullResponseDto dto) {
    final disabledRestroomLocations = dto.disabledRestrooms
        .map((restroom) => "${restroom.floor}층 ${restroom.locationDescription}")
        .join(", ");

    final elevatorLocations = dto.elevators
        .map((elevator) => elevator.locationDescription)
        .join(", ");

    final rampLocations = dto.ramps
        .map((ramp) => ramp.locationDescription)
        .join(", ");

    return Building(
      address: dto.building.address,
      alias: dto.building.alias,
      basementFloors: dto.building.basementFloors,
      buildingId: dto.building.buildingId,
      category: dto.building.category,
      groundFloors: dto.building.groundFloors,
      name: dto.building.name,
      nodeId: dto.building.nodeId,
      phoneNumber: dto.building.phoneNumber,
      roofFloors: dto.building.roofFloors,
      tags: dto.building.tags.split(',').map((tag) => tag.trim()).toList(),
      disabledRestrooms: disabledRestroomLocations.isEmpty
          ? "없음"
          : disabledRestroomLocations,
      elevators: elevatorLocations.isEmpty ? "없음" : elevatorLocations,
      ramps: rampLocations.isEmpty ? "없음" : rampLocations,
      floorPlans: [], // 필요시 다른 데이터를 매핑하여 추가
    );
  }

}

class LocationToPlaceMapper {
  /// `Location` -> `Place`
  static Place fromLocationEntity(LocationEntity location) {
    return Place(
      id: location.buildingId,
      nodeId: location.nodeId,
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
      nodeId: place.nodeId,
      name: place.placeName,
      alias: place.alias,
      contact: place.contact,
      category: place.category,
    );
  }
}
