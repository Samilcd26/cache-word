import 'package:cache_word/Business/01.Repository/hive_database_manager.dart';
import 'package:cache_word/UI/00.root/view.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

final class _AppInitialize {
  _AppInitialize._();

  static Future<void> initialize() async {
    await HiveDatabaseManager().Initialize();
  }
}

Future<void> main() async {
  await _AppInitialize.initialize();

  runApp(
    GetMaterialApp(debugShowCheckedModeBanner: false, themeMode: ThemeMode.system, home: RootPage()),
  );
}
