class SupportCenter {
  final int buildingId;
  final int id;
  final Helper helper;

  // Constructor to initialize the properties
  const SupportCenter({
    required this.buildingId,
    required this.id,
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