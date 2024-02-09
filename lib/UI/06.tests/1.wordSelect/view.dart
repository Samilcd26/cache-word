import 'package:cache_word/UI/06.tests/0.0.Public/appBar.dart';
import 'package:cache_word/UI/06.tests/1.wordSelect/view.model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WordSelect extends StatelessWidget with WordSelectMixin {
  WordSelect({super.key});

  @override
  Widget build(BuildContext context) {
    progressStatus.value = rootState.currentWorkshop!.cardList.length;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100.0), child: TestAppBar(title: 'Word Select', progressStatus: progressStatus)),
      body: CarouselSlider(
        options: CarouselOptions(
            enableInfiniteScroll: false,
            height: Get.height,
            viewportFraction: 1,
            padEnds: false,
            onPageChanged: (index, reason) {
              progressStatus.value = rootState.currentWorkshop!.cardList.length - index;
            }),
        items: rootState.currentWorkshop!.cardList.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: Get.width,
                margin: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
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
                child: Column(
                  children: [
                    Expanded(
                      flex: 9,
                      child: Column(
                        children: [
                          Expanded(
                              child: Row(
                            children: [
                              optionCard(),
                              optionCard(),
                            ],
                          )),
                          Expanded(
                              child: Row(
                            children: [
                              optionCard(),
                              optionCard(),
                            ],
                          )),
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: Container(
                            decoration: const BoxDecoration(border: Border(top: BorderSide(color: Colors.black12, width: 2))),
                            child: const Center(
                              child: Text("test"),
                            )))
                  ],
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }

  Expanded optionCard() => Expanded(
          child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
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
        child: const Center(child: Text("test")),
      ));
}
