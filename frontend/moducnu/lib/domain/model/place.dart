class Place {
  final int? id;
  final String placeName;
  final String category;
  final String contact;
  final String alias;

  // Constructor to initialize the properties
  const Place({
    this.id,
    required this.placeName,
    required this.category,
    required this.contact,
    required this.alias,
  });
}
