import 'package:moducnu/data/mapper/disability_support_center_mapper.dart';
import 'package:moducnu/data/remote/api/construction/construction_api.dart';
import 'package:moducnu/data/remote/api/disability_support_center/disability_support_center_api.dart';
import 'package:moducnu/data/remote/dto/construction/construction_dto.dart';
import 'package:moducnu/data/remote/dto/disability_support_center/disability_support_center_dto.dart';
import 'package:moducnu/domain/model/construction_news.dart';
import 'package:moducnu/domain/model/support_center.dart';
import 'package:moducnu/data/mapper/construction_mapper.dart';
import 'package:moducnu/domain/repository/school_repository.dart';

class SchoolRepositoryImpl implements SchoolRepository {
  final DisabilitySupportCenterApi disabilitySupportCenterApi;
  final ConstructionApi constructionApi;

  SchoolRepositoryImpl({required this.disabilitySupportCenterApi, required this.constructionApi});


  @override
  Future<List<SupportCenter>> getAllSupportCenters() async {
    final List<DisabilitySupportCentersResponseDto> dtoList = await disabilitySupportCenterApi.getAllSupportCenters();
    return DisabilitySupportCenterMapper.fromDtoList(dtoList);
  }

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
