import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moducnu/domain/model/place.dart';
import 'package:moducnu/domain/usecases/add_saved_location_usecase.dart';
import 'package:moducnu/domain/usecases/delete_saved_location_usecase.dart';
import 'package:moducnu/domain/usecases/get_coordinate_by_nodeid_usecase.dart';
import 'package:moducnu/domain/usecases/get_saved_locations_usecase.dart';

class SaveViewmodel extends GetxController {
  final GetSavedLocationsUseCase getSavedLocationsUseCase;
  final AddSavedLocationUseCase addSavedLocationUseCase;
  final DeleteSavedLocationUseCase deleteSavedLocationUseCase;
  final GetCoordinateByNodeidUsecase getCoordinateByNodeidUsecase;

  SaveViewmodel(this.getSavedLocationsUseCase, this.addSavedLocationUseCase,
      this.deleteSavedLocationUseCase, this.getCoordinateByNodeidUsecase);

  // Observable 리스트
  final savedLocations = <Place>[].obs;
  final isLoading = false.obs;

  // 저장된 장소 불러오기
  Future<void> fetchSavedLocations() async {
    isLoading.value = true;
    try {
      final locations = await getSavedLocationsUseCase.execute();
      savedLocations.assignAll(locations);
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch saved locations: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // 장소 추가
  Future<void> addSavedLocation(Place place) async {
    try {
      await addSavedLocationUseCase.execute(place);
      savedLocations.add(place);
    } catch (e) {
      Get.snackbar('Error', 'Failed to add saved location: $e');
    }
  }

  // 장소 삭제
  Future<void> deleteSavedLocation(int buildingId) async {
    try {
      await deleteSavedLocationUseCase.execute(buildingId);
      savedLocations.removeWhere((place) => place.id == buildingId);
    } catch (e) {
      Get.snackbar('Error', 'Failed to delete saved location: $e');
    }
  }

  // 마커 데이터 리스트 반환
  Future<List<Map<String, dynamic>>> getMarkerData() async {
    final markers = <Map<String, dynamic>>[];

    for (var place in savedLocations) {
      try {
        final position = await getCoordinateByNodeidUsecase.execute(place);
        // 디버깅
        print('Fetched position for ${place.placeName}: $position');
        markers.add({
          'latitude': position.latitude,
          'longitude': position.longitude,
          'id': place.nodeId,
        });
      } catch (e) {
        Get.snackbar(
            'Error', 'Failed to fetch coordinates for ${place.nodeId}');
      }
    }

    return markers;
  }
}
