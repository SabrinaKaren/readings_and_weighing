import 'package:flutter/material.dart';
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

}