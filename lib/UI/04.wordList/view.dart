import 'package:cache_word/Business/Data/workshop_model.dart';
import 'package:cache_word/UI/04.wordList/view.model.dart';
import 'package:flutter/material.dart';

class WordListPage extends StatelessWidget with WordListPageMixin {
  WordListPage({super.key, required this.workshopModel});
  WorkshopModel workshopModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => addNewCard(context),
      ),
      body: ListView.builder(
        itemCount: workshopModel.cardList.length,
        itemBuilder: (context, index) {
          return Container(
            child: Text(workshopModel.cardList[index].frontSide),
          );
        },
      ),
    );
  }
}
