import 'package:flutter/material.dart';
import 'package:moducnu/presentation/school/component/section_title.dart';
import 'package:moducnu/presentation/theme/color.dart';

class Place {
  final String placeName;
  final String category;
  final String address;
  final String contact;

  const Place({
    required this.placeName,
    required this.category,
    required this.address,
    required this.contact,
  });
}

class Lounge extends StatelessWidget {
  const Lounge({super.key});

  // 더미 데이터 리스트
  final List<Place> places = const [
    Place(
      placeName: '장애학습지원센터 내 휴게실',
      category: '카페',
      address: '충남대학교 한누리회관',
      contact: '042-821-5169',
    ),
    Place(
      placeName: '한누리회관 309호',
      category: '중증 장애 휴식형',
      address: '충남대학교 한누리회관',
      contact: '042-821-5169',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('휴게실', style: TextStyle(color: Colors.black)),
        backgroundColor: kBackgroundColor,
        elevation: 1.0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      
      body: Container(
        color: kBackgroundColor, 
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
          children: [
            // 건물 정보
            const SectionTitle(title: '🏢 건물 정보'),
            const SizedBox(height: 8.0),
            for (var place in places)
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey.shade300,
                      width: 1.0,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                place.placeName,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(width: 8.0),
                              Text(
                                place.category,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8.0),
                          Row(
                            children: [
                              const Icon(Icons.location_on, size: 18, color: Colors.red),
                              const SizedBox(width: 4.0),
                              Text(
                                place.address,
                                style: const TextStyle(fontSize: 14, color: Colors.black),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8.0),
                          Row(
                            children: [
                              const Icon(Icons.phone, size: 18, color: Colors.blue),
                              const SizedBox(width: 4.0),
                              Text(
                                place.contact,
                                style: const TextStyle(fontSize: 14, color: Colors.blue),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_forward_ios, size: 20),
                      onPressed: () {
                        print("Right arrow clicked for ${place.placeName}");
                      },
                    ),
                  ],
                ),
              ),

            const SizedBox(height: 20.0),

            // 위치 정보
            const SectionTitle(title: '📍 위치'),
            const SizedBox(height: 8.0),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(color: kInfoBorderColor, width: 1.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10.0),
                  Image.asset(
                    'assets/images/disabled_center.png',
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
