import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_home_parking/repository/main_repository.dart';
import 'package:my_home_parking/state/main/main_event.dart';
import 'package:my_home_parking/state/main/main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final MainRepository _mainRepository;

  MainBloc(this._mainRepository) : super(MainState.initialize()) {
    on<MainEvent>((event, emit) {
      // 여기서 _mainRepository 사용
      print(_mainRepository);
    });
  }
}
