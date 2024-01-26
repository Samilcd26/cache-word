import 'package:cache_word/Business/0.0.State/main_controller.dart';
import 'package:cache_word/Business/Data/workshop_model.dart';
import 'package:cache_word/UI/01.home/sheet.dart';
import 'package:cache_word/UI/02.wordList/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin SheetMixin {
  final MainController rootState0 = Get.put(MainController());

  Future<void> showSheet(BuildContext context, WorkshopModel workshop) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return HomeSheet(workshop: workshop);
      },
    );
  }

  void renameWorkshopGroup(String id, String newTitle) {
    rootState0.addOrUpdateWorkshopData(id, newTitle, null);
  }

  void openWorkshop(WorkshopModel workshop) => Get.to(WordListPage(workshopModel: workshop));
  void deleteWorkshop(String id) => rootState0.deleteWorkshopData(id);
}
