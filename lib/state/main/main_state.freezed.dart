// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MainState {
  bool get isLoading => throw _privateConstructorUsedError;
  UserInfo? get userInfo => throw _privateConstructorUsedError;
  AppException? get error => throw _privateConstructorUsedError;
  ParkingLocationZoneResponse? get parkingLocationZone =>
      throw _privateConstructorUsedError;

  /// Create a copy of MainState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MainStateCopyWith<MainState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainStateCopyWith<$Res> {
  factory $MainStateCopyWith(MainState value, $Res Function(MainState) then) =
      _$MainStateCopyWithImpl<$Res, MainState>;
  @useResult
  $Res call(
      {bool isLoading,
      UserInfo? userInfo,
      AppException? error,
      ParkingLocationZoneResponse? parkingLocationZone});

  $UserInfoCopyWith<$Res>? get userInfo;
  $AppExceptionCopyWith<$Res>? get error;
  $ParkingLocationZoneResponseCopyWith<$Res>? get parkingLocationZone;
}

/// @nodoc
class _$MainStateCopyWithImpl<$Res, $Val extends MainState>
    implements $MainStateCopyWith<$Res> {
  _$MainStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MainState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? userInfo = freezed,
    Object? error = freezed,
    Object? parkingLocationZone = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      userInfo: freezed == userInfo
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as UserInfo?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as AppException?,
      parkingLocationZone: freezed == parkingLocationZone
          ? _value.parkingLocationZone
          : parkingLocationZone // ignore: cast_nullable_to_non_nullable
              as ParkingLocationZoneResponse?,
    ) as $Val);
  }

  /// Create a copy of MainState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserInfoCopyWith<$Res>? get userInfo {
    if (_value.userInfo == null) {
      return null;
    }

    return $UserInfoCopyWith<$Res>(_value.userInfo!, (value) {
      return _then(_value.copyWith(userInfo: value) as $Val);
    });
  }

  /// Create a copy of MainState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppExceptionCopyWith<$Res>? get error {
    if (_value.error == null) {
      return null;
    }

    return $AppExceptionCopyWith<$Res>(_value.error!, (value) {
      return _then(_value.copyWith(error: value) as $Val);
    });
  }

  /// Create a copy of MainState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ParkingLocationZoneResponseCopyWith<$Res>? get parkingLocationZone {
    if (_value.parkingLocationZone == null) {
      return null;
    }

    return $ParkingLocationZoneResponseCopyWith<$Res>(
        _value.parkingLocationZone!, (value) {
      return _then(_value.copyWith(parkingLocationZone: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MainStateImplCopyWith<$Res>
    implements $MainStateCopyWith<$Res> {
  factory _$$MainStateImplCopyWith(
          _$MainStateImpl value, $Res Function(_$MainStateImpl) then) =
      __$$MainStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      UserInfo? userInfo,
      AppException? error,
      ParkingLocationZoneResponse? parkingLocationZone});

  @override
  $UserInfoCopyWith<$Res>? get userInfo;
  @override
  $AppExceptionCopyWith<$Res>? get error;
  @override
  $ParkingLocationZoneResponseCopyWith<$Res>? get parkingLocationZone;
}

/// @nodoc
class __$$MainStateImplCopyWithImpl<$Res>
    extends _$MainStateCopyWithImpl<$Res, _$MainStateImpl>
    implements _$$MainStateImplCopyWith<$Res> {
  __$$MainStateImplCopyWithImpl(
      _$MainStateImpl _value, $Res Function(_$MainStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MainState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? userInfo = freezed,
    Object? error = freezed,
    Object? parkingLocationZone = freezed,
  }) {
    return _then(_$MainStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      userInfo: freezed == userInfo
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as UserInfo?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as AppException?,
      parkingLocationZone: freezed == parkingLocationZone
          ? _value.parkingLocationZone
          : parkingLocationZone // ignore: cast_nullable_to_non_nullable
              as ParkingLocationZoneResponse?,
    ));
  }
}

/// @nodoc

class _$MainStateImpl implements _MainState {
  const _$MainStateImpl(
      {this.isLoading = false,
      this.userInfo = null,
      this.error = null,
      this.parkingLocationZone = null});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final UserInfo? userInfo;
  @override
  @JsonKey()
  final AppException? error;
  @override
  @JsonKey()
  final ParkingLocationZoneResponse? parkingLocationZone;

  @override
  String toString() {
    return 'MainState(isLoading: $isLoading, userInfo: $userInfo, error: $error, parkingLocationZone: $parkingLocationZone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.userInfo, userInfo) ||
                other.userInfo == userInfo) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.parkingLocationZone, parkingLocationZone) ||
                other.parkingLocationZone == parkingLocationZone));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, userInfo, error, parkingLocationZone);

  /// Create a copy of MainState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MainStateImplCopyWith<_$MainStateImpl> get copyWith =>
      __$$MainStateImplCopyWithImpl<_$MainStateImpl>(this, _$identity);
}

abstract class _MainState implements MainState {
  const factory _MainState(
          {final bool isLoading,
          final UserInfo? userInfo,
          final AppException? error,
          final ParkingLocationZoneResponse? parkingLocationZone}) =
      _$MainStateImpl;

  @override
  bool get isLoading;
  @override
  UserInfo? get userInfo;
  @override
  AppException? get error;
  @override
  ParkingLocationZoneResponse? get parkingLocationZone;

  /// Create a copy of MainState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MainStateImplCopyWith<_$MainStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
