import 'package:moducnu/domain/model/construction_news.dart';
import 'package:moducnu/domain/model/support_center.dart';

abstract class SchoolRepository {
  // 추후 construction_repo 여기에 합치겠습니다.
  Future<List<SupportCenter>> getAllSupportCenters();
}
