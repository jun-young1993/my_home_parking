import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_home_parking/model/log/log.dart';
import 'package:my_home_parking/state/log/log_bloc.dart';
import 'package:my_home_parking/state/log/log_state.dart';

class LogSelector<T> extends BlocSelector<LogBloc, LogState, T> {
  const LogSelector({
    super.key,
    required super.selector,
    required super.builder,
  });
}

class LogFirstSelector extends LogSelector<Log?> {
  LogFirstSelector(Widget Function(Log? log) builder, {super.key})
      : super(
          selector: (state) => state.logs.isNotEmpty ? state.logs[0] : null,
          builder: (context, log) => builder(log),
        );
}

class LogListSelector extends LogSelector<List<Log>> {
  LogListSelector(Widget Function(List<Log> logs) builder, {super.key})
      : super(
          selector: (state) => state.logs,
          builder: (context, logs) => builder(logs),
        );
}
