import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_home_parking/exceptions/app_exception.dart';
import 'package:my_home_parking/repository/main_repository.dart';
import 'package:my_home_parking/state/main/main_event.dart';
import 'package:my_home_parking/state/main/main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final MainRepository _mainRepository;

  MainBloc(this._mainRepository) : super(MainState.initialize()) {
    on<MainEvent>((event, emit) async {
      await event.map(
        checkUserInfo: (_) async => _handleEvent(
          emit,
          () async {
            final userInfo = await _mainRepository.getUserInfoOrFail();

            emit(state.copyWith(
              userInfo: userInfo,
            ));
          },
        ),
        checkCarNumber: (_) async => _handleEvent(
          emit,
          () async {
            final userInfo =
                await _mainRepository.getUserInfoOrFailWithCarNumber();
            emit(state.copyWith(
              userInfo: userInfo,
            ));
          },
        ),
        saveUserInfo: (event) async => _handleEvent(
          emit,
          () async {
            await _mainRepository.saveUserInfo(event.userInfo);
            add(const MainEvent.checkUserInfo());
          },
          defaultError: const AppException.userInfoSave(),
        ),
        updateCarNumber: (event) async => _handleEvent(
          emit,
          () async {
            await _mainRepository.updateCarNumber(event.carNumber);
            add(const MainEvent.checkUserInfo());
          },
        ),
        clearError: (_) async => _handleEvent(
          emit,
          () async {
            emit(state.copyWith(error: null));
          },
        ),
        removeUserInfo: (_) async => _handleEvent(
          emit,
          () async {
            await _mainRepository.removeUserInfo();
            add(const MainEvent.checkUserInfo());
          },
        ),
        getParkingLocationZone: (event) async => _handleEvent(
          emit,
          () async {
            final userInfo = await _mainRepository.getUserInfoOrFail();
            final parkingLocationZone =
                await _mainRepository.getParkingLocationZone(userInfo.zoneCode);
            emit(state.copyWith(
              parkingLocationZone: parkingLocationZone,
            ));
          },
        ),
      );
    });
  }

  Future<void> _handleEvent<T>(
    Emitter<MainState> emit,
    Future<T> Function() action, {
    AppException? defaultError,
  }) async {
    emit(state.copyWith(isLoading: true));
    try {
      await action();
      emit(state.copyWith(
        isLoading: false,
        error: null,
      ));
    } on AppException catch (e) {
      emit(state.copyWith(isLoading: false, error: e));
    } on PlatformException catch (_) {
      emit(state.copyWith(
        isLoading: false,
        error: const AppException.webView(),
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: defaultError ?? AppException.unknown(e.toString()),
      ));
    }
  }
}
