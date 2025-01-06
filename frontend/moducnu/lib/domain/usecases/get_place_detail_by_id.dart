import 'package:moducnu/domain/model/place.dart';

import '../repository/place_repository.dart';

class GetPlaceByIdUseCase {
  final PlaceRepository placeRepository;

  GetPlaceByIdUseCase(this.placeRepository);

  Future<Place> execute(int id) async {
    return await placeRepository.getPlaceById(id);
  }
}
