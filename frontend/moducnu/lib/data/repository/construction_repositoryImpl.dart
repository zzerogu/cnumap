import 'package:moducnu/data/remote/api/construction/construction_api.dart';
import 'package:moducnu/data/remote/dto/construction/construction_dto.dart';
import 'package:moducnu/domain/model/construction_news.dart';
import 'package:moducnu/domain/repository/construction_repository.dart';
import 'package:moducnu/data/mapper/construction_mapper.dart';

class ConstructionRepositoryImpl implements ConstructionRepository {
  final ConstructionApi constructionApi;

  ConstructionRepositoryImpl({required this.constructionApi});

  @override
  Future<List<ConstructionNews>> getAllConstructionNews() async {
    final List<ConstructionResponseDto> dtoList = await constructionApi.getAllConstructionNews();
    return ConstructionMapper.fromDtoList(dtoList);
  }

  @override
  Future<ConstructionNews> getLatestConstructionNews() async {
    final List<ConstructionResponseDto> dtoList = await constructionApi.getAllConstructionNews();
    if (dtoList.isNotEmpty) {
      return ConstructionMapper.fromDto(dtoList.first); // 최신 뉴스 반환
    }
    throw Exception("No construction news available");
  }
}
