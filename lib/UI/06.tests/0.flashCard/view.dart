import 'dart:math';

import 'package:cache_word/UI/06.tests/0.0.Public/appBar.dart';
import 'package:cache_word/UI/06.tests/0.flashCard/flipCard/view.dart';
import 'package:cache_word/UI/06.tests/0.flashCard/view.model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlashCard extends StatelessWidget with FlashCardMixin {
  FlashCard({super.key});

  @override
  Widget build(BuildContext context) {
    progressStatus.value = rootState.currentWorkshop!.cardList.length;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: TestAppBar(
            title: 'Flash Card',
            progressStatus: progressStatus,
            timeNotifier: timeNotifier,
          )),
      body: Center(
        child: CarouselSlider(
          options: CarouselOptions(
              enableInfiniteScroll: false,
              height: 400.0,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                progressStatus.value = rootState.currentWorkshop!.cardList.length - index;
              }),
          items: rootState.currentWorkshop!.cardList.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: Get.width - 20,
                  child: FlipCard(backText: i.backSide, frontText: i.frontSide),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
