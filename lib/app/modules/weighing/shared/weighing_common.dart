import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:readings_and_weighing/app/shared/utils/random_generator.dart';
import '../item/weighing_item_dialog_widget.dart';
import '../models/weighing_model.dart';

class WeighingCommon {

  final RandomGenerator faker = RandomGenerator();

  Future<void> showFormDialog(BuildContext context, WeighingModel weighingObject) async {
    return await showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return WeighingItemDialogWidget(weighingObject: weighingObject);
        });
      },
      barrierDismissible: false,
    );
  }

  WeighingModel generateWeighingMOCK() {
    return WeighingModel(id: faker.generateUuid(), date: faker.generateDate(), weight: faker.generateDouble());
  }

  ObservableList<WeighingModel> orderListByDate(ObservableList<WeighingModel> weighingList) {
    weighingList.sort((a, b) => getDateInDateTime(b.date).compareTo(getDateInDateTime(a.date)));
    return weighingList;
  }

  DateTime getDateInDateTime(String dateInString) {
    String day = dateInString.substring(0, 2);
    String month = dateInString.substring(3, 5);
    String year = dateInString.substring(6);
    return DateTime(int.parse(year), int.parse(month), int.parse(day));
  }

}