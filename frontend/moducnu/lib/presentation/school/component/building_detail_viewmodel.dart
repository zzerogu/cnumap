import 'package:get/get.dart';
import 'package:moducnu/domain/model/building.dart';
import 'package:moducnu/domain/model/place.dart';
import 'package:moducnu/domain/usecases/add_saved_location_usecase.dart';
import 'package:moducnu/domain/usecases/check_if_place_saved_usecase.dart';
import 'package:moducnu/domain/usecases/delete_saved_location_usecase.dart';
import 'package:moducnu/domain/usecases/get_building_detail_by_id.dart';

class BuildingDetailViewmodel extends GetxController {
  final GetBuildingDetailUseCase getBuildingDetailUseCase;
  final CheckIfPlaceIsSavedUseCase checkIfPlaceIsSavedUseCase;
  final AddSavedLocationUseCase addSavedLocationUseCase;
  final DeleteSavedLocationUseCase deleteSavedLocationUseCase;

  BuildingDetailViewmodel(
      this.getBuildingDetailUseCase,
      this.checkIfPlaceIsSavedUseCase,
      this.addSavedLocationUseCase,
      this.deleteSavedLocationUseCase,
      );

  // 상태 변수
  var isLoading = false.obs; // 로딩 상태
  var building = Rxn<Building>(); // Building 데이터를 담을 상태
  var errorMessage = ''.obs; // 에러 메시지
  var selectedFloor = 1.obs; // 선택된 층수 상태
  var isSaved = false.obs; // 장소가 저장되었는지 여부

  // Building 데이터를 가져오는 메서드
  Future<void> fetchBuildingDetail(int buildingId) async {
    isLoading.value = true;
    errorMessage.value = '';
    try {
      // Building 데이터 가져오기
      final result = await getBuildingDetailUseCase.execute(buildingId);
      building.value = result; // Building 데이터 설정

      if (result.floorPlans != null && result.floorPlans!.isNotEmpty) {
        selectedFloor.value = result.floorPlans!.first.floorNumber; // 초기 층수 설정
      }

      // 저장 여부 확인
      final savedStatus = await checkIfPlaceIsSavedUseCase.execute(buildingId);
      isSaved.value = savedStatus;

    } catch (e) {
      errorMessage.value = '건물 데이터를 가져오는 데 실패했습니다.';
    } finally {
      isLoading.value = false;
    }
  }

  // 저장된 장소에 추가하는 메서드
  Future<void> addSavedLocation() async {
    if (building.value != null) {
      try {
        // 카테고리를 문자열로 변환
        final category = building.value!.tags?.join(', ') ?? '카테고리 없음';

        // Place 객체 생성
        final place = Place(
          id: building.value!.buildingId ?? 0,
          placeName: building.value!.name ?? '이름 없음',
          category: category,
          alias: building.value!.alias ?? '별칭 없음',
          nodeId: building.value!.nodeId ?? '',
          contact: building.value!.phoneNumber ?? '연락처 없음',
        );

        // 저장된 장소 추가
        await addSavedLocationUseCase.execute(place);
        isSaved.value = true; // 저장 상태 업데이트
      } catch (e) {
        errorMessage.value = '장소를 저장하는 데 실패했습니다. (${e.toString()})';
      }
    } else {
      errorMessage.value = '저장할 데이터가 없습니다.';
    }
  }

  // 저장 상태 토글
  Future<void> toggleSavedStatus() async {
    if (building.value == null) {
      errorMessage.value = '건물 데이터가 없습니다.';
      return;
    }

    try {
      if (isSaved.value) {
        // 저장 해제
        await deleteSavedLocationUseCase.execute(building.value!.buildingId!);
        isSaved.value = false;
      } else {
        // 저장
        await addSavedLocation();
      }
    } catch (e) {
      errorMessage.value = '저장 상태 변경에 실패했습니다. (${e.toString()})';
    }
  }
}

