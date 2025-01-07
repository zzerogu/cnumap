import 'package:moducnu/domain/model/building.dart';
import 'package:moducnu/domain/model/place.dart';

import '../repository/place_repository.dart';

class GetBuildingDetailUseCase {
  final PlaceRepository placeRepository;

  GetBuildingDetailUseCase(this.placeRepository);

  Future<Building> execute(int id) async {
    return await placeRepository.getPlaceById(id);
  }
}
