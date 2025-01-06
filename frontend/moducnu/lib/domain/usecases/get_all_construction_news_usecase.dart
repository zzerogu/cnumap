import 'package:moducnu/domain/model/construction_news.dart';
import 'package:moducnu/domain/repository/school_repository.dart';

class GetAllConstructionNewsUseCase {
  final SchoolRepository repository;

  GetAllConstructionNewsUseCase({required this.repository});

  Future<List<ConstructionNews>> call() async {
    return await repository.getAllConstructionNews();
  }
}
