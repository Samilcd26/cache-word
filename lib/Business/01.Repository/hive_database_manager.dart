import 'package:cache_word/Business/Data/card_model.dart';
import 'package:cache_word/Business/Data/workshop_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

abstract class IHiveDatabaseManager {
  // ignore: non_constant_identifier_names
  Future<void> Initialize();

  Future<void> clear();
}

@immutable
final class HiveDatabaseManager extends IHiveDatabaseManager {
  @override
  Future<void> Initialize() async {
    await _open();
    _initializeOperation();
  }

  @override
  Future<void> clear() async {
    await Hive.deleteFromDisk();
  }

  //* Open your database connection
  Future<void> _open() async {
    await Hive.initFlutter();
  }

  //* Register your generic model or make your operation before starting
  void _initializeOperation() {
    Hive.registerAdapter(CardModelImplAdapter());
    Hive.registerAdapter(WorkshopModelImplAdapter());
  }
}
