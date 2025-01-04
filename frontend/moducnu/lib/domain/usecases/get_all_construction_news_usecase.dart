import 'package:moducnu/domain/model/construction_news.dart';
import 'package:moducnu/domain/repository/construction_repository.dart';

class GetAllConstructionNewsUseCase {
  final ConstructionRepository repository;

  GetAllConstructionNewsUseCase({required this.repository});

  Future<List<ConstructionNews>> call() async {
    // return await repository.getAllConstructionNews();
    // 현재는 db 에 넣어둔 예시 데이터가 없어서 fe 상에서 예시 데이터 반환하고 있으나
    //  TODO 더미데이터 서버에 넣은 후 위코드 주석해제 후 아래 코드 삭제해야함
    return [
      ConstructionNews(
        content: "공대 5호관 오른편 경사로가 공사중에 있습니다.\n다른 출입문을 이용해주시기 바랍니다.",
        location: "공대 5호관",
        startTime: DateTime.parse("2025-01-01 09:00:00"), // DateTime 형식으로 변환
        endTime: DateTime.parse("2025-02-31 18:00:00"),  // DateTime 형식으로 변환
      ),
    ];
  }
}
