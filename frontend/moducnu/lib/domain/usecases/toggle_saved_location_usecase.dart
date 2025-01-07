import 'package:moducnu/domain/model/place.dart';
import 'package:moducnu/domain/repository/place_repository.dart';

class ToggleSavedPlaceStatusUseCase {
  final PlaceRepository repository;

  ToggleSavedPlaceStatusUseCase(this.repository);

  Future<bool> execute({required bool isSaved, required Place place}) async {
    if (isSaved) {
      // 저장 해제
      await repository.deleteSavedLocation(place.id!);
      return false; // 저장 상태 변경
    } else {
      // 저장
      await repository.addSavedLocation(place);
      return true; // 저장 상태 변경
    }
  }
}
