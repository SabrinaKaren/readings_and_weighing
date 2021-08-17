import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:readings_and_weighing/app/modules/weighing/repositories/weighing_repository.dart';
import 'package:readings_and_weighing/app/modules/weighing/shared/weighing_common.dart';
import 'models/weighing_model.dart';
part 'weighing_store.g.dart';

class WeighingStore = _WeighingStoreBase with _$WeighingStore;
abstract class _WeighingStoreBase with Store {

  final WeighingRepository repository = Modular.get();
  final WeighingCommon weighingCommon = WeighingCommon();

  @observable
  ObservableList<WeighingModel>? weighingList;

  _WeighingStoreBase() {
    var weighingListFromDb = repository.getWeighingList();
    weighingListFromDb.then((value) {
      weighingList = value.asObservable();
    });
  }
  
  addNewItem(BuildContext context) {
    var newWeighing = weighingCommon.generateWeighingMOCK();
    WeighingCommon().showFormDialog(context, newWeighing);
  }
  
  @action
  addNewItemInPage(String id, String date, double weight) {
    var newWeighing = WeighingModel(id: id, date: date, weight: weight);
    weighingList!.add(newWeighing);
    Modular.to.pop();
  }

}