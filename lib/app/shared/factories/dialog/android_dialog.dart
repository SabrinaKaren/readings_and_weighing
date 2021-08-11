import 'package:flutter/material.dart';
import 'package:readings_and_weighing/app/shared/factories/dialog/idialog.dart';
import 'package:readings_and_weighing/app/shared/factories/dialog/dialog_action_model.dart';

class AndroidDialog implements IDialog {

  @override
  Widget create(BuildContext context, Widget title, Widget content, List<DialogActionModel> actions) {

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