import 'package:cache_word/UI/00.Theme/TextFieldStyle.dart';
import 'package:cache_word/UI/04.wordList/sheet.mixin.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddWordCardBottomDialog extends StatelessWidget with AddWordCardBottomDialogMixin {
  AddWordCardBottomDialog({super.key});
  final TextEditingController cardFrond = TextEditingController();
  final TextEditingController cardBack = TextEditingController();
  static Future<void> show(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AddWordCardBottomDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("title"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: cardFrond,
            decoration: TextFieldStyle.myInputDecoration(null, "Front"),
            maxLines: 3,
          ),
          const SizedBox(height: 10),
          TextField(
            controller: cardBack,
            decoration: TextFieldStyle.myInputDecoration(AddImageOrVoiceDropMenu(), "Back"),
            maxLines: 3,
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            // Kullanıcı "Evet" dediğinde true değerini döndürür.

            Navigator.of(context).pop(true);
          },
          child: Text('Evet'),
        ),
        TextButton(
          onPressed: () {
            // Kullanıcı "Hayır" dediğinde false değerini döndürür.

            Navigator.of(context).pop(false);
          },
          child: Text('Hayır'),
        ),
      ],
    );
  }
}
