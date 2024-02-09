import 'package:cache_word/Business/Data/workshop_model.dart';
import 'package:cache_word/UI/05.selectTest/SelectTestCard/asset_image.enum.dart';
import 'package:cache_word/UI/05.selectTest/SelectTestCard/select_test_card.dart';
import 'package:cache_word/UI/05.selectTest/SelectTestCard/select_test_card.data.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SelectTestScreen extends StatelessWidget {
  SelectTestScreen({super.key, required this.workshopModel});
  WorkshopModel workshopModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CarouselSlider(
          options: CarouselOptions(height: 400.0, enlargeCenterPage: true),
          items: test.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return SelectTestCard(
                  rating: i.rating,
                  title: i.title,
                  iconLocation: i.icon,
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}

List<SelectTestCardData> test = [
  SelectTestCardData(icon: TESTMENUICONS.memorize, rating: 5, title: "Word List"),
  SelectTestCardData(icon: TESTMENUICONS.find, rating: 3, title: "Word Select "),
  SelectTestCardData(icon: TESTMENUICONS.find, rating: 3, title: "Word Find"),
  SelectTestCardData(icon: TESTMENUICONS.find, rating: 3, title: "Listen & Select"),
  SelectTestCardData(icon: TESTMENUICONS.find, rating: 3, title: "Listen & Find"),
  SelectTestCardData(icon: TESTMENUICONS.find, rating: 3, title: "Listen & Write"),
  SelectTestCardData(icon: TESTMENUICONS.find, rating: 3, title: "Read & Write"),
];
