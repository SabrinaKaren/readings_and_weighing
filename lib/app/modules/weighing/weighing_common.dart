import 'package:flutter/material.dart';
import 'widgets/weighing_item_dialog_widget.dart';

class WeighingCommon {

  Future<void> showFormDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return WeighingItemDialogWidget();
        });
      }
    );
  }

}