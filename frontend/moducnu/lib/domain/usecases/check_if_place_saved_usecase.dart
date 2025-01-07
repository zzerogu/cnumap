import 'package:moducnu/domain/repository/place_repository.dart';

class CheckIfPlaceIsSavedUseCase {
  final PlaceRepository repository;

  CheckIfPlaceIsSavedUseCase(this.repository);

  Future<bool> execute(int buildingId) async {
    return await repository.isPlaceSaved(buildingId);
  }
}
