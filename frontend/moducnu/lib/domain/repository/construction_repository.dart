import 'package:moducnu/domain/model/construction_news.dart';

abstract class ConstructionRepository {
  Future<List<ConstructionNews>> getAllConstructionNews();
  Future<ConstructionNews> getLatestConstructionNews();
}
