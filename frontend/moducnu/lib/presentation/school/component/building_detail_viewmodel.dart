import 'package:get/get.dart';
import 'package:moducnu/domain/model/building.dart';
import 'package:moducnu/domain/usecases/get_building_detail_by_id.dart';

class BuildingDetailViewmodel extends GetxController {
  final GetBuildingDetailUseCase getBuildingDetailUseCase;

  BuildingDetailViewmodel(this.getBuildingDetailUseCase);

  // 상태 변수
  var isLoading = false.obs; // 로딩 상태
  var building = Rxn<Building>(); // Building 데이터를 담을 상태
  var errorMessage = ''.obs; // 에러 메시지
  var selectedFloor = 1.obs; // 선택된 층수 상태

  // Building 데이터를 가져오는 메서드
  Future<void> fetchBuildingDetail(int buildingId) async {
    isLoading.value = true;
    errorMessage.value = '';
    try {
      final result = await getBuildingDetailUseCase.execute(buildingId);
      building.value = result; // Building 데이터 설정
      if (result.floorPlans != null && result.floorPlans!.isNotEmpty) {
        selectedFloor.value = result.floorPlans!.first.floorNumber; // 초기 층수 설정
      }
    } catch (e) {
      errorMessage.value = '건물 데이터를 가져오는 데 실패했습니다.';
    } finally {
      isLoading.value = false;
    }
  }
}
