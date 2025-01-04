class ConstructionNews {
  final String content;
  final String location;
  final DateTime startTime;
  final DateTime endTime;
  final String? imageUrl; // 사진 URL (nullable)

  ConstructionNews({
    required this.content,
    required this.location,
    required this.startTime,
    required this.endTime,
    this.imageUrl,
  });
}
