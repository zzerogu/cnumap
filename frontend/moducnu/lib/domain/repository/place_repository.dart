import 'package:moducnu/domain/model/place.dart';

abstract class PlaceRepository {
  /// 이름으로 장소 검색
  Future<List<Place>> getPlacesByName(String name);

  /// 카테고리로 장소 검색
  Future<List<Place>> getPlacesByCategory(String category);

  /// 특정 ID로 장소 조회
  Future<Place> getPlaceById(int id);
}
