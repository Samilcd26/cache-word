import 'package:cache_word/Business/0.0.State/main_controller.dart';
import 'package:cache_word/Business/Data/workshop_model.dart';
import 'package:cache_word/UI/00.Theme/TextFieldStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateOrUpdateDialog extends StatelessWidget {
  CreateOrUpdateDialog({super.key, required this.isUpdate});

  final bool isUpdate;
  final MainController rootState = Get.put(MainController());
  final TextEditingController titleTextController = TextEditingController();

  static Future<String> show(BuildContext context, bool isUpdate) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return CreateOrUpdateDialog(isUpdate: isUpdate);
      },
    ).then((value) {
      return value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Workshop Card Group'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: titleTextController,
            decoration: TextFieldStyle.myInputDecoration(const SizedBox(), "Title"),
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
            Navigator.of(context).pop(null);
          },
        ),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: Text(isUpdate ? 'Update' : 'Add'),
          onPressed: () {
            isUpdate
                ? ""
                : rootState.addNewWorkshopData(WorkshopModel(id: '', cardList: [], title: titleTextController.text, category: ""));
            Navigator.of(context).pop(titleTextController.text);
            //newTitle.text==''?Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
