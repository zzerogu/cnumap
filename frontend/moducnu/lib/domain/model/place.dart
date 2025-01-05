
class Place {
  final int? id;
  final String placeName;
  final String category;
  final String contact;
  final String address;

  // Constructor to initialize the properties
  const Place({
    this.id,
    required this.placeName,
    required this.category,
    required this.contact,
    required this.address,
  });
}
