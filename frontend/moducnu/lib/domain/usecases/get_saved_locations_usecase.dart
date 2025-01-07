import 'package:moducnu/domain/model/place.dart';
import 'package:moducnu/domain/repository/place_repository.dart';

class GetSavedLocationsUseCase {
  final PlaceRepository repository;

  GetSavedLocationsUseCase(this.repository);

  Future<List<Place>> execute() async {
    try {
      return await repository.getSavedLocations();
    } catch (e) {
      throw Exception('Failed to fetch saved locations: $e');
    }
  }
}
