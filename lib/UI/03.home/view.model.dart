import 'package:cache_word/Business/0.0.State/main_controller.dart';

import 'package:cache_word/Business/Data/workshop_model.dart';
import 'package:cache_word/UI/01.public/toastify.dart';
import 'package:cache_word/UI/04.wordList/view.dart';
import 'package:cache_word/UI/05.selectTest/view.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin HomeMixin<T extends StatelessWidget> {
  final MainController rootState = Get.put(MainController());

  Future<void> deleteItem() async {}

  Future<void> openWorkshop(WorkshopModel workshop) async {
    rootState.currentWorkshop = workshop;
    Get.to(WordListPage());
  }

  void openTestWorkshop(BuildContext context, WorkshopModel workshop) {
    rootState.currentWorkshop = workshop;
    if (rootState.currentWorkshop!.cardList != null && rootState.currentWorkshop!.cardList.isNotEmpty) {
      Get.to(SelectTestScreen(workshopModel: workshop));
    } else {
      Toasty.showError(context, "Error", "Eğer Test etmek istiyorsanınz önce kelime eklemelisiniz");
    }
  }
}
