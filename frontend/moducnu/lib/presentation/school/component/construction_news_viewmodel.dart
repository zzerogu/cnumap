import 'package:get/get.dart';
import 'package:moducnu/domain/model/construction_news.dart';
import 'package:moducnu/domain/usecases/get_all_construction_news_usecase.dart';
import 'package:moducnu/domain/usecases/get_latest_construction_news_usecase.dart';

class ConstructionViewModel extends GetxController {
  final GetAllConstructionNewsUseCase getAllConstructionNewsUseCase;
  final GetLatestConstructionNewsUseCase getLatestConstructionNewsUseCase;

  // 상태 변수 정의
  var constructionNews = <ConstructionNews>[].obs;
  var latestNews = Rxn<ConstructionNews>();

  ConstructionViewModel({
    required this.getAllConstructionNewsUseCase,
    required this.getLatestConstructionNewsUseCase,
  });

  // 공사 소식 전체 로드
  Future<void> fetchAllConstructionNews() async {
    try {
      final news = await getAllConstructionNewsUseCase();
      constructionNews.assignAll(news);
    } catch (e) {
      print("Error fetching all construction news: $e");
    }
  }

  // 최신 공사 소식 로드
  Future<void> fetchLatestConstructionNews() async {
    try {
      final news = await getLatestConstructionNewsUseCase();
      latestNews.value = news;
    } catch (e) {
      print("Error fetching latest construction news: $e");
    }
  }
}
