import 'package:cache_word/Business/Data/card_model.dart';
import 'package:cache_word/UI/04.wordList/view.model.dart';
import 'package:flutter/material.dart';

class WordListPage extends StatelessWidget with WordListPageMixin {
  WordListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => addNewCard(context),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: StreamBuilder(
          stream: rootState.getCardData,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return ExpansionListExample(transactions: rootState.currentWorkshop!.cardList);
          },
        ),
      )),
    );
  }
}

class ExpansionListExample extends StatefulWidget {
  final List<CardModel> transactions;
  ExpansionListExample({
    Key? key,
    required this.transactions,
  }) : super(key: key);

  ExpansionListExampleState createState() => ExpansionListExampleState();
}

class ExpansionListExampleState extends State<ExpansionListExample> {
  List<bool> openList = [];

  @override
  void initState() {
    openList = List.filled(widget.transactions.length, false);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ExpansionListExample oldWidget) {
    openList = List.filled(widget.transactions.length, false);
    super.didUpdateWidget(oldWidget);
  }

  Widget build(BuildContext context) {
    return ExpansionPanelList(
      dividerColor: Colors.transparent,
      elevation: 0,
      expansionCallback: (index, isExpanded) {
        setState(() {
          openList[index] = !openList[index];
        });
      },
      children: getItemList(),
    );
  }

  List<ExpansionPanel> getItemList() {
    return widget.transactions
        .asMap()
        .map((index, item) {
          return MapEntry(
              index,
              ExpansionPanel(
                headerBuilder: (context, isExpanded) {
                  return Text(
                    item.frontSide,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  );
                },
                canTapOnHeader: true,
                isExpanded: openList[index],
                body: Text(
                  item.backSide,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ));
        })
        .values
        .toList();
  }
}
/*
StreamBuilder(
        stream: rootState.getCardData,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            rootState.allCardNotifier.value = [...rootState.allCardNotifier.value, snapshot.data];
          }
          return ListView.builder(
            itemCount: rootState.currentWorkshop!.cardList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  width: Get.width,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.amber),
                  child: Row(
                    children: [
                      Expanded(flex: 2, child: FlutterLogo()),
                      Expanded(
                          flex: 9,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 10),
                              Text(rootState.currentWorkshop!.cardList[index].frontSide, style: TextStyle(fontSize: 20)),
                              if (rootState.currentWorkshop!.cardList[index].isOpen) ...[
                                Divider(),
                                Text(rootState.currentWorkshop!.cardList[index].backSide, style: TextStyle(fontSize: 20)),
                              ],
                              SizedBox(height: 10),
                              ExpansionPanelList(
                                expansionCallback: (panelIndex, isExpanded) {
                                  rootState.currentWorkshop!.cardList[index].isOpen = isExpanded;
                                  setState(() {});
                                },
                                
                              )
                            ],
                          )),
                      Expanded(flex: 2, child: Icon(Icons.edit)),
                    ],
                  ),
                ),
              );
            },
          );
        },
      )
 */