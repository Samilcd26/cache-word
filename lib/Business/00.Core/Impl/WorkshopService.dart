import 'package:cache_word/Business/00.Core/IWorkshopService.dart';
import 'package:cache_word/Business/01.Repository/flash_group_operation.dart';
import 'package:cache_word/Business/02.Stream/my_stream.dart';
import 'package:cache_word/Business/Data/card_model.dart';
import 'package:cache_word/Business/Data/workshop_model.dart';
import 'package:uuid/uuid.dart';

class WorkshopService extends IWorkshopService {
  final WorkshopOperation _operation = WorkshopOperation();
  var uuid = const Uuid();
  MyStream<WorkshopModel> workshopStream = MyStream<WorkshopModel>();
  Stream<WorkshopModel> get streamResponse => workshopStream.getResponse;
  @override
  Future<void> addNewCard(String workshopId, CardModel cardModel) {
    // TODO: implement addNewCard
    throw UnimplementedError();
  }

  @override
  Future<void> addOrUpdateWorkshopData(String id, String? title, WorkshopModel? workshopModel) async {
    //?Create new group
    if (workshopModel == null) {
      var newGroup = WorkshopModel(id: uuid.v1(), title: title!, cardList: []);
      await _operation.addOrUpdateItem(newGroup.id, newGroup);
      workshopStream.add(newGroup);
    } else if (title != null) {
      var tempt = _operation.getItem(id);
      tempt!.title = title;
      await _operation.addOrUpdateItem(tempt.id, tempt);
    } else {
      await _operation.addOrUpdateItem(id, workshopModel!);
      workshopStream.add(workshopModel);
    }
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
  Future<void> removeCard(String workshopId, String cardId) {
    // TODO: implement removeCard
    throw UnimplementedError();
  }
}
