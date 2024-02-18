import 'package:cache_word/Business/0.0.State/main_controller.dart';
import 'package:cache_word/Business/Data/workshop_model.dart';
import 'package:cache_word/UI/01.public/create_or_update_dialog.dart';
import 'package:cache_word/UI/01.public/toastify.dart';
import 'package:cache_word/UI/01.public/yes_no_popup.dart';
import 'package:cache_word/UI/04.wordList/view.dart';
import 'package:cache_word/UI/05.selectTest/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin HomePageBottomSheetMixin<T extends StatelessWidget> {
  final MainController rootState = Get.put(MainController());

  void renameWorkshopGroup(BuildContext context, WorkshopModel workshopModel) {
    CreateOrUpdateDialog.show(context, true).then((value) => rootState.renameWorkshop(value, workshopModel));
    Get.back();
  }

  void deleteWorkshop(BuildContext context, String id) => SimpleYesNoDialog.show(context).then((value) {
        if (value) {
          Get.back();
          rootState.deleteWorkshopData(id);
        }
      });
}
