import 'package:mobx/mobx.dart';
part 'item_store.g.dart';

class ItemStore = _ItemStoreBase with _$ItemStore;

abstract class _ItemStoreBase with Store {

  @observable
  String title;

  _ItemStoreBase(this.title);

  @action
  setTitle(String value) => title = value;

}