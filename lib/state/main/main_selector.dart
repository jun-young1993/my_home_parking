import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_home_parking/state/main/main_bloc.dart';
import 'package:my_home_parking/state/main/main_state.dart';

class MainSelector<T> extends BlocSelector<MainBloc, MainState, T> {
  const MainSelector({
    super.key,
    required super.selector,
    required super.builder,
  });
}
