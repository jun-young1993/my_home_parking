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
  String get region => throw _privateConstructorUsedError; // 지역 (예: "30")
  String get category => throw _privateConstructorUsedError; // 분류 (예: "조")
  String get number => throw _privateConstructorUsedError;

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
  $Res call({String region, String category, String number});
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
    Object? region = null,
    Object? category = null,
    Object? number = null,
  }) {
    return _then(_value.copyWith(
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
  $Res call({String region, String category, String number});
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
    Object? region = null,
    Object? category = null,
    Object? number = null,
  }) {
    return _then(_$CarNumberImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CarNumberImpl implements _CarNumber {
  const _$CarNumberImpl(
      {required this.region, required this.category, required this.number});

  factory _$CarNumberImpl.fromJson(Map<String, dynamic> json) =>
      _$$CarNumberImplFromJson(json);

  @override
  final String region;
// 지역 (예: "30")
  @override
  final String category;
// 분류 (예: "조")
  @override
  final String number;

  @override
  String toString() {
    return 'CarNumber(region: $region, category: $category, number: $number)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CarNumberImpl &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.number, number) || other.number == number));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, region, category, number);

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

abstract class _CarNumber implements CarNumber {
  const factory _CarNumber(
      {required final String region,
      required final String category,
      required final String number}) = _$CarNumberImpl;

  factory _CarNumber.fromJson(Map<String, dynamic> json) =
      _$CarNumberImpl.fromJson;

  @override
  String get region; // 지역 (예: "30")
  @override
  String get category; // 분류 (예: "조")
  @override
  String get number;

  /// Create a copy of CarNumber
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CarNumberImplCopyWith<_$CarNumberImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
