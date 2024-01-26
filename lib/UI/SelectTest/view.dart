import 'package:cache_word/Business/Data/workshop_model.dart';
import 'package:cache_word/UI/SelectTest/SelectTestCard/asset_image.enum.dart';
import 'package:cache_word/UI/SelectTest/SelectTestCard/select_test_card.dart';
import 'package:cache_word/UI/SelectTest/SelectTestCard/select_test_card.data.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SelectScreen extends StatelessWidget {
  SelectScreen({super.key, required this.workshopModel});
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
  SelectTestCardData(icon: TESTMENUICONS.memorize, rating: 5, title: "Kelime Seçme"),
  SelectTestCardData(icon: TESTMENUICONS.find, rating: 3, title: "Kelime asdasdsd"),
];
