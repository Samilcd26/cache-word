import 'package:cache_word/Business/0.0.State/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin RootViewModel {
  ValueNotifier<int> tabIndex = ValueNotifier<int>(0);
  MainController rootState = Get.put(MainController());

  void initialize() {
    rootState.initialize();
  }
}
