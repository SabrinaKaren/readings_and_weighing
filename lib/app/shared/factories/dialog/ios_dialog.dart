import 'package:flutter/cupertino.dart';
import 'package:readings_and_weighing/app/shared/factories/dialog/idialog.dart';
import 'package:readings_and_weighing/app/shared/factories/dialog/dialog_action_model.dart';

class IosDialog implements IDialog {

  @override
  Widget create(BuildContext context, Widget title, Widget content, List<DialogActionModel> actions) {
    
    return CupertinoAlertDialog(
      title: title,
      content: content,
      actions: actions.map<Widget>((a) {
        return CupertinoButton(
          child: a.child,
          onPressed: a.onPressed,
        );
      }).toList()
    );

  }

}