import 'package:moducnu/domain/model/construction_news.dart';
import 'package:moducnu/domain/repository/construction_repository.dart';

class GetLatestConstructionNewsUseCase {
  final ConstructionRepository repository;

  GetLatestConstructionNewsUseCase({required this.repository});

  Future<ConstructionNews> call() async {
    return await repository.getLatestConstructionNews();
  }
}

