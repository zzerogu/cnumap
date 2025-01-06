
import 'package:moducnu/domain/model/place.dart';
import 'package:moducnu/domain/repository/place_repository.dart';

class GetBuildingNameByIdUsecase {
  final PlaceRepository repository;

  GetBuildingNameByIdUsecase({required this.repository});

  Future<String> execute(int id) async {
    // repository에서 비동기 결과 가져오기
    return await repository.getPlaceNameById(id);
  }

}
