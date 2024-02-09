import 'package:flutter/material.dart';

class Toasty extends StatelessWidget {
  const Toasty({super.key, required this.title, required this.content});

  final String title;
  final String content;

  static Future<void> showError(BuildContext context, String title, String content) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Toasty(title: title, content: content);
      },
    ).then((value) {
      return value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('ok'),
        ),
      ],
    );
  }
}
