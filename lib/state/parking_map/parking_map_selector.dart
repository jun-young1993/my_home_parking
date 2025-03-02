import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_home_parking/state/parking_map/parking_map_bloc.dart';
import 'package:my_home_parking/state/parking_map/parking_map_state.dart';

/// A BlocSelector that specifically selects and rebuilds with ParkingMap state changes.
///
/// This widget is used to efficiently rebuild only when specific parts of
/// [ParkingMapState] change, as determined by the [selector] function.
///
/// Type Parameters:
/// * [T] - The type of state to be selected from the [ParkingMapState]
class ParkingMapSelector<T>
    extends BlocSelector<ParkingMapBloc, ParkingMapState, T> {
  /// Creates a [ParkingMapSelector].
  ///
  /// The [selector] function must not be null and will be used to select a specific
  /// part of the state for comparison.
  /// The [builder] function must not be null and will be called when selected state changes.
  const ParkingMapSelector({
    super.key,
    required super.selector,
    required super.builder,
  });
}

class SaveStatusStateSelector
    extends ParkingMapSelector<ParkingMapStateSaveStatus> {
  SaveStatusStateSelector(
    Widget Function(ParkingMapStateSaveStatus saveStatus) builder, {
    super.key,
  }) : super(
         selector: (state) => state.saveStatus,
         builder: (context, saveStatus) => builder(saveStatus),
       );
}
