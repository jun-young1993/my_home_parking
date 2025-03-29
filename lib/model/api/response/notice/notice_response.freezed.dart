// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notice_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NoticeResponse _$NoticeResponseFromJson(Map<String, dynamic> json) {
  return _NoticeResponse.fromJson(json);
}

/// @nodoc
mixin _$NoticeResponse {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;

  /// Serializes this NoticeResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NoticeResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NoticeResponseCopyWith<NoticeResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoticeResponseCopyWith<$Res> {
  factory $NoticeResponseCopyWith(
          NoticeResponse value, $Res Function(NoticeResponse) then) =
      _$NoticeResponseCopyWithImpl<$Res, NoticeResponse>;
  @useResult
  $Res call({String id, String title, String content, String createdAt});
}

/// @nodoc
class _$NoticeResponseCopyWithImpl<$Res, $Val extends NoticeResponse>
    implements $NoticeResponseCopyWith<$Res> {
  _$NoticeResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NoticeResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NoticeResponseImplCopyWith<$Res>
    implements $NoticeResponseCopyWith<$Res> {
  factory _$$NoticeResponseImplCopyWith(_$NoticeResponseImpl value,
          $Res Function(_$NoticeResponseImpl) then) =
      __$$NoticeResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String title, String content, String createdAt});
}

/// @nodoc
class __$$NoticeResponseImplCopyWithImpl<$Res>
    extends _$NoticeResponseCopyWithImpl<$Res, _$NoticeResponseImpl>
    implements _$$NoticeResponseImplCopyWith<$Res> {
  __$$NoticeResponseImplCopyWithImpl(
      _$NoticeResponseImpl _value, $Res Function(_$NoticeResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of NoticeResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? createdAt = null,
  }) {
    return _then(_$NoticeResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NoticeResponseImpl implements _NoticeResponse {
  const _$NoticeResponseImpl(
      {required this.id,
      required this.title,
      required this.content,
      required this.createdAt});

  factory _$NoticeResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$NoticeResponseImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String content;
  @override
  final String createdAt;

  @override
  String toString() {
    return 'NoticeResponse(id: $id, title: $title, content: $content, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoticeResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, content, createdAt);

  /// Create a copy of NoticeResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NoticeResponseImplCopyWith<_$NoticeResponseImpl> get copyWith =>
      __$$NoticeResponseImplCopyWithImpl<_$NoticeResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NoticeResponseImplToJson(
      this,
    );
  }
}

abstract class _NoticeResponse implements NoticeResponse {
  const factory _NoticeResponse(
      {required final String id,
      required final String title,
      required final String content,
      required final String createdAt}) = _$NoticeResponseImpl;

  factory _NoticeResponse.fromJson(Map<String, dynamic> json) =
      _$NoticeResponseImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get content;
  @override
  String get createdAt;

  /// Create a copy of NoticeResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NoticeResponseImplCopyWith<_$NoticeResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
