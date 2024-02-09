// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CardModel _$CardModelFromJson(Map<String, dynamic> json) {
  return _CardModel.fromJson(json);
}

/// @nodoc
mixin _$CardModel {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(0)
  set id(String value) => throw _privateConstructorUsedError;
  @HiveField(1)
  String get frontSide => throw _privateConstructorUsedError;
  @HiveField(1)
  set frontSide(String value) => throw _privateConstructorUsedError;
  @HiveField(2)
  String get backSide => throw _privateConstructorUsedError;
  @HiveField(2)
  set backSide(String value) => throw _privateConstructorUsedError;
  @HiveField(3)
  bool get isOpen => throw _privateConstructorUsedError;
  @HiveField(3)
  set isOpen(bool value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CardModelCopyWith<CardModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardModelCopyWith<$Res> {
  factory $CardModelCopyWith(CardModel value, $Res Function(CardModel) then) =
      _$CardModelCopyWithImpl<$Res, CardModel>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String frontSide,
      @HiveField(2) String backSide,
      @HiveField(3) bool isOpen});
}

/// @nodoc
class _$CardModelCopyWithImpl<$Res, $Val extends CardModel>
    implements $CardModelCopyWith<$Res> {
  _$CardModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? frontSide = null,
    Object? backSide = null,
    Object? isOpen = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      frontSide: null == frontSide
          ? _value.frontSide
          : frontSide // ignore: cast_nullable_to_non_nullable
              as String,
      backSide: null == backSide
          ? _value.backSide
          : backSide // ignore: cast_nullable_to_non_nullable
              as String,
      isOpen: null == isOpen
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CardModelImplCopyWith<$Res>
    implements $CardModelCopyWith<$Res> {
  factory _$$CardModelImplCopyWith(
          _$CardModelImpl value, $Res Function(_$CardModelImpl) then) =
      __$$CardModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String frontSide,
      @HiveField(2) String backSide,
      @HiveField(3) bool isOpen});
}

/// @nodoc
class __$$CardModelImplCopyWithImpl<$Res>
    extends _$CardModelCopyWithImpl<$Res, _$CardModelImpl>
    implements _$$CardModelImplCopyWith<$Res> {
  __$$CardModelImplCopyWithImpl(
      _$CardModelImpl _value, $Res Function(_$CardModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? frontSide = null,
    Object? backSide = null,
    Object? isOpen = null,
  }) {
    return _then(_$CardModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      frontSide: null == frontSide
          ? _value.frontSide
          : frontSide // ignore: cast_nullable_to_non_nullable
              as String,
      backSide: null == backSide
          ? _value.backSide
          : backSide // ignore: cast_nullable_to_non_nullable
              as String,
      isOpen: null == isOpen
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: HiveTypes.cardModel)
class _$CardModelImpl extends _CardModel {
  _$CardModelImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.frontSide,
      @HiveField(2) required this.backSide,
      @HiveField(3) this.isOpen = false})
      : super._();

  factory _$CardModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CardModelImplFromJson(json);

  @override
  @HiveField(0)
  String id;
  @override
  @HiveField(1)
  String frontSide;
  @override
  @HiveField(2)
  String backSide;
  @override
  @JsonKey()
  @HiveField(3)
  bool isOpen;

  @override
  String toString() {
    return 'CardModel(id: $id, frontSide: $frontSide, backSide: $backSide, isOpen: $isOpen)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CardModelImplCopyWith<_$CardModelImpl> get copyWith =>
      __$$CardModelImplCopyWithImpl<_$CardModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CardModelImplToJson(
      this,
    );
  }
}

abstract class _CardModel extends CardModel {
  factory _CardModel(
      {@HiveField(0) required String id,
      @HiveField(1) required String frontSide,
      @HiveField(2) required String backSide,
      @HiveField(3) bool isOpen}) = _$CardModelImpl;
  _CardModel._() : super._();

  factory _CardModel.fromJson(Map<String, dynamic> json) =
      _$CardModelImpl.fromJson;

  @override
  @HiveField(0)
  String get id;
  @HiveField(0)
  set id(String value);
  @override
  @HiveField(1)
  String get frontSide;
  @HiveField(1)
  set frontSide(String value);
  @override
  @HiveField(2)
  String get backSide;
  @HiveField(2)
  set backSide(String value);
  @override
  @HiveField(3)
  bool get isOpen;
  @HiveField(3)
  set isOpen(bool value);
  @override
  @JsonKey(ignore: true)
  _$$CardModelImplCopyWith<_$CardModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
