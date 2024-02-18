import 'package:cache_word/UI/06.tests/4.writeWord/shake.dart';
import 'package:cache_word/UI/06.tests/4.writeWord/view.model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WriteWord extends StatelessWidget with WriteWordMixin {
  WriteWord({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _textController = TextEditingController();
    final FocusNode _focusNode = FocusNode();

    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: initialize(0),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Hata: ${snapshot.error}');
          } else {
            return Center(
              child: CarouselSlider.builder(
                //carouselController: carouselController,
                options: CarouselOptions(
                  //scrollPhysics: const NeverScrollableScrollPhysics(),
                  enableInfiniteScroll: false,
                  height: Get.height,
                  viewportFraction: 1,
                  padEnds: false,
                  onPageChanged: (index, reason) {
                    initialize(index);
                  },
                ),
                itemCount: rootState.currentWorkshop!.cardList.length,
                itemBuilder: (context, index, realIndex) {
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
                          child: Align(alignment: Alignment.center, child: Text(wordCardNotifier.value.frontSide)),
                        ),
                        Expanded(
                            child: ValueListenableBuilder(
                          valueListenable: shakeKeyNotifier,
                          builder: (BuildContext context, dynamic value, Widget? child) {
                            return ShakeWidget(
                              key: Key(shakeKeyNotifier.value),
                              child: ValueListenableBuilder(
                                valueListenable: tempWordNotifier,
                                builder: (BuildContext context, dynamic value, Widget? child) {
                                  return TextField(
                                    showCursor: false,
                                    focusNode: _focusNode,
                                    onChanged: (String text) {
                                      _textController.text = "";
                                      checkLatter(text);
                                    },
                                    controller: _textController,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 30, letterSpacing: 10),
                                    decoration: InputDecoration(border: InputBorder.none, hintText: tempWordNotifier.value),
                                  );
                                },
                              ),
                            );
                          },
                        ))
                      ],
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
