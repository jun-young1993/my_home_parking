import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_home_parking/core/enums/object_type.dart';
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
}
