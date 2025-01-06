import 'package:moducnu/data/remote/dto/construction/construction_dto.dart';
import 'package:moducnu/data/remote/dto/disability_support_center/disability_support_center_dto.dart';
import 'package:moducnu/domain/model/construction_news.dart';
import 'package:moducnu/domain/model/support_center.dart';

class DisabilitySupportCenterMapper {
  static SupportCenter fromDto(DisabilitySupportCentersResponseDto dto) {
    return SupportCenter(
        buildingId: dto.buildingId,
        id: dto.id,
        helper: Helper(
            name: dto.name,
            phoneNumber: dto.phoneNumber ?? "-",
            position: dto.position
    ),
    );
  }

  static List<SupportCenter> fromDtoList(List<DisabilitySupportCentersResponseDto> dtoList) {
    return dtoList.map((dto) => fromDto(dto)).toList();
  }

  static Helper helperFromDto(DisabilitySupportCentersResponseDto dto) {
    return Helper(
        name: dto.name,
        position: dto.position,
        phoneNumber: dto.phoneNumber ?? "-"
    );
  }

  static List<Helper> helperFromDtoList(List<DisabilitySupportCentersResponseDto> dtoList) {
    return dtoList.map((dto) => helperFromDto(dto)).toList();
  }
}
