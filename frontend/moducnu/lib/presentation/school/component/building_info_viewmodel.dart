import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:moducnu/domain/model/place.dart';
import 'package:moducnu/domain/usecases/get_all_buildings_usecase.dart';
import 'package:moducnu/domain/usecases/get_place_by_name_usecase.dart';

class BuildingInfoViewModel extends GetxController {
  final GetAllBuildingsUsecase getAllBuildingsUsecase;
  final GetPlacesByNameUseCase getPlacesByNameUseCase;

  BuildingInfoViewModel(this.getAllBuildingsUsecase, this.getPlacesByNameUseCase);

  // 상태 변수
  final RxList<Place> buildings = <Place>[].obs; // 전체 건물 리스트
  final RxList<Place> filteredBuildings = <Place>[].obs; // 검색 결과
  final RxList<Place> paginatedBuildings = <Place>[].obs; // 현재 페이지 데이터
  final RxBool isLoading = false.obs;           // 로딩 상태
  final RxString errorMessage = ''.obs;         // 에러 메시지

  // 페이지네이션 상태
  final RxInt currentPage = 1.obs; // 현재 페이지
  final int itemsPerPage = 4;     // 페이지당 항목 수

  // 초기화
  void init() {
    fetchBuildings();
  }

  // 데이터 가져오기
  Future<void> fetchBuildings() async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      final fetchedBuildings = await getAllBuildingsUsecase.execute();
      buildings.assignAll(fetchedBuildings);
      filteredBuildings.assignAll(fetchedBuildings);
      updatePagination(); // 페이지네이션 초기화
    } catch (e) {
      errorMessage.value = '데이터를 가져오는 데 실패했습니다.';
    } finally {
      isLoading.value = false;
    }
  }

  // 검색 기능
  Future<void> searchBuildings(String name) async {
    if (name.isEmpty) {
      filteredBuildings.assignAll(buildings);
    } else {
      isLoading.value = true;
      errorMessage.value = '';

      try {
        final results = await getPlacesByNameUseCase.execute(name);
        filteredBuildings.assignAll(results);
      } catch (e) {
        errorMessage.value = '검색에 실패했습니다.';
      } finally {
        isLoading.value = false;
      }
    }
    currentPage.value = 1; // 검색 시 페이지 초기화
    updatePagination();
  }

  // 페이지네이션 업데이트
  void updatePagination() {
    final start = (currentPage.value - 1) * itemsPerPage;
    final end = start + itemsPerPage;
    paginatedBuildings.assignAll(
      filteredBuildings.sublist(
        start,
        end > filteredBuildings.length ? filteredBuildings.length : end,
      ),
    );
  }

  // 다음 페이지로 이동
  void nextPage() {
    if (currentPage.value * itemsPerPage < filteredBuildings.length) {
      currentPage.value++;
      updatePagination();
    }
  }

  // 이전 페이지로 이동
  void previousPage() {
    if (currentPage.value > 1) {
      currentPage.value--;
      updatePagination();
    }
  }
}

