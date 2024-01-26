import 'package:cache_word/Business/00.Core/IWorkshopService.dart';
import 'package:cache_word/Business/00.Core/Impl/WorkshopService.dart';
import 'package:cache_word/Business/Data/card_model.dart';
import 'package:cache_word/Business/Data/workshop_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages

class MainController extends GetxController {
  final IWorkshopService _service = WorkshopService();

  Stream<WorkshopModel> get getStreamData => _service.streamResponse;
  final ValueNotifier<List<WorkshopModel>> allWorkshopNotifier = ValueNotifier([]);
  Future<void> initialize() async {
    allWorkshopNotifier.value = await _service.getWorkshopData();
  }

  Future<void> addNewWorkshopData(WorkshopModel workshopModel) => _service.addNewWorkshopData(workshopModel);

  Future<void> renameWorkshop(String newTitle, WorkshopModel workshopModel) async {
    await _service.renameWorkshop(newTitle, workshopModel);
    initialize();
  }

  Future<void> deleteWorkshopData(String id) async {
    _service.deleteWorkshopData(id);
    initialize();
  }

  Future<void> deleteAllWorkshop() => _service.deleteAllWorkshop();
  Future<void> addNewCard(WorkshopModel workshopModel, CardModel cardModel) => _service.addNewCard(workshopModel, cardModel);
  Future<void> removeCard(
    WorkshopModel workshopModel,
    String cardId,
  ) =>
      _service.removeCard(workshopModel, cardId);
}
