import 'package:mobx/mobx.dart';

part 'weighing_store.g.dart';

class WeighingStore = _WeighingStoreBase with _$WeighingStore;
abstract class _WeighingStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}