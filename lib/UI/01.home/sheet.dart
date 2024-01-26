// ignore_for_file: non_constant_identifier_names

import 'package:cache_word/Business/Data/workshop_model.dart';
import 'package:cache_word/UI/01.home/sheet.mixin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeSheet extends StatelessWidget with SheetMixin {
  HomeSheet({super.key, required this.workshop});
  WorkshopModel workshop;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Column(
        children: [
          const DividerPull(),
          _CustomTextIconButton(Icons.card_giftcard_outlined, "Open the deck", () => openWorkshop(workshop)),
          const SizedBox(height: 20),
          _CustomTextIconButton(Icons.card_giftcard_outlined, "Testing", () {}),
          const SizedBox(height: 20),
          _CustomTextIconButton(Icons.card_giftcard_outlined, "Rename", () {}),
          const SizedBox(height: 20),
          _CustomTextIconButton(Icons.card_giftcard_outlined, "Delete", () => deleteWorkshop(workshop.id)),
        ],
      ),
    );
  }

  InkWell _CustomTextIconButton(IconData icon, String title, Function fun) => InkWell(
        onTap: () => fun(),
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: Icon(icon, size: 30)),
              Expanded(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              const Expanded(child: SizedBox())
            ],
          ),
        ),
      );
}

class DividerPull extends StatelessWidget {
  const DividerPull({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: Colors.black45,
      thickness: 2.5,
      indent: 150,
      endIndent: 150,
    );
  }
}
