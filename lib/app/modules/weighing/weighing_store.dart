import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:readings_and_weighing/app/modules/weighing/repositories/weighing_repository.dart';
import 'package:readings_and_weighing/app/modules/weighing/weighing_common.dart';
import 'models/weighing_model.dart';
part 'weighing_store.g.dart';

class WeighingStore = _WeighingStoreBase with _$WeighingStore;
abstract class _WeighingStoreBase with Store {

  final WeighingRepository repository = Modular.get();
  final WeighingCommon weighingCommon = WeighingCommon();

  @observable
  ObservableList<WeighingModel>? weighingList;

  _WeighingStoreBase() {
    weighingList = repository.getWeighingList().asObservable();
  }
  
  @action
  addNewItem(BuildContext context) {
    var newWeighing = weighingCommon.generateWeighingMOCK();
    weighingList!.add(newWeighing);
    WeighingCommon().showFormDialog(context, newWeighing);
  }

}
