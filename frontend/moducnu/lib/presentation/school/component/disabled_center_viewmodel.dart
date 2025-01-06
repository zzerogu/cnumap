import 'package:get/get.dart';
import 'package:moducnu/domain/model/support_center.dart';
import 'package:moducnu/domain/usecases/get_all_support_centers_usecase.dart';

class DisabledCenterViewModel extends GetxController {
  final GetAllSupportCentersUseCase getAllSupportCentersUseCase;

  // 상태 변수: 지원센터 리스트
  final RxList<SupportCenter> supportCenters = <SupportCenter>[].obs;

  // 로딩 상태
  final RxBool isLoading = false.obs;

  DisabledCenterViewModel({required this.getAllSupportCentersUseCase});

  // 지원센터 데이터를 가져오는 메서드
  Future<void> fetchSupportCenters() async {
    try {
      isLoading.value = true;
      final centers = await getAllSupportCentersUseCase.call();
      supportCenters.assignAll(centers);
    } catch (e) {
      print('Error fetching support centers: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
