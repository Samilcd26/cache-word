// ignore_for_file: file_names

import 'package:cache_word/Business/Data/card_model.dart';
import 'package:cache_word/Business/Data/workshop_model.dart';

abstract class IWorkshopService {
  Stream<WorkshopModel> get streamResponse;

  //************************************************************************************************
  //*Message Event
  Future<List<WorkshopModel>> getWorkshopData();
  Future<void> addOrUpdateWorkshopData(String id, String? title, WorkshopModel? workshopModel);
  Future<void> deleteWorkshopData(String id);
  Future<void> deleteAllWorkshop();
  Future<void> addNewCard(String workshopId, CardModel cardModel);
  Future<void> removeCard(String workshopId, String cardId);
}
