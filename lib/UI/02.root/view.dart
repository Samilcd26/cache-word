import 'package:cache_word/UI/02.root/view.model.dart';
import 'package:cache_word/UI/03.home/view.dart';
import 'package:cache_word/UI/07.prepared/view.dart';
import 'package:flutter/material.dart';

class RootPage extends StatelessWidget with RootViewModel {
  RootPage({super.key});

  List<BottomNavigationBarItem> _navBarsItems() {
    return [
      const BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.business),
        label: 'Business',
      ),
    ];
  }

  static final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    const PreparedWordPage(),
  ];

  @override
  Widget build(BuildContext context) {
    initialize();
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: tabIndex,
        builder: (BuildContext context, dynamic value, Widget? child) {
          return _widgetOptions.elementAt(tabIndex.value);
        },
      ),
      extendBody: true,
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: tabIndex,
        builder: (BuildContext context, dynamic value, Widget? child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 2),
                  color: Colors.black.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(50)),
              child: BottomNavigationBar(
                items: _navBarsItems(),
                currentIndex: tabIndex.value,
                elevation: 0,
                backgroundColor: Colors.transparent,
                selectedItemColor: Colors.amber[800],
                onTap: (value) {
                  tabIndex.value = value;
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
