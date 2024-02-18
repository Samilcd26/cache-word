import 'package:cache_word/UI/06.tests/0.0.Public/appBar.dart';
import 'package:cache_word/UI/06.tests/1.wordSelect/Options/view.dart';
import 'package:cache_word/UI/06.tests/1.wordSelect/moder.dart';
import 'package:cache_word/UI/06.tests/1.wordSelect/view.model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WordSelect extends StatelessWidget with WordSelectMixin {
  WordSelect({super.key});

  @override
  Widget build(BuildContext context) {
    //* ----------------------------------------------------------------------
    progressStatus.value = rootState.currentWorkshop!.cardList.length;
    CarouselController carouselController = CarouselController();
    //* ----------------------------------------------------------------------

    return FutureBuilder(
        future: initialize(carouselController),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Hata: ${snapshot.error}');
          } else {
            return Scaffold(
              appBar: PreferredSize(
                  preferredSize: const Size.fromHeight(100.0),
                  child: TestAppBar(
                    title: 'Word Select',
                    progressStatus: progressStatus,
                    timeNotifier: timeNotifier,
                  )),
              body: Center(
                child: CarouselSlider.builder(
                  carouselController: carouselController,
                  options: CarouselOptions(
                    scrollPhysics: const NeverScrollableScrollPhysics(),
                    enableInfiniteScroll: false,
                    height: Get.height,
                    viewportFraction: 1,
                    padEnds: false,
                    onPageChanged: (index, reason) {
                      currentIndex.value = index;
                      progressStatus.value = rootState.currentWorkshop!.cardList.length - index;
                    },
                  ),
                  itemCount: rootState.currentWorkshop!.cardList.length,
                  itemBuilder: (context, index, realIndex) {
                    return QuestionWidget(questions[index], currentIndex.value == index, carouselController);
                  },
                ),
              ),
            );
          }
        });
  }
}

class QuestionWidget extends StatelessWidget {
  final Question question;
  final bool isActive;
  final CarouselController carouselController;
  QuestionWidget(this.question, this.isActive, this.carouselController);

  int? _selectedOptionIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            flex: 9,
            child: Column(
              children: [
                Expanded(
                    child: Row(
                  children: [
                    //! Be better
                    OptionWidget(
                      isTrue: 0 == question.correctAnswerIndex,
                      title: question.options[0],
                      carouselController: carouselController,
                    ),
                    OptionWidget(
                      isTrue: 1 == question.correctAnswerIndex,
                      title: question.options[1],
                      carouselController: carouselController,
                    ),
                  ],
                )),
                Expanded(
                    child: Row(
                  children: [
                    OptionWidget(
                      isTrue: 2 == question.correctAnswerIndex,
                      title: question.options[2],
                      carouselController: carouselController,
                    ),
                    OptionWidget(
                      isTrue: 3 == question.correctAnswerIndex,
                      title: question.options[3],
                      carouselController: carouselController,
                    ),
                  ],
                )),
              ],
            ),
          ),
          Expanded(
              flex: 2,
              child: Container(
                  decoration: const BoxDecoration(border: Border(top: BorderSide(color: Colors.black12, width: 2))),
                  child: Center(
                    child: Text(question.question),
                  )))
        ],
      ),
    );
  }
}
