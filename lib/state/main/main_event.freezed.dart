// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MainEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkUserInfo,
    required TResult Function(UserInfo userInfo) registerUserInfo,
    required TResult Function(UserInfo userInfo) updateUserInfo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkUserInfo,
    TResult? Function(UserInfo userInfo)? registerUserInfo,
    TResult? Function(UserInfo userInfo)? updateUserInfo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkUserInfo,
    TResult Function(UserInfo userInfo)? registerUserInfo,
    TResult Function(UserInfo userInfo)? updateUserInfo,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckUserInfo value) checkUserInfo,
    required TResult Function(_RegisterUserInfo value) registerUserInfo,
    required TResult Function(_UpdateUserInfo value) updateUserInfo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckUserInfo value)? checkUserInfo,
    TResult? Function(_RegisterUserInfo value)? registerUserInfo,
    TResult? Function(_UpdateUserInfo value)? updateUserInfo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckUserInfo value)? checkUserInfo,
    TResult Function(_RegisterUserInfo value)? registerUserInfo,
    TResult Function(_UpdateUserInfo value)? updateUserInfo,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainEventCopyWith<$Res> {
  factory $MainEventCopyWith(MainEvent value, $Res Function(MainEvent) then) =
      _$MainEventCopyWithImpl<$Res, MainEvent>;
}

/// @nodoc
class _$MainEventCopyWithImpl<$Res, $Val extends MainEvent>
    implements $MainEventCopyWith<$Res> {
  _$MainEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MainEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$CheckUserInfoImplCopyWith<$Res> {
  factory _$$CheckUserInfoImplCopyWith(
          _$CheckUserInfoImpl value, $Res Function(_$CheckUserInfoImpl) then) =
      __$$CheckUserInfoImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckUserInfoImplCopyWithImpl<$Res>
    extends _$MainEventCopyWithImpl<$Res, _$CheckUserInfoImpl>
    implements _$$CheckUserInfoImplCopyWith<$Res> {
  __$$CheckUserInfoImplCopyWithImpl(
      _$CheckUserInfoImpl _value, $Res Function(_$CheckUserInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of MainEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CheckUserInfoImpl implements _CheckUserInfo {
  const _$CheckUserInfoImpl();

  @override
  String toString() {
    return 'MainEvent.checkUserInfo()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CheckUserInfoImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkUserInfo,
    required TResult Function(UserInfo userInfo) registerUserInfo,
    required TResult Function(UserInfo userInfo) updateUserInfo,
  }) {
    return checkUserInfo();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkUserInfo,
    TResult? Function(UserInfo userInfo)? registerUserInfo,
    TResult? Function(UserInfo userInfo)? updateUserInfo,
  }) {
    return checkUserInfo?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkUserInfo,
    TResult Function(UserInfo userInfo)? registerUserInfo,
    TResult Function(UserInfo userInfo)? updateUserInfo,
    required TResult orElse(),
  }) {
    if (checkUserInfo != null) {
      return checkUserInfo();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckUserInfo value) checkUserInfo,
    required TResult Function(_RegisterUserInfo value) registerUserInfo,
    required TResult Function(_UpdateUserInfo value) updateUserInfo,
  }) {
    return checkUserInfo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckUserInfo value)? checkUserInfo,
    TResult? Function(_RegisterUserInfo value)? registerUserInfo,
    TResult? Function(_UpdateUserInfo value)? updateUserInfo,
  }) {
    return checkUserInfo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckUserInfo value)? checkUserInfo,
    TResult Function(_RegisterUserInfo value)? registerUserInfo,
    TResult Function(_UpdateUserInfo value)? updateUserInfo,
    required TResult orElse(),
  }) {
    if (checkUserInfo != null) {
      return checkUserInfo(this);
    }
    return orElse();
  }
}

abstract class _CheckUserInfo implements MainEvent {
  const factory _CheckUserInfo() = _$CheckUserInfoImpl;
}

/// @nodoc
abstract class _$$RegisterUserInfoImplCopyWith<$Res> {
  factory _$$RegisterUserInfoImplCopyWith(_$RegisterUserInfoImpl value,
          $Res Function(_$RegisterUserInfoImpl) then) =
      __$$RegisterUserInfoImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserInfo userInfo});

  $UserInfoCopyWith<$Res> get userInfo;
}

/// @nodoc
class __$$RegisterUserInfoImplCopyWithImpl<$Res>
    extends _$MainEventCopyWithImpl<$Res, _$RegisterUserInfoImpl>
    implements _$$RegisterUserInfoImplCopyWith<$Res> {
  __$$RegisterUserInfoImplCopyWithImpl(_$RegisterUserInfoImpl _value,
      $Res Function(_$RegisterUserInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of MainEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userInfo = null,
  }) {
    return _then(_$RegisterUserInfoImpl(
      null == userInfo
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as UserInfo,
    ));
  }

  /// Create a copy of MainEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserInfoCopyWith<$Res> get userInfo {
    return $UserInfoCopyWith<$Res>(_value.userInfo, (value) {
      return _then(_value.copyWith(userInfo: value));
    });
  }
}

/// @nodoc

class _$RegisterUserInfoImpl implements _RegisterUserInfo {
  const _$RegisterUserInfoImpl(this.userInfo);

  @override
  final UserInfo userInfo;

