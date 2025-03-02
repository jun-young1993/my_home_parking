import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_home_parking/repository/parking_map_repository.dart';
import 'package:my_home_parking/state/parking_map/parking_map_event.dart';
import 'package:my_home_parking/state/parking_map/parking_map_state.dart';

// BLoC
class ParkingMapBloc extends Bloc<ParkingMapEvent, ParkingMapState> {
  final ParkingMapRepository _parkingMapRepository;
  ParkingMapBloc(this._parkingMapRepository)
    : super(ParkingMapState.initialize()) {
    on<SelectObject>(_onSelectObject);
    on<AddObject>(_onAddObject);
    on<SaveParkingLayout>(_onSaveParkingLayout);
  }

  void _onSelectObject(SelectObject event, Emitter<ParkingMapState> emit) {
    emit(state.copyWith(selectedObjectType: event.objectType));
  }

  void _onAddObject(AddObject event, Emitter<ParkingMapState> emit) {
    final message = state.createObjectSelectionMessage(event.objectType);
    emit(state.copyWith(selectedObjectType: event.objectType));
    event.webViewController.evaluateJavascript(
      source: 'window.postMessage($message, "*")',
    );
  }

  Future<void> _onTogglePullToRefresh(
    TogglePullToRefresh event,
    Emitter<ParkingMapState> emit,
  ) async {
    // Implementation of _onTogglePullToRefresh
  }

  Future<void> _onSaveParkingLayout(
    SaveParkingLayout event,
    Emitter<ParkingMapState> emit,
  ) async {
    try {
      // 저장 시작
      emit(state.copyWith(isSaving: true, saveError: null));

      // 저장 실행
      // final success = await _parkingMapRepository.saveParkingLayout(
      //   state.parkingLayout,
      // );
      final success = true;

      if (success) {
        // 저장 성공
        emit(state.copyWith(isSaving: false));
      } else {
        // 저장 실패
        emit(state.copyWith(isSaving: false, saveError: '저장에 실패했습니다.'));
      }
    } catch (e) {
      // 에러 처리
      emit(state.copyWith(isSaving: false, saveError: '저장 중 오류가 발생했습니다: $e'));
    }
  }
}
