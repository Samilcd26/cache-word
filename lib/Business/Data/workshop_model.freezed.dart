// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workshop_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WorkshopModel _$WorkshopModelFromJson(Map<String, dynamic> json) {
  return _WorkshopModel.fromJson(json);
}

/// @nodoc
mixin _$WorkshopModel {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(0)
  set id(String value) => throw _privateConstructorUsedError;
  @HiveField(1)
  String get title => throw _privateConstructorUsedError;
  @HiveField(1)
  set title(String value) => throw _privateConstructorUsedError;
  @HiveField(2)
  List<CardModel> get cardList => throw _privateConstructorUsedError;
  @HiveField(2)
  set cardList(List<CardModel> value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkshopModelCopyWith<WorkshopModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkshopModelCopyWith<$Res> {
  factory $WorkshopModelCopyWith(
          WorkshopModel value, $Res Function(WorkshopModel) then) =
      _$WorkshopModelCopyWithImpl<$Res, WorkshopModel>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String title,
      @HiveField(2) List<CardModel> cardList});
}

/// @nodoc
class _$WorkshopModelCopyWithImpl<$Res, $Val extends WorkshopModel>
    implements $WorkshopModelCopyWith<$Res> {
  _$WorkshopModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? cardList = null,
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
      cardList: null == cardList
          ? _value.cardList
          : cardList // ignore: cast_nullable_to_non_nullable
              as List<CardModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkshopModelImplCopyWith<$Res>
    implements $WorkshopModelCopyWith<$Res> {
  factory _$$WorkshopModelImplCopyWith(
          _$WorkshopModelImpl value, $Res Function(_$WorkshopModelImpl) then) =
      __$$WorkshopModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String title,
      @HiveField(2) List<CardModel> cardList});
}

/// @nodoc
class __$$WorkshopModelImplCopyWithImpl<$Res>
    extends _$WorkshopModelCopyWithImpl<$Res, _$WorkshopModelImpl>
    implements _$$WorkshopModelImplCopyWith<$Res> {
  __$$WorkshopModelImplCopyWithImpl(
      _$WorkshopModelImpl _value, $Res Function(_$WorkshopModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? cardList = null,
  }) {
    return _then(_$WorkshopModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      cardList: null == cardList
          ? _value.cardList
          : cardList // ignore: cast_nullable_to_non_nullable
              as List<CardModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: HiveTypes.workshopModel)
class _$WorkshopModelImpl extends _WorkshopModel {
  _$WorkshopModelImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.title,
      @HiveField(2) required this.cardList})
      : super._();

  factory _$WorkshopModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkshopModelImplFromJson(json);

  @override
  @HiveField(0)
  String id;
  @override
  @HiveField(1)
  String title;
  @override
  @HiveField(2)
  List<CardModel> cardList;

  @override
  String toString() {
    return 'WorkshopModel(id: $id, title: $title, cardList: $cardList)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkshopModelImplCopyWith<_$WorkshopModelImpl> get copyWith =>
      __$$WorkshopModelImplCopyWithImpl<_$WorkshopModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkshopModelImplToJson(
      this,
    );
  }
}

abstract class _WorkshopModel extends WorkshopModel {
  factory _WorkshopModel(
      {@HiveField(0) required String id,
      @HiveField(1) required String title,
      @HiveField(2) required List<CardModel> cardList}) = _$WorkshopModelImpl;
  _WorkshopModel._() : super._();

  factory _WorkshopModel.fromJson(Map<String, dynamic> json) =
      _$WorkshopModelImpl.fromJson;

  @override
  @HiveField(0)
  String get id;
  @HiveField(0)
  set id(String value);
  @override
  @HiveField(1)
  String get title;
  @HiveField(1)
  set title(String value);
  @override
  @HiveField(2)
  List<CardModel> get cardList;
  @HiveField(2)
  set cardList(List<CardModel> value);
  @override
  @JsonKey(ignore: true)
  _$$WorkshopModelImplCopyWith<_$WorkshopModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
