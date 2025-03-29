import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_home_parking/exceptions/app_exception.dart';
import 'package:my_home_parking/repository/notice_repository.dart';
import 'package:my_home_parking/state/main/main_bloc.dart';
import 'package:my_home_parking/state/notice/notice_event.dart';
import 'package:my_home_parking/state/notice/notice_state.dart';

class NoticeBloc extends Bloc<NoticeEvent, NoticeState> {
  final NoticeRepository _noticeRepository;
  final MainBloc _mainBloc;

  NoticeBloc(this._noticeRepository, this._mainBloc)
      : super(NoticeState.initialize()) {
    on<NoticeEvent>((event, emit) async {
      try {
        await event.map(
          getNotices: (_) async => _handleEvent(
            emit,
            () async {
              final mainState = _mainBloc.state;
              final zoneCode = mainState.userInfo?.zoneCode;
              if (zoneCode == null) {
                throw const AppException.unknown('zoneCode is null');
              }
              final notices = await _noticeRepository.getNotices(zoneCode);

              emit(state.copyWith(notices: notices));
            },
          ),
          clearError: (_) async => _handleEvent(
            emit,
            () async {
              emit(state.copyWith(error: null));
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
    Emitter<NoticeState> emit,
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
