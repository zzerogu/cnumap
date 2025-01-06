import 'package:flutter/material.dart';
import 'package:moducnu/presentation/school/component/section_title.dart';
import 'package:moducnu/presentation/theme/color.dart';


class Contact {
  final String name;
  final String role;
  final String location;
  final String contact;

  const Contact({
    required this.name,
    required this.role,
    required this.location,
    required this.contact,
  });
}

class DisabledCenterDetail extends StatelessWidget {
  const DisabledCenterDetail({super.key});

  // 더미 데이터 리스트
  final List<Contact> contacts = const [
    Contact(
      name: '담당자 1',
      role: '센터장',
      location: '한누리회관',
      contact: '042-1234-4567',
    ),
    Contact(
      name: '담당자 2',
      role: '편의시설 관리, 프로그램 지원',
      location: '한누리회관',
      contact: '042-1234-4567',
    ),
    Contact(
      name: '담당자 3',
      role: '동반자 지원 사업, 편의지원',
      location: '한누리회관',
      contact: '042-1234-4567',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('장애학습지원센터', style: TextStyle(color: Colors.black)),
        backgroundColor: kBackgroundColor,
        elevation: 1.0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: kBackgroundColor,
      body: Container(
        color: kBackgroundColor, 
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
          children: [
            // 안내 카드
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center, // 중앙 정렬
                children: [
                  const Text(
                    '충남대학교 장애학습 지원센터는 장애 학생을 위한  여러 지원 서비스를 제공합니다.\n자세한 내용은 아래 사이트를 이용해보세요.',
                    textAlign: TextAlign.center, // 중앙 정렬
                    style: TextStyle(fontSize: 16.0, color: Colors.black87, fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(height: 10.0),
                  ElevatedButton(
                    onPressed: () {
                      // 사이트 링크 동작 추가 가능
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kButtonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text(
                      '장애학습지원센터 바로가기',
                      style: TextStyle(fontSize: 14.0, color: Colors.white),
                    ),
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
            const SizedBox(height: 20.0),

            // 담당자 연락처
            const SectionTitle(title: '📞 담당자 연락처'),
            const SizedBox(height: 8.0),
            for (var contact in contacts)
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
                                contact.name,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(width: 16.0),
                              Text(
                                contact.role,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4.0),
                          Row(
                            children: [
                              const Icon(Icons.location_on, size: 18, color: Colors.red),
                              const SizedBox(width: 4.0),
                              Text(
                                contact.location,
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
                                contact.contact,
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
                        print("Right arrow clicked for ${contact.name}");
                      },
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
