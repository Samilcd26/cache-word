import 'package:cache_word/Business/0.0.State/main_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin FlashCardMixin<T extends StatefulWidget> {
  final MainController rootState = Get.put(MainController());
  ValueNotifier<int> progressStatus = ValueNotifier<int>(0);
}
