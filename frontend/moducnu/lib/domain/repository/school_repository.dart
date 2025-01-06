import 'package:moducnu/domain/model/construction_news.dart';
import 'package:moducnu/domain/model/support_center.dart';

abstract class SchoolRepository {
  Future<List<SupportCenter>> getAllSupportCenters();
  Future<List<ConstructionNews>> getAllConstructionNews();
  Future<ConstructionNews> getLatestConstructionNews();
}
