import 'package:flutter/material.dart';
import 'item/weighing_item_dialog_widget.dart';
import 'models/weighing_model.dart';

class WeighingCommon {

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

}