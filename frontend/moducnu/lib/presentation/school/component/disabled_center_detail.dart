import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get_it/get_it.dart';
import 'package:moducnu/presentation/school/component/disabled_center_viewmodel.dart';
import 'package:moducnu/presentation/school/component/section_title.dart';
import 'package:moducnu/presentation/theme/color.dart';


class DisabledCenterDetail extends StatefulWidget {
  const DisabledCenterDetail({super.key});

  @override
  State<DisabledCenterDetail> createState() => _DisabledCenterDetailState();
}

class _DisabledCenterDetailState extends State<DisabledCenterDetail> {
  late final DisabledCenterViewModel viewModel;

  @override
  void initState() {
    super.initState();
    // ViewModel 인스턴스 가져오기
    viewModel = GetIt.instance<DisabledCenterViewModel>();
    // 지원센터 데이터 가져오기
    viewModel.fetchSupportCenters();
  }

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
      body: Obx(() {
        // 로딩 상태 처리
        if (viewModel.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        // 데이터가 없는 경우 처리
        if (viewModel.supportCenters.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '지원센터 데이터를 가져올 수 없습니다.',
                  style: TextStyle(fontSize: 16.0, color: Colors.black54),
                ),
                const SizedBox(height: 10.0),
                ElevatedButton(
                  onPressed: viewModel.fetchSupportCenters,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kButtonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text(
                    '다시 시도',
                    style: TextStyle(fontSize: 14.0, color: Colors.white),
                  ),
                ),
              ],
            ),
          );
        }

        // 데이터가 있는 경우 리스트뷰 렌더링
        return ListView(
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    '충남대학교 장애학습 지원센터는 장애 학생을 위한 여러 지원 서비스를 제공합니다.\n자세한 내용은 아래 사이트를 이용해보세요.',
                    textAlign: TextAlign.center,
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
            for (var contact in viewModel.supportCenters)
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
                                contact.helper.name,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(width: 16.0),
                              Text(
                                contact.helper.position,
                                style: const TextStyle(
                                  fontSize: 13,
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
                                contact.buildingName ?? '알 수 없음',
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
                                contact.helper.phoneNumber,
                                style: const TextStyle(fontSize: 14, color: Colors.blue),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    IconButton(
                      icon: const Icon(Icons.arrow_forward_ios, size: 20),
                      onPressed: () {
                        print("Right arrow clicked for ${contact.helper.name}");
                      },
                    ),
                  ],
                ),
              ),
          ],
        );
      }),
    );
  }
}
