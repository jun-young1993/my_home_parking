// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notice_reply.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NoticeReply _$NoticeReplyFromJson(Map<String, dynamic> json) {
  return _NoticeReply.fromJson(json);
}

/// @nodoc
mixin _$NoticeReply {
  String get id => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get noticeId => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this NoticeReply to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NoticeReply
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NoticeReplyCopyWith<NoticeReply> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoticeReplyCopyWith<$Res> {
  factory $NoticeReplyCopyWith(
          NoticeReply value, $Res Function(NoticeReply) then) =
      _$NoticeReplyCopyWithImpl<$Res, NoticeReply>;
  @useResult
  $Res call(
      {String id,
      String content,
      String noticeId,
      String userName,
      DateTime createdAt});
}

/// @nodoc
class _$NoticeReplyCopyWithImpl<$Res, $Val extends NoticeReply>
    implements $NoticeReplyCopyWith<$Res> {
  _$NoticeReplyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NoticeReply
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? noticeId = null,
    Object? userName = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      noticeId: null == noticeId
          ? _value.noticeId
          : noticeId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NoticeReplyImplCopyWith<$Res>
    implements $NoticeReplyCopyWith<$Res> {
  factory _$$NoticeReplyImplCopyWith(
          _$NoticeReplyImpl value, $Res Function(_$NoticeReplyImpl) then) =
      __$$NoticeReplyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String content,
      String noticeId,
      String userName,
      DateTime createdAt});
}

/// @nodoc
class __$$NoticeReplyImplCopyWithImpl<$Res>
    extends _$NoticeReplyCopyWithImpl<$Res, _$NoticeReplyImpl>
    implements _$$NoticeReplyImplCopyWith<$Res> {
  __$$NoticeReplyImplCopyWithImpl(
      _$NoticeReplyImpl _value, $Res Function(_$NoticeReplyImpl) _then)
      : super(_value, _then);

  /// Create a copy of NoticeReply
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? noticeId = null,
    Object? userName = null,
    Object? createdAt = null,
  }) {
    return _then(_$NoticeReplyImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      noticeId: null == noticeId
          ? _value.noticeId
          : noticeId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NoticeReplyImpl extends _NoticeReply {
  const _$NoticeReplyImpl(
      {required this.id,
      required this.content,
      required this.noticeId,
      required this.userName,
      required this.createdAt})
      : super._();

  factory _$NoticeReplyImpl.fromJson(Map<String, dynamic> json) =>
      _$$NoticeReplyImplFromJson(json);

  @override
  final String id;
  @override
  final String content;
  @override
  final String noticeId;
  @override
  final String userName;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'NoticeReply(id: $id, content: $content, noticeId: $noticeId, userName: $userName, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoticeReplyImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.noticeId, noticeId) ||
                other.noticeId == noticeId) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, content, noticeId, userName, createdAt);

  /// Create a copy of NoticeReply
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NoticeReplyImplCopyWith<_$NoticeReplyImpl> get copyWith =>
      __$$NoticeReplyImplCopyWithImpl<_$NoticeReplyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NoticeReplyImplToJson(
      this,
    );
  }
}

abstract class _NoticeReply extends NoticeReply {
  const factory _NoticeReply(
      {required final String id,
      required final String content,
      required final String noticeId,
      required final String userName,
      required final DateTime createdAt}) = _$NoticeReplyImpl;
  const _NoticeReply._() : super._();

  factory _NoticeReply.fromJson(Map<String, dynamic> json) =
      _$NoticeReplyImpl.fromJson;

  @override
  String get id;
  @override
  String get content;
  @override
  String get noticeId;
  @override
  String get userName;
  @override
  DateTime get createdAt;

  /// Create a copy of NoticeReply
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NoticeReplyImplCopyWith<_$NoticeReplyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
