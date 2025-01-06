import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moducnu/domain/model/support_center.dart';
import 'package:moducnu/domain/usecases/get_all_support_centers_usecase.dart';
import 'package:moducnu/domain/usecases/get_building_name_by_id_usecase.dart';
import 'package:url_launcher/url_launcher.dart';


class DisabledCenterViewModel extends GetxController {
  final GetAllSupportCentersUseCase getAllSupportCentersUseCase;
  final GetBuildingNameByIdUsecase getBuildingNameByIdUsecase;

  // 상태 변수: 지원센터 리스트
  final RxList<SupportCenter> supportCenters = <SupportCenter>[].obs;

  // 로딩 상태
  final RxBool isLoading = false.obs;

  DisabledCenterViewModel({required this.getAllSupportCentersUseCase, required this.getBuildingNameByIdUsecase});

  // 지원센터 데이터를 가져오는 메서드
  Future<void> fetchSupportCenters() async {
    int retryCount = 0;
    const int maxRetry = 3;

    while (retryCount < maxRetry) {
      try {
        isLoading.value = true;
        final centers = await getAllSupportCentersUseCase.call();

        // 건물 이름 가져오기
        for (var center in centers) {
          final buildingName = await getBuildingNameByIdUsecase.execute(center.buildingId);
          center.buildingName = buildingName.replaceAll("\"", ""); // SupportCenter에 buildingName 추가
        }

        supportCenters.assignAll(centers);
        return; // 성공하면 종료
      } catch (e) {
        retryCount++;
        print('Error fetching support centers (Attempt $retryCount): $e');
        if (retryCount >= maxRetry) {
          print('Max retry attempts reached.');
          Get.snackbar(
            '데이터 로드 실패',
            '장애학습지원센터 데이터를 가져오는데 실패했습니다.',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.redAccent,
            colorText: Colors.white,
          );
        }
      } finally {
        isLoading.value = false;
      }
    }
  }

  // 지원센터 ID로 건물 이름을 가져오는 메서드
  String getBuildingNameById(int id) {
    String buildingName = getBuildingNameByIdUsecase.execute(id) as String;
    return buildingName;
  }

  // 지원센터 사이트 열기 메서드
  Future<void> openSupportCenterUrl() async {
    const String url = 'https://doumi.cnu.ac.kr/doumi/index.do';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      Get.snackbar(
        '링크 열기 실패',
        '장애학습지원센터 사이트를 열 수 없습니다.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    }
  }
}
