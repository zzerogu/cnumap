import 'package:moducnu/data/local/dao/location_data_source.dart';
import 'package:moducnu/data/mapper/building_mapper.dart';
import 'package:moducnu/data/remote/api/building/building_api.dart';
import 'package:moducnu/domain/model/building.dart';
import 'package:moducnu/domain/model/place.dart';
import 'package:moducnu/domain/repository/place_repository.dart';

class PlaceRepositoryImpl implements PlaceRepository {
  final BuildingApi buildingApi;
  final LocationDataSource locationDataSource;

  PlaceRepositoryImpl(this.buildingApi, this.locationDataSource);

  @override
  Future<List<Place>> getPlacesByName(String name) async {
    try {
      // BuildingResponseDto 리스트를 가져옴
      final response = await buildingApi.getBuildingsByName(name);
      // BuildingResponseDto -> Place 매핑
      return response
          .map((dto) => BuildingToPlaceMapper.fromDetailResponseDto(dto))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch places by name: $e');
    }
  }

  @override
  Future<List<Place>> getPlacesByCategory(String category) async {
    try {
      // BuildingResponseDto 리스트를 가져옴
      final response = await buildingApi.getBuildingCategories(category);
      // BuildingResponseDto -> Place 매핑
      return response
          .map((dto) => BuildingToPlaceMapper.fromDetailResponseDto(dto))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch places by category: $e');
    }
  }

  @override
  Future<Building> getPlaceById(int id) async {
    print('getPlaceById 호출: $id');
    try {
      print('API 요청 시작');
      final detailDto = await buildingApi.getBuildingById(id);
      print('API 응답 수신: ${detailDto.toJson()}'); // 응답 데이터 출력
      final building = BuildingToPlaceMapper.fromFullResponse(detailDto);
      print('매핑된 Building 객체: $building');
      return building;
    } catch (e, stackTrace) {
      print('getPlaceById 실패: $e');
      print('스택 추적: $stackTrace');
      throw Exception('Failed to fetch place by ID: $e');
    }
  }


  @override
  Future<String> getPlaceNameById(int id) {
    return buildingApi.getBuildingNameByBuildingId(id);
  }

  @override
  Future<List<Place>> getAllPlaces() async {
    try {
      // BuildingResponseDto 리스트를 가져옴
      final response = await buildingApi.getAllBuildings();
      // BuildingResponseDto -> Place 매핑
      return response.map((dto) => BuildingToPlaceMapper.fromResponseDto(dto)).toList();
    } catch (e) {
      throw Exception('Failed to fetch all places: $e');
    }
  }

  @override
  Future<void> addRecentLocation(Place place) async {
    final locationEntity = LocationToPlaceMapper.toLocationEntity(place);
    await locationDataSource.addLocation(locationEntity, 'recent_locations');
  }

  @override
  Future<void> addSavedLocation(Place place) async {
    final locationEntity = LocationToPlaceMapper.toLocationEntity(place);
    await locationDataSource.addLocation(locationEntity, 'saved_locations');
  }

  @override
  Future<void> clearRecentLocations() async {
    await locationDataSource.clearLocations('recent_locations');
  }

  @override
  Future<void> clearSavedLocations() async {
    await locationDataSource.clearLocations('saved_locations');
  }

  @override
  Future<void> deleteRecentLocation(int buildingId) async {
    await locationDataSource.deleteLocation(buildingId, 'recent_locations');
  }

  @override
  Future<void> deleteSavedLocation(int buildingId) async {
    await locationDataSource.deleteLocation(buildingId, 'saved_locations');
  }

  @override
  Future<List<Place>> getRecentLocations() async {
    final entities = await locationDataSource.getLocations('recent_locations');
    return entities.map(LocationToPlaceMapper.fromLocationEntity).toList();
  }

  @override
  Future<List<Place>> getSavedLocations() async {
    final entities = await locationDataSource.getLocations('saved_locations');
    return entities.map(LocationToPlaceMapper.fromLocationEntity).toList();
  }

  @override
  Future<bool> isPlaceSaved(int buildingId) async {
    return await locationDataSource.isLocationSaved(buildingId, 'saved_locations');
  }
}
