import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';

class TestAppBar extends StatelessWidget {
  TestAppBar({super.key, required this.title, required this.progressStatus, required this.timeNotifier});
  String title;

  ValueNotifier<int> progressStatus;

  late final length;

  ValueNotifier<int> timeNotifier;

  // Timer'ı başlatmak için kullanılan metot

  @override
  Widget build(BuildContext context) {
    length = progressStatus.value;

    return AppBar(
      centerTitle: true,
      title: Text(title),
      actions: [
        //? Progress indicator
        ValueListenableBuilder(
          valueListenable: progressStatus,
          builder: (BuildContext context, dynamic value, Widget? child) {
            return CircularPercentIndicator(
                radius: Get.width / 20,
                lineWidth: 5.0,
                percent: 1 - ((100 * progressStatus.value) / length) * 0.01,
                center:
                    //? Timer
                    ValueListenableBuilder(
                  valueListenable: timeNotifier,
                  builder: (BuildContext context, dynamic value, Widget? child) {
                    return Text("${timeNotifier.value}", style: TextStyle(color: Color(0xFF535355)));
                  },
                ),
                linearGradient: LinearGradient(
                    begin: Alignment.topRight, end: Alignment.bottomLeft, colors: <Color>[Color(0xFF1AB600), Color(0xFF6DD400)]),
                rotateLinearGradient: true,
                circularStrokeCap: CircularStrokeCap.round);
          },
        ),
        SizedBox(width: 10)
      ],
    );
  }
}
