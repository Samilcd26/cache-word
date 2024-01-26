import 'package:cache_word/Business/Data/workshop_model.dart';
import 'package:cache_word/UI/01.public/create_or_update_dialog.dart';
import 'package:cache_word/UI/03.home/sheet.dart';
import 'package:cache_word/UI/03.home/sheet.mixin.dart';
import 'package:cache_word/UI/03.home/view.model.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with HomeMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _floatingActionButton(context),
      appBar: _appBar(),
      body: _body(),
    );
  }

  FutureBuilder<void> _body() {
    return FutureBuilder(
      future: rootState.initialize(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Hata: ${snapshot.error}'));
        } else {
          return Column(
            children: [
              Expanded(
                flex: 7,
                child: StreamBuilder(
                  stream: rootState.getStreamData,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      rootState.allWorkshopNotifier.value = [...rootState.allWorkshopNotifier.value, snapshot.data];
                    }
                    return ValueListenableBuilder(
                      valueListenable: rootState.allWorkshopNotifier,
                      builder: (BuildContext context, dynamic value, Widget? child) {
                        return ListView.builder(
                          itemCount: rootState.allWorkshopNotifier.value.length,
                          itemBuilder: (context, index) {
                            return WorkshopCard(workshop: rootState.allWorkshopNotifier.value[index]);
                          },
                        );
                      },
                    );
                  },
                ),
              )
            ],
          );
        }
      },
    );
  }

  AppBar _appBar() {
    return AppBar(
      centerTitle: true,
      title: const Text("Workshop Cards"),
      actions: [
        const Icon(Icons.search, size: 30),
        const SizedBox(width: 10),
        IconButton(onPressed: () => rootState.deleteAllWorkshop(), icon: const Icon(Icons.settings, size: 30)),
      ],
    );
  }

  Padding _floatingActionButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 90),
      child: FloatingActionButton(onPressed: () => CreateOrUpdateDialog.show(context, false)),
    );
  }
}

class WorkshopCard extends StatelessWidget {
  WorkshopCard({super.key, required this.workshop});
  final WorkshopModel workshop;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => HomePageBottomSheet.showSheet(context, workshop),
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.white.withOpacity(0.5), width: 2),
            color: Colors.black.withOpacity(0.2)),
        height: Get.height * 0.2,
        width: Get.width,
        child: Center(child: Text(workshop.title)),
      ),
    );
  }
}
