import 'package:cache_word/Business/00.Core/IWorkshopService.dart';
import 'package:cache_word/Business/00.Core/Impl/WorkshopService.dart';
import 'package:cache_word/Business/Data/card_model.dart';
import 'package:cache_word/Business/Data/workshop_model.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages

class MainController extends GetxController {
  final IWorkshopService _service = WorkshopService();

  Stream<WorkshopModel> get getStreamData => _service.streamResponse;

  List<WorkshopModel> workshopList = [];
  Future<void> initialize() async {
    workshopList = await _service.getWorkshopData();
  }

  Future<void> addOrUpdateWorkshopData(String id, String? title, WorkshopModel? workshopModel) =>
      _service.addOrUpdateWorkshopData(id, title, workshopModel);

  Future<void> deleteWorkshopData(String id) => _service.deleteWorkshopData(id);
  Future<void> deleteAllWorkshop() => _service.deleteAllWorkshop();
  Future<void> addNewCard(String workshopId, CardModel cardModel) => _service.addNewCard(workshopId, cardModel);
  Future<void> removeCard(
    String workshopId,
    String cardId,
  ) =>
      _service.removeCard(workshopId, cardId);
}
