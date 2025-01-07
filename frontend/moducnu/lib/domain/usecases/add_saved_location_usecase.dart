import 'package:moducnu/domain/model/place.dart';
import 'package:moducnu/domain/repository/place_repository.dart';

class AddSavedLocationUseCase {
  final PlaceRepository repository;

  AddSavedLocationUseCase(this.repository);

  Future<void> execute(Place place) async {
    try {
      await repository.addSavedLocation(place);
    } catch (e) {
      throw Exception('Failed to add saved location: $e');
    }
  }
}