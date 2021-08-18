import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:readings_and_weighing/app/modules/weighing/repositories/weighing_repository.dart';
import 'package:readings_and_weighing/app/modules/weighing/shared/weighing_common.dart';
import 'package:readings_and_weighing/app/modules/weighing/shared/weighing_table.dart';
import 'package:readings_and_weighing/app/shared/utils/random_generator.dart';
import 'models/weighing_model.dart';
part 'weighing_store.g.dart';

class WeighingStore = _WeighingStoreBase with _$WeighingStore;
abstract class _WeighingStoreBase with Store {

  final WeighingRepository repository = Modular.get();
  final WeighingCommon weighingCommon = WeighingCommon();
  final WeighingTable _table = WeighingTable();
  final RandomGenerator _randomGenerator = RandomGenerator();

  @observable
  ObservableList<WeighingModel> weighingList = ObservableList<WeighingModel>();

  _WeighingStoreBase() {
    var weighingListFromDb = repository.getWeighingList();
    weighingListFromDb.then((value) {
      weighingList = value.asObservable();
      weighingList = weighingCommon.orderListByDate(weighingList);
    });
  }
  
  showFormDialogToAddItem(BuildContext context) {
    var newWeighing = WeighingModel(
      // id: _randomGenerator.generateUuid(),
      id: 'id',
      date: DateFormat('dd/MM/yyyy').format(DateTime.now()),
      weight: weighingList.isNotEmpty ? weighingList.last.weight : 60
    );
    WeighingCommon().showFormDialog(context, newWeighing);
  }
  
  @action
  saveWeighing(String id, String date, double weight) {

    var weighingToSave = WeighingModel(id: id, date: date, weight: weight);
    if (weighingToSave.id == 'id') {
      weighingToSave.id = _randomGenerator.generateUuid();
      _insertWeighing(weighingToSave);
    } else _updateWeighing(weighingToSave);

  }

  @action
  _insertWeighing(WeighingModel weighingToInsert) {

    // inserting in database
    _table.insert(weighingToInsert);

    // adding in the screen
    weighingList.add(weighingToInsert);
    weighingList = weighingCommon.orderListByDate(weighingList);

    // closing the dialog
    Modular.to.pop();

  }

  @action
  _updateWeighing(WeighingModel weighingToUpdate) {

    // updating in database
    _table.update(weighingToUpdate.id, weighingToUpdate.toJson());

    // updating in the screen
    for (var i=0; i<weighingList.length; i++) {
      if (weighingList[i].id == weighingToUpdate.id) weighingList[i] = weighingToUpdate;
    }
    weighingList = weighingCommon.orderListByDate(weighingList);

    // closing the dialog
    Modular.to.pop();

  }

  @action
  deleteWeighing(String id) {

    // deleting in database
    _table.deleteById(id);

    // deleting in the screen
    weighingList.removeWhere((element) => element.id == id);

    // closing the dialog
    Modular.to.pop();

  }

}