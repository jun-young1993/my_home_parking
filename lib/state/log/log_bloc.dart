import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_home_parking/exceptions/app_exception.dart';
import 'package:my_home_parking/repository/log_repository.dart';
import 'package:my_home_parking/repository/main_repository.dart';
import 'package:my_home_parking/state/log/log_event.dart';
import 'package:my_home_parking/state/log/log_state.dart';

class LogBloc extends Bloc<LogEvent, LogState> {
  final LogRepository _logRepository;
  final MainRepository _mainRepository;

  LogBloc(this._logRepository, this._mainRepository)
      : super(LogState.initialize()) {
    on<LogEvent>((event, emit) async {
      try {
        await event.map(
          getLogs: (_) async => _handleEvent(
            emit,
            () async {
              final userInfo = await _mainRepository.getUserInfoOrFail();
              final zoneCode = userInfo.zoneCode;

              final logs = await _logRepository.getLogs(zoneCode);
              emit(state.copyWith(logs: logs));
            },
          ),
        );
      } catch (e) {
        emit(state.copyWith(error: AppException.unknown(e.toString())));
      }
    });
  }

  Future<void> _handleEvent<T>(
    Emitter<LogState> emit,
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
