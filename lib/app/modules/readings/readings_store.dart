import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:readings_and_weighing/app/modules/readings/models/readings_model.dart';
import 'package:readings_and_weighing/app/modules/readings/repositories/readings_repository.dart';
import 'package:readings_and_weighing/app/modules/readings/shared/readings_common.dart';
import 'package:readings_and_weighing/app/shared/utils/random_generator.dart';
part 'readings_store.g.dart';

class ReadingsStore = _ReadingsStoreBase with _$ReadingsStore;

abstract class _ReadingsStoreBase with Store {

  final ReadingsRepository repository = Modular.get();
  final ReadingsCommon _readingsCommon = ReadingsCommon();
  final RandomGenerator _randomGenerator = RandomGenerator();

  @observable
  ObservableList<ReadingsModel> readingsList = ObservableList<ReadingsModel>();

  @observable
  bool isAnalyzing = false;

  _ReadingsStoreBase() {
    var readingsListFromDb = repository.getReadingsList();
    readingsListFromDb.then((value) {
      readingsList = value.asObservable();
      readingsList = _readingsCommon.orderListByDate(readingsList);
    });
  }
  
  void showFormDialogToAddItem(BuildContext context) {
    /* var newReadings = ReadingsModel(
      id: 'id',
      date: DateFormat('dd/MM/yyyy').format(DateTime.now()),
      value: readingsList.isNotEmpty ? readingsList.last.value : '60'
    );
    _readingsCommon.showFormDialog(context, newReadings); */
    print('showFormDialogToAddItem in Readings');
  }
  
  @action
  void saveReadings(String id, String date, String value) {
    var readingsToSave = ReadingsModel(id: id, date: date, value: value);
    if (readingsToSave.id == 'id') {
      readingsToSave.id = _randomGenerator.generateUuid();
      _insertReadings(readingsToSave);
    } else _updateReadings(readingsToSave);
  }

  @action
  void _insertReadings(ReadingsModel readingsToInsert) {
    /* _table.insert(readingsToInsert); // inserting in database
    readingsList.add(readingsToInsert); // adding in the screen
    readingsList = _readingsCommon.orderListByDate(readingsList);
    Modular.to.pop(); // closing the dialog */
    print('_insertReadings in Readings');
  }

  @action
  void _updateReadings(ReadingsModel readingsToUpdate) {

    /* _table.update(readingsToUpdate.id, readingsToUpdate.toJson());

    // updating in the screen
    for (var i=0; i<readingsList.length; i++) {
      if (readingsList[i].id == readingsToUpdate.id) readingsList[i] = readingsToUpdate;
    }
    readingsList = _readingsCommon.orderListByDate(readingsList);

    Modular.to.pop(); // closing the dialog */

    print('_updateReadings in Readings');

  }

  @action
  void deleteReadings(String id) {    
    /* _table.deleteById(id); // deleting in database
    readingsList.removeWhere((element) => element.id == id); // deleting in the screen
    Modular.to.pop(); // closing the dialog */
    print('deleteReadings in Readings');
  }

  @action
  void changeIsAnalyzing() {
    isAnalyzing = !isAnalyzing;
  }

}