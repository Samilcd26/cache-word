import 'package:cache_word/UI/06.tests/0.flashCard/view.dart';
import 'package:cache_word/UI/06.tests/1.wordSelect/view.dart';
import 'package:cache_word/UI/06.tests/3.matchCard/view.dart';
import 'package:cache_word/UI/06.tests/4.writeWord/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class SelectTestCard extends StatelessWidget {
  const SelectTestCard({super.key, required this.rating, required this.title, required this.iconLocation});
  final String title;
  final double rating;
  final String iconLocation;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(MatchCard()),
      child: Container(
          width: Get.width,
          margin: const EdgeInsets.symmetric(horizontal: 5.0),
          decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 90, height: 90, child: CircleAvatar(backgroundImage: AssetImage(iconLocation))),
              Text(title),
              SizedBox(height: 50),
              RatingBarIndicator(
                rating: 2,
                direction: Axis.horizontal,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber),
              ),
            ],
          )),
    );
  }
}