  @override
  String toString() {
    return 'MainEvent.registerUserInfo(userInfo: $userInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterUserInfoImpl &&
            (identical(other.userInfo, userInfo) ||
                other.userInfo == userInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userInfo);

  /// Create a copy of MainEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterUserInfoImplCopyWith<_$RegisterUserInfoImpl> get copyWith =>
      __$$RegisterUserInfoImplCopyWithImpl<_$RegisterUserInfoImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkUserInfo,
    required TResult Function(UserInfo userInfo) registerUserInfo,
    required TResult Function(UserInfo userInfo) updateUserInfo,
  }) {
    return registerUserInfo(userInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkUserInfo,
    TResult? Function(UserInfo userInfo)? registerUserInfo,
    TResult? Function(UserInfo userInfo)? updateUserInfo,
  }) {
    return registerUserInfo?.call(userInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkUserInfo,
    TResult Function(UserInfo userInfo)? registerUserInfo,
    TResult Function(UserInfo userInfo)? updateUserInfo,
    required TResult orElse(),
  }) {
    if (registerUserInfo != null) {
      return registerUserInfo(userInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckUserInfo value) checkUserInfo,
    required TResult Function(_RegisterUserInfo value) registerUserInfo,
    required TResult Function(_UpdateUserInfo value) updateUserInfo,
  }) {
    return registerUserInfo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckUserInfo value)? checkUserInfo,
    TResult? Function(_RegisterUserInfo value)? registerUserInfo,
    TResult? Function(_UpdateUserInfo value)? updateUserInfo,
  }) {
    return registerUserInfo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckUserInfo value)? checkUserInfo,
    TResult Function(_RegisterUserInfo value)? registerUserInfo,
    TResult Function(_UpdateUserInfo value)? updateUserInfo,
    required TResult orElse(),
  }) {
    if (registerUserInfo != null) {
      return registerUserInfo(this);
    }
    return orElse();
  }
}

abstract class _RegisterUserInfo implements MainEvent {
  const factory _RegisterUserInfo(final UserInfo userInfo) =
      _$RegisterUserInfoImpl;

  UserInfo get userInfo;

  /// Create a copy of MainEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterUserInfoImplCopyWith<_$RegisterUserInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateUserInfoImplCopyWith<$Res> {
  factory _$$UpdateUserInfoImplCopyWith(_$UpdateUserInfoImpl value,
          $Res Function(_$UpdateUserInfoImpl) then) =
      __$$UpdateUserInfoImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserInfo userInfo});

  $UserInfoCopyWith<$Res> get userInfo;
}

/// @nodoc
class __$$UpdateUserInfoImplCopyWithImpl<$Res>
    extends _$MainEventCopyWithImpl<$Res, _$UpdateUserInfoImpl>
    implements _$$UpdateUserInfoImplCopyWith<$Res> {
  __$$UpdateUserInfoImplCopyWithImpl(
      _$UpdateUserInfoImpl _value, $Res Function(_$UpdateUserInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of MainEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userInfo = null,
  }) {
    return _then(_$UpdateUserInfoImpl(
      null == userInfo
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as UserInfo,
    ));
  }

  /// Create a copy of MainEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserInfoCopyWith<$Res> get userInfo {
    return $UserInfoCopyWith<$Res>(_value.userInfo, (value) {
      return _then(_value.copyWith(userInfo: value));
    });
  }
}

/// @nodoc

class _$UpdateUserInfoImpl implements _UpdateUserInfo {
  const _$UpdateUserInfoImpl(this.userInfo);

  @override
  final UserInfo userInfo;

  @override
  String toString() {
    return 'MainEvent.updateUserInfo(userInfo: $userInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateUserInfoImpl &&
            (identical(other.userInfo, userInfo) ||
                other.userInfo == userInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userInfo);

  /// Create a copy of MainEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateUserInfoImplCopyWith<_$UpdateUserInfoImpl> get copyWith =>
      __$$UpdateUserInfoImplCopyWithImpl<_$UpdateUserInfoImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkUserInfo,
    required TResult Function(UserInfo userInfo) registerUserInfo,
    required TResult Function(UserInfo userInfo) updateUserInfo,
  }) {
    return updateUserInfo(userInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkUserInfo,
    TResult? Function(UserInfo userInfo)? registerUserInfo,
    TResult? Function(UserInfo userInfo)? updateUserInfo,
  }) {
    return updateUserInfo?.call(userInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkUserInfo,
    TResult Function(UserInfo userInfo)? registerUserInfo,
    TResult Function(UserInfo userInfo)? updateUserInfo,
    required TResult orElse(),
  }) {
    if (updateUserInfo != null) {
      return updateUserInfo(userInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckUserInfo value) checkUserInfo,
    required TResult Function(_RegisterUserInfo value) registerUserInfo,
    required TResult Function(_UpdateUserInfo value) updateUserInfo,
  }) {
    return updateUserInfo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckUserInfo value)? checkUserInfo,
    TResult? Function(_RegisterUserInfo value)? registerUserInfo,
    TResult? Function(_UpdateUserInfo value)? updateUserInfo,
  }) {
    return updateUserInfo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckUserInfo value)? checkUserInfo,
    TResult Function(_RegisterUserInfo value)? registerUserInfo,
    TResult Function(_UpdateUserInfo value)? updateUserInfo,
    required TResult orElse(),
  }) {
    if (updateUserInfo != null) {
      return updateUserInfo(this);
    }
    return orElse();
  }
}

abstract class _UpdateUserInfo implements MainEvent {
  const factory _UpdateUserInfo(final UserInfo userInfo) = _$UpdateUserInfoImpl;

  UserInfo get userInfo;

  /// Create a copy of MainEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateUserInfoImplCopyWith<_$UpdateUserInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
