class Place {
  final String nodeId;
  final int? id;
  final String placeName;
  final String category;
  final String contact;
  final String alias;

  // Constructor to initialize the properties
  const Place({
    required this.nodeId,
    this.id,
    required this.placeName,
    required this.category,
    required this.contact,
    required this.alias,
  });
}

class Position {
  final double latitude;
  final double longitude;

const Position({
    required this.latitude,
    required this.longitude,
  });
}
