import 'dart:async';
import 'dart:math';

import 'package:cache_word/Business/0.0.State/main_controller.dart';
import 'package:cache_word/UI/06.tests/0.0.Public/functions.dart';
import 'package:cache_word/UI/06.tests/1.wordSelect/moder.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin WordSelectMixin {
  //* ----------------------------------------------------------------------
  final MainController rootState = Get.put(MainController());
  ValueNotifier<int> progressStatus = ValueNotifier<int>(0);
  ValueNotifier<int> currentIndex = ValueNotifier<int>(0);
  ValueNotifier<int> timeNotifier = ValueNotifier(10);

  int get randomId => 0 + Random().nextInt(rootState.currentWorkshop!.cardList.length - 0);

  List<Question> questions = [];
  //* ----------------------------------------------------------------------

  //* ----------------------------------------------------------------------
  //* Create Options
  Future<List<String>> createOption(String trueWord) async {
    List<String> optionList = [];

    optionList.add(trueWord);
    int i = 0;
    while (i < 3) {
      String newWord = rootState.currentWorkshop!.cardList[randomId].backSide;
      if (newWord != trueWord && !optionList.contains(newWord)) {
        optionList.add(newWord);
        i++;
      }
    }

    PublicFun.shuffleList(optionList);

    return optionList;
  }

  //* ----------------------------------------------------------------------
  //* initialize
  Future<void> initialize(CarouselController carouselController) async {
    for (var card in rootState.currentWorkshop!.cardList) {
      var options = await createOption(card.backSide);
      questions.add(Question(card.frontSide, options, options.indexOf(card.backSide)));
    }
    _startTimer(carouselController);
  }

  //* ----------------------------------------------------------------------
  //* Shuffle List
  Future<void> _startTimer(CarouselController carouselController) async {
    timeNotifier.value = 10;
    Timer.periodic(Duration(seconds: 1), (Timer timer) async {
      timeNotifier.value--;
      if (timeNotifier.value == 0) {
        timer.cancel();
        await showAnswer();
        carouselController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.linear);
      }
    });
  }

  //* ----------------------------------------------------------------------
  //* Shuffle List
  Future<void> showAnswer() async {
    await Future.delayed(Duration(seconds: 3), () => {});
  }
}
