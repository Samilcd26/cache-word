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
    return Container(
        width: Get.width,
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 90, height: 90, child: CircleAvatar(backgroundImage: AssetImage(iconLocation))),
            Text(title),
            RatingBarIndicator(
              rating: rating,
              itemBuilder: (context, index) {
                switch (index) {
                  case 0:
                    return const Icon(
                      Icons.sentiment_very_dissatisfied,
                      color: Colors.red,
                    );
                  case 1:
                    return const Icon(
                      Icons.sentiment_dissatisfied,
                      color: Colors.redAccent,
                    );
                  case 2:
                    return const Icon(
                      Icons.sentiment_neutral,
                      color: Colors.amber,
                    );
                  case 3:
                    return const Icon(
                      Icons.sentiment_satisfied,
                      color: Colors.lightGreen,
                    );
                  case 4:
                    return const Icon(
                      Icons.sentiment_very_satisfied,
                      color: Colors.green,
                    );
                  default:
                    return const Icon(
                      Icons.sentiment_very_satisfied,
                      color: Colors.black,
                    );
                }
              },
              itemCount: 5,
              itemSize: 50.0,
            ),
          ],
        ));
  }
}
