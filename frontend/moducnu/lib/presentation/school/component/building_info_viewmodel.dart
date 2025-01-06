import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:moducnu/domain/model/place.dart';
import 'package:moducnu/domain/usecases/get_all_buildings_usecase.dart';

class BuildingInfoViewModel extends GetxController {
  final GetAllBuildingsUsecase getAllBuildingsUsecase;

  BuildingInfoViewModel(this.getAllBuildingsUsecase);

  init () {
    fetchBuildings();
  }

  // 상태 변수
  final RxList<Place> buildings = <Place>[].obs; // 건물 리스트
  final RxBool isLoading = false.obs;           // 로딩 상태
  final RxString errorMessage = ''.obs;         // 에러 메시지

  // 데이터를 서버에서 가져오는 메서드
  Future<void> fetchBuildings() async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      final fetchedBuildings = await getAllBuildingsUsecase.execute();
      buildings.assignAll(fetchedBuildings); // 데이터 업데이트
      print('Fetched buildings: ${buildings.length}');
    } catch (e) {
      errorMessage.value = '데이터를 가져오는 데 실패했습니다.';
      print('Error fetching buildings: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
