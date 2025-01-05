import 'package:moducnu/data/mapper/building_mapper.dart';
import 'package:moducnu/data/remote/api/building/building_api.dart';
import 'package:moducnu/domain/model/place.dart';
import 'package:moducnu/domain/repository/place_repository.dart';

class PlaceRepositoryImpl implements PlaceRepository {
  final BuildingApi buildingApi;

  PlaceRepositoryImpl(this.buildingApi);

  @override
  Future<List<Place>> getPlacesByName(String name) async {
    try {
      // BuildingResponseDto 리스트를 가져옴
      final response = await buildingApi.getBuildingsByName(name);
      // BuildingResponseDto -> Place 매핑
      return response.map((dto) => BuildingToPlaceMapper.fromDetailResponseDto(dto)).toList();
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
      return response.map((dto) => BuildingToPlaceMapper.fromDetailResponseDto(dto)).toList();
    } catch (e) {
      throw Exception('Failed to fetch places by category: $e');
    }
  }

  @override
  Future<Place> getPlaceById(int id) async {
    try {
      // BuildingDetailResponseDto를 가져옴
      final detailDto = await buildingApi.getBuildingById(id);
      // BuildingDetailResponseDto -> Place 매핑
      return BuildingToPlaceMapper.fromDetailResponseDto(detailDto);
    } catch (e) {
      throw Exception('Failed to fetch place by ID: $e');
    }
  }
}
