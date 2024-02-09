import 'package:cache_word/Business/0.0.State/main_controller.dart';
import 'package:cache_word/Business/Data/card_model.dart';
import 'package:cache_word/UI/00.Theme/TextFieldStyle.dart';
import 'package:cache_word/UI/04.wordList/dropmenu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddWordCardBottomDialog extends StatelessWidget {
  AddWordCardBottomDialog({super.key});
  final MainController rootState = Get.put(MainController());
  final TextEditingController frontSide = TextEditingController();
  final TextEditingController backSide = TextEditingController();

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
            controller: frontSide,
            decoration: TextFieldStyle.myInputDecoration(null, "Front"),
            maxLines: 3,
          ),
          const SizedBox(height: 10),
          TextField(
            controller: backSide,
            decoration: TextFieldStyle.myInputDecoration(AddImageOrVoiceDropMenu(), "Back"),
            maxLines: 3,
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => frontSide.text.isNotEmpty && backSide.text.isNotEmpty
              ? rootState.addNewCard(CardModel(id: '', frontSide: frontSide.text, backSide: backSide.text))
              : "",
          child: Text('Add'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Cancel'),
        ),
      ],
    );
  }
}
