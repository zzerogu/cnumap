class Building {
  final String? address; // 건물 주소
  final String? alias; // 건물 별칭
  final int? basementFloors; // 지하 층 수
  final int buildingId; // 건물 ID
  final String? category; // 건물 카테고리
  final int? groundFloors; // 지상 층 수
  final String name; // 건물 이름
  final String nodeId; // 노드 ID
  final String? phoneNumber; // 전화번호
  final int? roofFloors; // 옥상 층 수
  final List<String>? tags; // 태그 리스트
  final String disabledRestrooms; // 장애인 화장실 정보 (문자열)
  final String elevators; // 엘리베이터 정보 (문자열)
  final String ramps; // 경사로 정보 (문자열)
  final List<FloorPlan>? floorPlans; // 독립적인 층별 도면 데이터

  Building({
    this.address,
    this.alias,
    this.basementFloors,
    required this.buildingId,
    this.category,
    this.groundFloors,
    required this.name,
    required this.nodeId,
    this.phoneNumber,
    this.roofFloors,
    this.tags,
    required this.disabledRestrooms,
    required this.elevators,
    required this.ramps,
    this.floorPlans,
  });
}

class FloorPlan {
  final int floorNumber; // 층 번호
  final String? imagePath; // 도면 이미지 경로

  FloorPlan({
    required this.floorNumber,
    this.imagePath,
  });
}
