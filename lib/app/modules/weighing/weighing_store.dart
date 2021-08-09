import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:readings_and_weighing/app/modules/weighing/item/item_store.dart';
import 'package:readings_and_weighing/app/modules/weighing/repositories/weighing_repository.dart';
part 'weighing_store.g.dart';

class WeighingStore = _WeighingStoreBase with _$WeighingStore;
abstract class _WeighingStoreBase with Store {

  final WeighingRepository repository = Modular.get();

  @observable
  ObservableList<ItemStore>? weighingList;

  _WeighingStoreBase() {
    weighingList = repository.getWeighingList().asObservable();
  }
  
  @action
  addNewItem() {
    weighingList!.add(ItemStore('Sabrina'));
    print(weighingList);
  }

}
