// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'car_number.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CarNumber _$CarNumberFromJson(Map<String, dynamic> json) {
  return _CarNumber.fromJson(json);
}

/// @nodoc
mixin _$CarNumber {
  String? get id => throw _privateConstructorUsedError;
  String get region => throw _privateConstructorUsedError; // 지역 (예: "30")
  String get category => throw _privateConstructorUsedError; // 분류 (예: "조")
  String get number => throw _privateConstructorUsedError; // 번호 (예: "7833")
  bool get isParked => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  String get fcmToken => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  DateTime? get expectedTime => throw _privateConstructorUsedError; // null도 허용
  bool get allowFcmNotification => throw _privateConstructorUsedError;

  /// Serializes this CarNumber to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CarNumber
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CarNumberCopyWith<CarNumber> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarNumberCopyWith<$Res> {
  factory $CarNumberCopyWith(CarNumber value, $Res Function(CarNumber) then) =
      _$CarNumberCopyWithImpl<$Res, CarNumber>;
  @useResult
  $Res call(
      {String? id,
      String region,
      String category,
      String number,
      bool isParked,
      String? message,
      String fcmToken,
      DateTime? updatedAt,
      DateTime? expectedTime,
      bool allowFcmNotification});
}

/// @nodoc
class _$CarNumberCopyWithImpl<$Res, $Val extends CarNumber>
    implements $CarNumberCopyWith<$Res> {
  _$CarNumberCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CarNumber
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? region = null,
    Object? category = null,
    Object? number = null,
    Object? isParked = null,
    Object? message = freezed,
    Object? fcmToken = null,
    Object? updatedAt = freezed,
    Object? expectedTime = freezed,
    Object? allowFcmNotification = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      region: null == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      isParked: null == isParked
          ? _value.isParked
          : isParked // ignore: cast_nullable_to_non_nullable
              as bool,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      fcmToken: null == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expectedTime: freezed == expectedTime
          ? _value.expectedTime
          : expectedTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      allowFcmNotification: null == allowFcmNotification
          ? _value.allowFcmNotification
          : allowFcmNotification // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CarNumberImplCopyWith<$Res>
    implements $CarNumberCopyWith<$Res> {
  factory _$$CarNumberImplCopyWith(
          _$CarNumberImpl value, $Res Function(_$CarNumberImpl) then) =
      __$$CarNumberImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String region,
      String category,
      String number,
      bool isParked,
      String? message,
      String fcmToken,
      DateTime? updatedAt,
      DateTime? expectedTime,
      bool allowFcmNotification});
}

/// @nodoc
class __$$CarNumberImplCopyWithImpl<$Res>
    extends _$CarNumberCopyWithImpl<$Res, _$CarNumberImpl>
    implements _$$CarNumberImplCopyWith<$Res> {
  __$$CarNumberImplCopyWithImpl(
      _$CarNumberImpl _value, $Res Function(_$CarNumberImpl) _then)
      : super(_value, _then);

  /// Create a copy of CarNumber
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? region = null,
    Object? category = null,
    Object? number = null,
    Object? isParked = null,
    Object? message = freezed,
    Object? fcmToken = null,
    Object? updatedAt = freezed,
    Object? expectedTime = freezed,
    Object? allowFcmNotification = null,
  }) {
    return _then(_$CarNumberImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      region: null == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      isParked: null == isParked
          ? _value.isParked
          : isParked // ignore: cast_nullable_to_non_nullable
              as bool,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      fcmToken: null == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expectedTime: freezed == expectedTime
          ? _value.expectedTime
          : expectedTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      allowFcmNotification: null == allowFcmNotification
          ? _value.allowFcmNotification
          : allowFcmNotification // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CarNumberImpl extends _CarNumber {
  const _$CarNumberImpl(
      {this.id,
      required this.region,
      required this.category,
      required this.number,
      this.isParked = true,
      this.message,
      required this.fcmToken,
      required this.updatedAt,
      this.expectedTime = null,
      this.allowFcmNotification = true})
      : super._();

  factory _$CarNumberImpl.fromJson(Map<String, dynamic> json) =>
      _$$CarNumberImplFromJson(json);

  @override
  final String? id;
  @override
  final String region;
// 지역 (예: "30")
  @override
  final String category;
// 분류 (예: "조")
  @override
  final String number;
// 번호 (예: "7833")
  @override
  @JsonKey()
  final bool isParked;
  @override
  final String? message;
  @override
  final String fcmToken;
  @override
  final DateTime? updatedAt;
  @override
  @JsonKey()
  final DateTime? expectedTime;
// null도 허용
  @override
  @JsonKey()
  final bool allowFcmNotification;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CarNumberImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.isParked, isParked) ||
                other.isParked == isParked) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.fcmToken, fcmToken) ||
                other.fcmToken == fcmToken) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.expectedTime, expectedTime) ||
                other.expectedTime == expectedTime) &&
            (identical(other.allowFcmNotification, allowFcmNotification) ||
                other.allowFcmNotification == allowFcmNotification));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      region,
      category,
      number,
      isParked,
      message,
      fcmToken,
      updatedAt,
      expectedTime,
      allowFcmNotification);

  /// Create a copy of CarNumber
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CarNumberImplCopyWith<_$CarNumberImpl> get copyWith =>
      __$$CarNumberImplCopyWithImpl<_$CarNumberImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CarNumberImplToJson(
      this,
    );
  }
}

abstract class _CarNumber extends CarNumber {
  const factory _CarNumber(
      {final String? id,
      required final String region,
      required final String category,
      required final String number,
      final bool isParked,
      final String? message,
      required final String fcmToken,
      required final DateTime? updatedAt,
      final DateTime? expectedTime,
      final bool allowFcmNotification}) = _$CarNumberImpl;
  const _CarNumber._() : super._();

  factory _CarNumber.fromJson(Map<String, dynamic> json) =
      _$CarNumberImpl.fromJson;

  @override
  String? get id;
  @override
  String get region; // 지역 (예: "30")
  @override
  String get category; // 분류 (예: "조")
  @override
  String get number; // 번호 (예: "7833")
  @override
  bool get isParked;
  @override
  String? get message;
  @override
  String get fcmToken;
  @override
  DateTime? get updatedAt;
  @override
  DateTime? get expectedTime; // null도 허용
  @override
  bool get allowFcmNotification;

  /// Create a copy of CarNumber
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CarNumberImplCopyWith<_$CarNumberImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
