import 'package:cache_word/Business/0.0.State/main_controller.dart';
import 'package:cache_word/Business/Data/card_model.dart';
import 'package:cache_word/Business/Data/workshop_model.dart';
import 'package:cache_word/UI/04.wordList/sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin WordListPageMixin {
  final MainController rootState = Get.put(MainController());
  void addNewCard(BuildContext context) {
    AddWordCardBottomDialog.show(context);
    //rootState.addNewCard(workshopModel, cardModel);
  }
}
