class SupportCenter {
  final int buildingId;
  final int id;
  String? buildingName; // 건물 이름 추가
  final Helper helper;

  // Constructor to initialize the properties
  SupportCenter({
    required this.buildingId,
    required this.id,
    this.buildingName,
    required this.helper
  });
}

class Helper {
  final String name;
  final String phoneNumber;
  final String position;

  const Helper({
    required this.name,
    required this.phoneNumber,
    required this.position
  });
}