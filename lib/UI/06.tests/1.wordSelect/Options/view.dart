import 'package:cache_word/UI/06.tests/1.wordSelect/view.model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class OptionWidget extends StatelessWidget with WordSelectMixin {
  OptionWidget({required this.isTrue, required this.title, required this.carouselController});
  final bool isTrue;
  ValueNotifier<Answer> isSelectNotifier = ValueNotifier<Answer>(Answer.NONE);
  CarouselController carouselController;
  String title;

  void _checkAnswer() {
    if (isTrue) {
      isSelectNotifier.value = Answer.TRUE;
      Future.delayed(Duration(seconds: 1), () {
        carouselController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.linear);
      });
    } else {
      isSelectNotifier.value = Answer.FALSE;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: InkWell(
      onTap: _checkAnswer,
      child: ValueListenableBuilder(
        valueListenable: isSelectNotifier,
        builder: (BuildContext context, dynamic value, Widget? child) {
          return Container(
            decoration: BoxDecoration(
              color: determineColor(),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            margin: const EdgeInsets.all(10.0),
            child: Center(child: Text(title)),
          );
        },
      ),
    ));
  }

  Color determineColor() {
    if (isSelectNotifier.value == Answer.NONE) {
      return Colors.white;
    } else if (isSelectNotifier.value == Answer.TRUE) {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }
}

enum Answer { TRUE, FALSE, NONE }
