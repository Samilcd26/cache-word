import 'package:cache_word/Business/01.Repository/Core/hive_mixin.dart';
import 'package:cache_word/Business/Data/00.HiveTypes.dart';
import 'package:cache_word/Business/Data/card_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/adapters.dart';

part 'workshop_model.freezed.dart';
part 'workshop_model.g.dart';

@unfreezed
abstract class WorkshopModel extends HiveObject with HiveModelMixin, _$WorkshopModel {
  WorkshopModel._();

  @override
  String get key => id.toString();

  @HiveType(typeId: HiveTypes.workshopModel)
  factory WorkshopModel({
    @HiveField(0) required String id,
    @HiveField(1) required String title,
    @HiveField(2) required List<CardModel> cardList,
  }) = _WorkshopModel;

  factory WorkshopModel.fromJson(Map<String, Object?> json) => _$WorkshopModelFromJson(json);
}
