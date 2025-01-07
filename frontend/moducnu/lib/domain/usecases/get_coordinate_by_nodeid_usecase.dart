import 'package:moducnu/domain/model/building.dart';
import 'package:moducnu/domain/model/construction_news.dart';
import 'package:moducnu/domain/model/place.dart';
import 'package:moducnu/domain/repository/place_repository.dart';
import 'package:moducnu/domain/repository/school_repository.dart';

class GetCoordinateByNodeidUsecase {
  final PlaceRepository repository;

  GetCoordinateByNodeidUsecase(this.repository);

  Future<Position> execute(Place place) async {
    return await repository.getSavedLocationPosition(place.nodeId!);
  }
}

