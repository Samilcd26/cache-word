import 'package:flutter/material.dart';

class TestAppBar extends StatelessWidget {
  TestAppBar({super.key, required this.title, required this.progressStatus});
  String title;
  ValueNotifier<int> progressStatus;
  late final lenght;
  @override
  Widget build(BuildContext context) {
    lenght = progressStatus.value;
    return AppBar(
      centerTitle: true,
      title: Text(title),
      actions: [
        ValueListenableBuilder(
          valueListenable: progressStatus,
          builder: (BuildContext context, dynamic value, Widget? child) {
            return CircularProgressIndicator(
              value: 1 - ((100 * progressStatus.value) / lenght) * 0.01,
            );
          },
        ),
        SizedBox(width: 10)
      ],
    );
  }
}
