import 'package:moducnu/domain/repository/place_repository.dart';

class DeleteSavedLocationUseCase {
  final PlaceRepository repository;

  DeleteSavedLocationUseCase(this.repository);

  Future<void> execute(int buildingId) async {
    try {
      await repository.deleteSavedLocation(buildingId);
    } catch (e) {
      throw Exception('Failed to delete saved location: $e');
    }
  }
}