import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_home_parking/exceptions/app_exception.dart';
import 'package:my_home_parking/repository/main_repository.dart';
import 'package:my_home_parking/repository/my_car_repository.dart';
import 'package:my_home_parking/state/main/main_event.dart';
import 'package:my_home_parking/state/main/main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final MainRepository _mainRepository;
  final MyCarRepository _myCarRepository;

  MainBloc(
    this._mainRepository,
    this._myCarRepository,
  ) : super(MainState.initialize()) {
    on<MainEvent>((event, emit) async {
      try {
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
          updateLocation: (event) async => _handleEvent(
            emit,
            () async {
              final userInfo = event.userInfo;
              final originalUserInfo =
                  await _mainRepository.getUserInfoOrFail();
              if (originalUserInfo.carNumber == null) {
                throw const AppException.notFoundCarNumber();
              }
              final carNumber = await _myCarRepository.updateLocation(
                  originalUserInfo.carNumber!, userInfo.zoneCode);

              add(MainEvent.saveUserInfo(
                  userInfo.copyWith(carNumber: carNumber)));
              add(const MainEvent.checkUserInfo());
              add(const MainEvent.getParkingLocationZone());
            },
          ),
          createCarNumber: (event) async => _handleEvent(
            emit,
            () async {
              print('createCarNumber: ${event.carNumber}');

              await _mainRepository.updateCarNumber(event.carNumber);

              add(const MainEvent.checkUserInfo());
            },
          ),
          clearError: (_) async => _handleEvent(
            emit,
            () async {
              emit(state.copyWith(error: null, isLoading: false));
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
              final parkingLocationZone = await _mainRepository
                  .getParkingLocationZone(userInfo.zoneCode);

              emit(state.copyWith(
                parkingLocationZone: parkingLocationZone,
              ));
            },
          ),
          updateParkingCarNumber: (event) async => _handleEvent(
            emit,
            () async {
              final catNumber = await _myCarRepository
                  .updateParkingCarNumber(event.carNumber);
              final userInfo = await _mainRepository.getUserInfoOrFail();
              final updatedUserInfo = userInfo.copyWith(carNumber: catNumber);
              await _mainRepository.saveUserInfo(updatedUserInfo);
              add(const MainEvent.checkUserInfo());
            },
          ),
          updateMessageCarNumber: (event) async => _handleEvent(
            emit,
            () async {
              final catNumber = await _myCarRepository
                  .updateMessageCarNumber(event.carNumber);
              final userInfo = await _mainRepository.getUserInfoOrFail();
              final updatedUserInfo = userInfo.copyWith(carNumber: catNumber);
              await _mainRepository.saveUserInfo(updatedUserInfo);
              add(const MainEvent.checkUserInfo());
              add(const MainEvent.getParkingLocationZone());
            },
          ),
          sendFcm: (event) async => _handleEvent(
            emit,
            () async {
              await _myCarRepository.sendFcm(event.senderCarNumberId,
                  event.targetCarNumberId, event.message);
            },
          ),
        );
      } catch (e, stackTrace) {
        _handleEvent(
          emit,
          () async {},
          defaultError: AppException.unknown(e.toString()),
        );
      }
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
    } catch (e, stackTrace) {
      print('🔴 예상치 못한 에러 발생:');
      print('에러 타입: ${e.runtimeType}');
      print('에러 메시지: $e');
      print('스택 트레이스:');
      print(stackTrace);

      // 디버깅용 컨텍스트 정보 추가
      print('현재 상태: $state');
      print('에러 발생 시간: ${DateTime.now()}');

      emit(state.copyWith(
        isLoading: false,
        error: defaultError ?? AppException.unknown(e.toString()),
      ));
    }
  }
}
