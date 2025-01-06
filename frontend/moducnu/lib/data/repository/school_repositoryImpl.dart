import 'package:moducnu/data/mapper/disability_support_center_mapper.dart';
import 'package:moducnu/data/remote/api/construction/construction_api.dart';
import 'package:moducnu/data/remote/api/disability_support_center/disability_support_center_api.dart';
import 'package:moducnu/data/remote/dto/construction/construction_dto.dart';
import 'package:moducnu/data/remote/dto/disability_support_center/disability_support_center_dto.dart';
import 'package:moducnu/domain/model/construction_news.dart';
import 'package:moducnu/domain/model/support_center.dart';
import 'package:moducnu/domain/repository/construction_repository.dart';
import 'package:moducnu/data/mapper/construction_mapper.dart';
import 'package:moducnu/domain/repository/school_repository.dart';

class SchoolRepositoryImpl implements SchoolRepository {
  final DisabilitySupportCenterApi disabilitySupportCenterApi;

  SchoolRepositoryImpl({required this.disabilitySupportCenterApi});

  @override
  Future<List<SupportCenter>> getAllSupportCenters() async {
    final List<DisabilitySupportCentersResponseDto> dtoList = await disabilitySupportCenterApi.getAllSupportCenters();
    return DisabilitySupportCenterMapper.fromDtoList(dtoList);
  }
}
