import 'package:cache_word/UI/01.home/sheet.mixin.dart';
import 'package:cache_word/UI/01.home/view.model.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with HomeMixin, SheetMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 90),
        child: FloatingActionButton(onPressed: () => showCustomDialog(context)),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Workshop Cards"),
        actions: [
          const Icon(Icons.search, size: 30),
          const SizedBox(width: 10),
          IconButton(onPressed: () => rootState.deleteAllWorkshop(), icon: const Icon(Icons.settings, size: 30)),
        ],
      ),
      body: FutureBuilder(
        future: rootState.initialize(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Hata: ${snapshot.error}'));
          } else {
            allWorkshop = rootState.workshopList;
            return Column(
              children: [
                Expanded(
                  flex: 7,
                  child: StreamBuilder(
                    stream: rootState.getStreamData,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        allWorkshop = [...allWorkshop, snapshot.data];
                      }
                      return ListView.builder(
                        itemCount: allWorkshop.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () => showSheet(context, allWorkshop[index]),
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: Colors.white.withOpacity(0.5), width: 2),
                                  color: Colors.black.withOpacity(0.2)),
                              height: Get.height * 0.2,
                              width: Get.width,
                              child: Center(child: Text(allWorkshop[index].title)),
                            ),
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
      ),
    );
  }
}
