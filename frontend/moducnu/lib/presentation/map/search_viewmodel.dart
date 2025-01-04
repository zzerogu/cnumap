import 'package:get/get.dart';
import 'package:moducnu/domain/model/place.dart';
import 'package:moducnu/domain/usecases/get_place_by_name_usecase.dart';
import 'package:moducnu/domain/usecases/get_places_by_category_usecase.dart';

class SearchViewModel extends GetxController {
  final GetPlacesByNameUseCase _getPlacesByNameUseCase;
  final GetPlacesByCategoryUseCase _getPlacesByCategoryUseCase;

  // 상태 관리
  final RxList<Place> _places = <Place>[].obs;
  final RxString _error = ''.obs;
  final RxBool _isLoading = false.obs;

  // Getters
  List<Place> get places => _places;
  String get error => _error.value;
  bool get isLoading => _isLoading.value;

  SearchViewModel({
    required GetPlacesByNameUseCase getPlacesByNameUseCase,
    required GetPlacesByCategoryUseCase getPlacesByCategoryUseCase,
  })  : _getPlacesByNameUseCase = getPlacesByNameUseCase,
        _getPlacesByCategoryUseCase = getPlacesByCategoryUseCase;

  /// 검색 수행
  Future<void> searchPlaces(String query) async {
    if (query.isEmpty) {
      _places.clear();
      return;
    }

    _isLoading.value = true;
    _error.value = '';

    try {
      final placesByName = await _getPlacesByNameUseCase.execute(query);
      final placesByCategory = await _getPlacesByCategoryUseCase.execute(query);

      // Ensure the uniquePlaces is treated as Iterable<Place>
      final uniquePlaces = {...placesByName, ...placesByCategory};
      _places.assignAll(uniquePlaces.cast<Place>().toList());
    } catch (e) {
      _error.value = "검색 중 오류 발생: ${e.toString()}";
    } finally {
      _isLoading.value = false;
    }
  }
}
