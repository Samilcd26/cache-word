import 'package:cache_word/Business/00.Core/IWorkshopService.dart';
import 'package:cache_word/Business/01.Repository/flash_group_operation.dart';
import 'package:cache_word/Business/02.Stream/my_stream.dart';
import 'package:cache_word/Business/Data/card_model.dart';
import 'package:cache_word/Business/Data/workshop_model.dart';
import 'package:uuid/uuid.dart';

class WorkshopService extends IWorkshopService {
  final WorkshopOperation _operation = WorkshopOperation();
  var uuid = const Uuid();
  //? ////////////////////////////////////////////////////////////////
  //? Workshop Stream
  MyStream<WorkshopModel> workshopStream = MyStream<WorkshopModel>();
  @override
  Stream<WorkshopModel> get streamWorkshopModel => workshopStream.getResponse;
  //? ////////////////////////////////////////////////////////////////
  //? Card Stream
  MyStream<CardModel> cardStream = MyStream<CardModel>();
  @override
  Stream<CardModel> get streamCardModel => cardStream.getResponse;
  //? ////////////////////////////////////////////////////////////////
  @override
  Future<void> addNewWorkshopData(WorkshopModel workshopModel) async {
    workshopModel.id = uuid.v1();
    await _operation.addOrUpdateItem(workshopModel.id, workshopModel);
    workshopStream.add(workshopModel);
  }

  @override
  Future<void> renameWorkshop(String title, WorkshopModel workshopModel) async {
    workshopModel.title = title;
    await _operation.addOrUpdateItem(workshopModel.id, workshopModel);
  }

  @override
  Future<void> deleteAllWorkshop() => _operation.clear();

  @override
  Future<void> deleteWorkshopData(String id) => _operation.deleteItem(id);

  @override
  Future<List<WorkshopModel>> getWorkshopData() async {
    await _operation.start();

    return _operation.getAllValues();
  }

  @override
  Future<void> removeCard(WorkshopModel workshopModel, String cardId) async {
    workshopModel.cardList.removeWhere((element) => element.id == cardId);
    await _operation.addOrUpdateItem(workshopModel.id, workshopModel);
  }

  @override
  Future<void> addNewCard(WorkshopModel workshopModel, CardModel cardModel) async {
    workshopModel.cardList = [...workshopModel.cardList, cardModel];
    await _operation.addOrUpdateItem(workshopModel.id, workshopModel);
    cardStream.add(cardModel);
  }
}
