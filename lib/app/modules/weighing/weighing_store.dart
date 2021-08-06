import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:readings_and_weighing/app/modules/weighing/weighing_repository.dart';
part 'weighing_store.g.dart';

class WeighingStore = _WeighingStoreBase with _$WeighingStore;
abstract class _WeighingStoreBase with Store {

  final WeighingRepository repository = Modular.get();

  @observable
  List<String> weighingList = <String>[].asObservable();

  _WeighingStoreBase() {
    init();
  }

  @action
  init() async {
    weighingList = repository.getWeighingList();
  }

  @action
  newWeighing() {
    weighingList.add('newWeighing');
  }

}