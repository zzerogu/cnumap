class LocationData {
  final String title;
  final String subtitle;

  LocationData({required this.title, required this.subtitle});

  // 예제 데이터
  static List<LocationData> locations = [
    LocationData(
      title: '공과대학 5호관',
      subtitle: '1층 중앙 엘레베이터 옆',
    ),
    LocationData(
      title: '자연과학대학 1호관',
      subtitle: '2층 서쪽 복도 끝',
    ),
    LocationData(
      title: '도서관',
      subtitle: '1층 로비',
    ),
  ];
}
