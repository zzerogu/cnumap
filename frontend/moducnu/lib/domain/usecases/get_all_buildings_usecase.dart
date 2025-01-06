import 'package:moducnu/domain/model/place.dart';

import '../repository/place_repository.dart';

class GetAllBuildingsUsecase {
  final PlaceRepository placeRepository;

  GetAllBuildingsUsecase(this.placeRepository);

  Future<List<Place>> execute() async {
    return await placeRepository.getAllPlaces();
  }
}
