import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_home_parking/exceptions/app_exception.dart';
import 'package:my_home_parking/model/notice/notice.dart';
import 'package:my_home_parking/state/notice/notice_bloc.dart';
import 'package:my_home_parking/state/notice/notice_state.dart';

class NoticeSelector<T> extends BlocSelector<NoticeBloc, NoticeState, T> {
  const NoticeSelector({
    super.key,
    required super.selector,
    required super.builder,
  });
}

class NoticesSelector extends NoticeSelector<List<Notice>> {
  NoticesSelector(Widget Function(List<Notice> notices) builder, {super.key})
      : super(
          selector: (state) => state.notices,
          builder: (context, notices) => builder(notices),
        );
}

class IsLoadingSelector extends NoticeSelector<bool> {
  IsLoadingSelector(Widget Function(bool isLoading) builder, {super.key})
      : super(
          selector: (state) => state.isLoading,
          builder: (context, isLoading) => builder(isLoading),
        );
}

class NoticeExceptionSelector extends NoticeSelector<AppException?> {
  NoticeExceptionSelector(Widget Function(AppException? error) builder,
      {super.key})
      : super(
          selector: (state) => state.error,
          builder: (context, error) => builder(error),
        );
}
