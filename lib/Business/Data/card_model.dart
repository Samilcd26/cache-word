import 'package:cache_word/Business/01.Repository/Core/hive_mixin.dart';
import 'package:cache_word/Business/Data/00.HiveTypes.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/adapters.dart';

part 'card_model.freezed.dart';
part 'card_model.g.dart';

@unfreezed
abstract class CardModel extends HiveObject with HiveModelMixin, _$CardModel {
  CardModel._();

  @override
  String get key => id.toString();

  @HiveType(typeId: HiveTypes.cardModel)
  factory CardModel({
    @HiveField(0) required String id,
    @HiveField(1) required String frontSide,
    @HiveField(2) required String backSide,
    @Default(false) @HiveField(3) bool isOpen,
  }) = _CardModel;

  factory CardModel.fromJson(Map<String, Object?> json) => _$CardModelFromJson(json);
}
