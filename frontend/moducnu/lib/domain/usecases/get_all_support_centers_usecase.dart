import 'package:moducnu/domain/model/construction_news.dart';
import 'package:moducnu/domain/model/support_center.dart';
import 'package:moducnu/domain/repository/school_repository.dart';

class GetAllSupportCentersUseCase {
  final SchoolRepository repository;

  GetAllSupportCentersUseCase({required this.repository});

  Future<List<SupportCenter>> call() async {
    return await repository.getAllSupportCenters();
  }
}
