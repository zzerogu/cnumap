import 'package:moducnu/data/remote/dto/construction/construction_dto.dart';
import 'package:moducnu/domain/model/construction_news.dart';

class ConstructionMapper {
  static ConstructionNews fromDto(ConstructionResponseDto dto) {
    return ConstructionNews(
      content: dto.content,
      location: dto.location,
      startTime: dto.startTime,
      endTime: dto.endTime,
      imageUrl: null, // DTO에 사진 데이터가 없는 경우 null 처리
    );
  }

  static List<ConstructionNews> fromDtoList(List<ConstructionResponseDto> dtoList) {
    return dtoList.map((dto) => fromDto(dto)).toList();
  }
}
