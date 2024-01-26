import 'package:cache_word/Business/0.0.State/main_controller.dart';

import 'package:cache_word/Business/Data/workshop_model.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin HomeMixin<T extends StatefulWidget> {
  final TextEditingController newTitle = TextEditingController();
  final MainController rootState = Get.put(MainController());
  List<WorkshopModel> allWorkshop = [];

  Future<void> showCustomDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Workshop Card Group'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: newTitle,
                decoration: InputDecoration(
                  labelText: "Title ...",
                  alignLabelWithHint: true,
                  border: myinputborder(),
                  enabledBorder: myinputborder(),
                  focusedBorder: myfocusborder(),
                ),
                keyboardType: TextInputType.multiline,
                maxLines: 3,
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Add'),
              onPressed: () {
                rootState.addOrUpdateWorkshopData('', newTitle.text, null);
                Navigator.of(context).pop();
                //newTitle.text==''?Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  OutlineInputBorder myinputborder() {
    //return type is OutlineInputBorder
    return OutlineInputBorder(
        //Outline border type for TextFeild
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color: Colors.redAccent,
          width: 3,
        ));
  }

  OutlineInputBorder myfocusborder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color: Colors.greenAccent,
          width: 3,
        ));
  }
}
