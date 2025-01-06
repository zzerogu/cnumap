import 'package:moducnu/domain/model/place.dart';

abstract class PlaceRepository {
  /// 이름으로 장소 검색
  Future<List<Place>> getPlacesByName(String name);

  /// 카테고리로 장소 검색
  Future<List<Place>> getPlacesByCategory(String category);

  /// 특정 ID로 장소 조회
  Future<Place> getPlaceById(int id);

  /// 특정 ID로 장소 이름 조회
  Future<String> getPlaceNameById(int id);

  /// 모든 장소 조회
  Future<List<Place>> getAllPlaces();

  /// 내 저장 장소 관련
  Future<void> addSavedLocation(Place place);
  Future<List<Place>> getSavedLocations();
  Future<void> deleteSavedLocation(int buildingId);
  Future<void> clearSavedLocations();

  /// 최근 방문 장소 관련
  Future<void> addRecentLocation(Place place);
  Future<List<Place>> getRecentLocations();
  Future<void> deleteRecentLocation(int buildingId);
  Future<void> clearRecentLocations();
}
