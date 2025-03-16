import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_home_parking/exceptions/app_exception.dart';
import 'package:my_home_parking/model/api/response/parking_location/parking_location_zone.dart';
import 'package:my_home_parking/model/user_info.dart';
import 'package:my_home_parking/state/main/main_bloc.dart';
import 'package:my_home_parking/state/main/main_state.dart';

class MainSelector<T> extends BlocSelector<MainBloc, MainState, T> {
  const MainSelector({
    super.key,
    required super.selector,
    required super.builder,
  });
}

class UserInfoSelector extends MainSelector<UserInfo?> {
  UserInfoSelector(Widget Function(UserInfo? userInfo) builder, {super.key})
      : super(
          selector: (state) => state.userInfo,
          builder: (context, userInfo) => builder(userInfo),
        );
}

class ExceptionSelector extends MainSelector<AppException?> {
  ExceptionSelector(Widget Function(AppException? exception) builder,
      {super.key})
      : super(
          selector: (state) => state.error,
          builder: (context, exception) => builder(exception),
        );
}

class ParkingLocationZoneSelector
    extends MainSelector<ParkingLocationZoneResponse?> {
  ParkingLocationZoneSelector(
      Widget Function(ParkingLocationZoneResponse? parkingLocationZone) builder,
      {super.key})
      : super(
          selector: (state) => state.parkingLocationZone,
          builder: (context, parkingLocationZone) =>
              builder(parkingLocationZone),
        );
}
