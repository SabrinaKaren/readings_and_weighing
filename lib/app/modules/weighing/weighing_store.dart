import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:readings_and_weighing/app/modules/weighing/item/item_store.dart';
import 'package:readings_and_weighing/app/modules/weighing/repositories/weighing_repository.dart';
import 'package:readings_and_weighing/app/modules/weighing/weighing_common.dart';

import 'models/weighing_model.dart';
part 'weighing_store.g.dart';

class WeighingStore = _WeighingStoreBase with _$WeighingStore;
abstract class _WeighingStoreBase with Store {

  final WeighingRepository repository = Modular.get();
  final WeighingModel weighingMOCK = WeighingModel(id: '1', date: DateTime.now().toIso8601String(), weight: 80);

  @observable
  ObservableList<ItemStore>? weighingList;

  _WeighingStoreBase() {
    weighingList = repository.getWeighingList().asObservable();
  }
  
  @action
  addNewItem(BuildContext context) {
    // weighingList!.add(ItemStore('Sabrina'));
    WeighingCommon().showFormDialog(context, weighingMOCK);
  }

}
