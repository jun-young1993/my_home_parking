// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'parking_location_zone.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ParkingLocationZoneResponse _$ParkingLocationZoneResponseFromJson(
    Map<String, dynamic> json) {
  return _ParkingLocationZoneResponse.fromJson(json);
}

/// @nodoc
mixin _$ParkingLocationZoneResponse {
  String get id => throw _privateConstructorUsedError;
  String get zoneCode => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;
  List<CarNumber> get carNumbers => throw _privateConstructorUsedError;

  /// Serializes this ParkingLocationZoneResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ParkingLocationZoneResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ParkingLocationZoneResponseCopyWith<ParkingLocationZoneResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParkingLocationZoneResponseCopyWith<$Res> {
  factory $ParkingLocationZoneResponseCopyWith(
          ParkingLocationZoneResponse value,
          $Res Function(ParkingLocationZoneResponse) then) =
      _$ParkingLocationZoneResponseCopyWithImpl<$Res,
          ParkingLocationZoneResponse>;
  @useResult
  $Res call(
      {String id,
      String zoneCode,
      String type,
      String? description,
      String createdAt,
      String updatedAt,
      List<CarNumber> carNumbers});
}

/// @nodoc
class _$ParkingLocationZoneResponseCopyWithImpl<$Res,
        $Val extends ParkingLocationZoneResponse>
    implements $ParkingLocationZoneResponseCopyWith<$Res> {
  _$ParkingLocationZoneResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ParkingLocationZoneResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? zoneCode = null,
    Object? type = null,
    Object? description = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? carNumbers = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      zoneCode: null == zoneCode
          ? _value.zoneCode
          : zoneCode // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      carNumbers: null == carNumbers
          ? _value.carNumbers
          : carNumbers // ignore: cast_nullable_to_non_nullable
              as List<CarNumber>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ParkingLocationZoneResponseImplCopyWith<$Res>
    implements $ParkingLocationZoneResponseCopyWith<$Res> {
  factory _$$ParkingLocationZoneResponseImplCopyWith(
          _$ParkingLocationZoneResponseImpl value,
          $Res Function(_$ParkingLocationZoneResponseImpl) then) =
      __$$ParkingLocationZoneResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String zoneCode,
      String type,
      String? description,
      String createdAt,
      String updatedAt,
      List<CarNumber> carNumbers});
}

/// @nodoc
class __$$ParkingLocationZoneResponseImplCopyWithImpl<$Res>
    extends _$ParkingLocationZoneResponseCopyWithImpl<$Res,
        _$ParkingLocationZoneResponseImpl>
    implements _$$ParkingLocationZoneResponseImplCopyWith<$Res> {
  __$$ParkingLocationZoneResponseImplCopyWithImpl(
      _$ParkingLocationZoneResponseImpl _value,
      $Res Function(_$ParkingLocationZoneResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ParkingLocationZoneResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? zoneCode = null,
    Object? type = null,
    Object? description = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? carNumbers = null,
  }) {
    return _then(_$ParkingLocationZoneResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      zoneCode: null == zoneCode
          ? _value.zoneCode
          : zoneCode // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      carNumbers: null == carNumbers
          ? _value._carNumbers
          : carNumbers // ignore: cast_nullable_to_non_nullable
              as List<CarNumber>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ParkingLocationZoneResponseImpl
    implements _ParkingLocationZoneResponse {
  const _$ParkingLocationZoneResponseImpl(
      {required this.id,
      required this.zoneCode,
      required this.type,
      this.description,
      required this.createdAt,
      required this.updatedAt,
      final List<CarNumber> carNumbers = const []})
      : _carNumbers = carNumbers;

  factory _$ParkingLocationZoneResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ParkingLocationZoneResponseImplFromJson(json);

  @override
  final String id;
  @override
  final String zoneCode;
  @override
  final String type;
  @override
  final String? description;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  final List<CarNumber> _carNumbers;
  @override
  @JsonKey()
  List<CarNumber> get carNumbers {
    if (_carNumbers is EqualUnmodifiableListView) return _carNumbers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_carNumbers);
  }

  @override
  String toString() {
    return 'ParkingLocationZoneResponse(id: $id, zoneCode: $zoneCode, type: $type, description: $description, createdAt: $createdAt, updatedAt: $updatedAt, carNumbers: $carNumbers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParkingLocationZoneResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.zoneCode, zoneCode) ||
                other.zoneCode == zoneCode) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality()
                .equals(other._carNumbers, _carNumbers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, zoneCode, type, description,
      createdAt, updatedAt, const DeepCollectionEquality().hash(_carNumbers));

  /// Create a copy of ParkingLocationZoneResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ParkingLocationZoneResponseImplCopyWith<_$ParkingLocationZoneResponseImpl>
      get copyWith => __$$ParkingLocationZoneResponseImplCopyWithImpl<
          _$ParkingLocationZoneResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ParkingLocationZoneResponseImplToJson(
      this,
    );
  }
}

abstract class _ParkingLocationZoneResponse
    implements ParkingLocationZoneResponse {
  const factory _ParkingLocationZoneResponse(
      {required final String id,
      required final String zoneCode,
      required final String type,
      final String? description,
      required final String createdAt,
      required final String updatedAt,
      final List<CarNumber> carNumbers}) = _$ParkingLocationZoneResponseImpl;

  factory _ParkingLocationZoneResponse.fromJson(Map<String, dynamic> json) =
      _$ParkingLocationZoneResponseImpl.fromJson;

  @override
  String get id;
  @override
  String get zoneCode;
  @override
  String get type;
  @override
  String? get description;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  List<CarNumber> get carNumbers;

  /// Create a copy of ParkingLocationZoneResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ParkingLocationZoneResponseImplCopyWith<_$ParkingLocationZoneResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
