import 'package:moducnu/domain/model/place.dart';
import 'package:moducnu/domain/repository/place_repository.dart';

class GetPlacesByCategoryUseCase {
  final PlaceRepository placeRepository;

  GetPlacesByCategoryUseCase(this.placeRepository);

  Future<List<Place>> execute(String category) async {
    return await placeRepository.getPlacesByCategory(category);
  }
}
