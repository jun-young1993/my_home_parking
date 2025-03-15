// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'parking_location_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ParkingLocationResponse _$ParkingLocationResponseFromJson(
    Map<String, dynamic> json) {
  return _ParkingLocationResponse.fromJson(json);
}

/// @nodoc
mixin _$ParkingLocationResponse {
  String get id => throw _privateConstructorUsedError;
  String get zoneCode => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;
  CarNumber? get carNumber => throw _privateConstructorUsedError;

  /// Serializes this ParkingLocationResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ParkingLocationResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ParkingLocationResponseCopyWith<ParkingLocationResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParkingLocationResponseCopyWith<$Res> {
  factory $ParkingLocationResponseCopyWith(ParkingLocationResponse value,
          $Res Function(ParkingLocationResponse) then) =
      _$ParkingLocationResponseCopyWithImpl<$Res, ParkingLocationResponse>;
  @useResult
  $Res call(
      {String id,
      String zoneCode,
      String type,
      String? description,
      String createdAt,
      String updatedAt,
      CarNumber? carNumber});

  $CarNumberCopyWith<$Res>? get carNumber;
}

/// @nodoc
class _$ParkingLocationResponseCopyWithImpl<$Res,
        $Val extends ParkingLocationResponse>
    implements $ParkingLocationResponseCopyWith<$Res> {
  _$ParkingLocationResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ParkingLocationResponse
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
    Object? carNumber = freezed,
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
      carNumber: freezed == carNumber
          ? _value.carNumber
          : carNumber // ignore: cast_nullable_to_non_nullable
              as CarNumber?,
    ) as $Val);
  }

  /// Create a copy of ParkingLocationResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CarNumberCopyWith<$Res>? get carNumber {
    if (_value.carNumber == null) {
      return null;
    }

    return $CarNumberCopyWith<$Res>(_value.carNumber!, (value) {
      return _then(_value.copyWith(carNumber: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ParkingLocationResponseImplCopyWith<$Res>
    implements $ParkingLocationResponseCopyWith<$Res> {
  factory _$$ParkingLocationResponseImplCopyWith(
          _$ParkingLocationResponseImpl value,
          $Res Function(_$ParkingLocationResponseImpl) then) =
      __$$ParkingLocationResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String zoneCode,
      String type,
      String? description,
      String createdAt,
      String updatedAt,
      CarNumber? carNumber});

  @override
  $CarNumberCopyWith<$Res>? get carNumber;
}

/// @nodoc
class __$$ParkingLocationResponseImplCopyWithImpl<$Res>
    extends _$ParkingLocationResponseCopyWithImpl<$Res,
        _$ParkingLocationResponseImpl>
    implements _$$ParkingLocationResponseImplCopyWith<$Res> {
  __$$ParkingLocationResponseImplCopyWithImpl(
      _$ParkingLocationResponseImpl _value,
      $Res Function(_$ParkingLocationResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ParkingLocationResponse
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
    Object? carNumber = freezed,
  }) {
    return _then(_$ParkingLocationResponseImpl(
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
      carNumber: freezed == carNumber
          ? _value.carNumber
          : carNumber // ignore: cast_nullable_to_non_nullable
              as CarNumber?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ParkingLocationResponseImpl implements _ParkingLocationResponse {
  const _$ParkingLocationResponseImpl(
      {required this.id,
      required this.zoneCode,
      required this.type,
      this.description,
      required this.createdAt,
      required this.updatedAt,
      this.carNumber});

  factory _$ParkingLocationResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ParkingLocationResponseImplFromJson(json);

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
  @override
  final CarNumber? carNumber;

  @override
  String toString() {
    return 'ParkingLocationResponse(id: $id, zoneCode: $zoneCode, type: $type, description: $description, createdAt: $createdAt, updatedAt: $updatedAt, carNumber: $carNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParkingLocationResponseImpl &&
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
            (identical(other.carNumber, carNumber) ||
                other.carNumber == carNumber));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, zoneCode, type, description,
      createdAt, updatedAt, carNumber);

  /// Create a copy of ParkingLocationResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ParkingLocationResponseImplCopyWith<_$ParkingLocationResponseImpl>
      get copyWith => __$$ParkingLocationResponseImplCopyWithImpl<
          _$ParkingLocationResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ParkingLocationResponseImplToJson(
      this,
    );
  }
}

abstract class _ParkingLocationResponse implements ParkingLocationResponse {
  const factory _ParkingLocationResponse(
      {required final String id,
      required final String zoneCode,
      required final String type,
      final String? description,
      required final String createdAt,
      required final String updatedAt,
      final CarNumber? carNumber}) = _$ParkingLocationResponseImpl;

  factory _ParkingLocationResponse.fromJson(Map<String, dynamic> json) =
      _$ParkingLocationResponseImpl.fromJson;

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
  CarNumber? get carNumber;

  /// Create a copy of ParkingLocationResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ParkingLocationResponseImplCopyWith<_$ParkingLocationResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
