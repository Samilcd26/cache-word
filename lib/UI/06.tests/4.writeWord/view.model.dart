import 'dart:math';

import 'package:cache_word/Business/0.0.State/main_controller.dart';
import 'package:cache_word/Business/Data/card_model.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

mixin WriteWordMixin {
  final MainController rootState = Get.put(MainController());
  ValueNotifier<CardModel> wordCardNotifier = ValueNotifier<CardModel>(CardModel(id: "1", frontSide: "frontSide", backSide: "backSide"));
  int count = 0;
  //!Chance key so shake
  ValueNotifier<String> shakeKeyNotifier = ValueNotifier("");
  List<String> tempWordList = [];
  ValueNotifier<String> tempWordNotifier = ValueNotifier("");

  Future<void> initialize(int cardIndex) async {
    wordCardNotifier.value = rootState.currentWorkshop!.cardList[cardIndex];
    tempWordList = List.filled(wordCardNotifier.value.backSide.length, '_');
    tempWordNotifier.value = listToWord(tempWordList);
  }

  List<String> wordToList(String word) => word.toLowerCase().split('').toSet().toList();

  String listToWord(List<String> list) => list.join();

  void checkLatter(String latter) {
    if (wordCardNotifier.value.backSide.toLowerCase()[count] == latter) {
      tempWordList[count] = wordCardNotifier.value.backSide[count];
      tempWordNotifier.value = listToWord(tempWordList);
      count++;
    } else {
      shakeKeyNotifier.value = Random().nextInt(9999).toString();
    }
  }

  String rndLatter() {
    String alphabet = 'abcdefghijklmnopqrstuvwxyz';
    int randomIndex = Random().nextInt(alphabet.length);
    return alphabet[randomIndex];
  }
}
