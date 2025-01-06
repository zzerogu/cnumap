import 'package:moducnu/domain/model/construction_news.dart';
import 'package:moducnu/domain/repository/construction_repository.dart';

class GetAllConstructionNewsUseCase {
  final ConstructionRepository repository;

  GetAllConstructionNewsUseCase({required this.repository});

  Future<List<ConstructionNews>> call() async {
    return await repository.getAllConstructionNews();
  }
}
