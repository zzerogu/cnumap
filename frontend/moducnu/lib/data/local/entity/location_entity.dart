class LocationEntity {
  final int buildingId;
  final String name;
  final String alias;
  final String? contact;
  final String? category;

  LocationEntity({
    required this.buildingId,
    required this.name,
    required this.alias,
    this.contact,
    this.category,
  });

  Map<String, dynamic> toMap() {
    return {
      'building_id': buildingId,
      'name': name,
      'alias': alias,
      'contact': contact,
      'category': category,
    };
  }

  factory LocationEntity.fromMap(Map<String, dynamic> map) {
    return LocationEntity(
      buildingId: map['building_id'],
      name: map['name'],
      alias: map['alias'],
      contact: map['contact'],
      category: map['category'],
    );
  }
}
