import 'package:cache_word/Business/0.0.State/main_controller.dart';

import 'package:cache_word/Business/Data/workshop_model.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin HomeMixin<T extends StatelessWidget> {
  final MainController rootState = Get.put(MainController());

  Future<void> deleteItem() async {}
}
