import 'package:moducnu/domain/model/place.dart';
import 'package:moducnu/domain/repository/place_repository.dart';

class GetPlacesByNameUseCase {
  final PlaceRepository placeRepository;

  GetPlacesByNameUseCase(this.placeRepository);

  Future<List<Place>> execute(String name) async {
    return await placeRepository.getPlacesByName(name);
  }
}
