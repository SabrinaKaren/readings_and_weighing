import 'package:flutter/material.dart';
import 'package:readings_and_weighing/app/shared/factories/dialog/idialog.dart';
import 'package:readings_and_weighing/app/shared/factories/dialog/models/dialog_action.dart';

class AndroidDialog implements IDialog {

  @override
  Widget create(BuildContext context, Widget title, Widget content, List<DialogAction> actions) {

    return AlertDialog(
      title: title,
      content: content,
      actions: actions.map((a) {
        return TextButton(
          child: a.child,
          onPressed: () => a.onPressed(),
        );
      }).toList(),
    );
    
  }

}