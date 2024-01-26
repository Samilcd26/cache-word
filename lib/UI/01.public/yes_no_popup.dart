import 'package:flutter/material.dart';

class SimpleYesNoDialog extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onResult;

  const SimpleYesNoDialog({super.key, required this.title, required this.content, required this.onResult});

  static Future<bool> show(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleYesNoDialog(
          title: 'Soru',
          content: 'Bu bir evet-hayır sorusudur. Devam etmek istiyor musunuz?',
          onResult: () {},
        );
      },
    ).then((value) {
      return value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            // Kullanıcı "Evet" dediğinde true değerini döndürür.
            onResult();
            Navigator.of(context).pop(true);
          },
          child: Text('Evet'),
        ),
        TextButton(
          onPressed: () {
            // Kullanıcı "Hayır" dediğinde false değerini döndürür.
            onResult();
            Navigator.of(context).pop(false);
          },
          child: Text('Hayır'),
        ),
      ],
    );
  }
}
