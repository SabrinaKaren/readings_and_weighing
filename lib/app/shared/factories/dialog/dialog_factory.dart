import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readings_and_weighing/app/shared/factories/dialog/android_dialog.dart';
import 'package:readings_and_weighing/app/shared/factories/dialog/idialog.dart';
import 'package:readings_and_weighing/app/shared/factories/dialog/ios_dialog.dart';
import 'dialog_action_model.dart';

class DialogFactory {

  static Future<dynamic> showAlertDialog(BuildContext context, Widget title, Widget content, List<DialogActionModel> actions, {bool? barrierDismissible}) {

    IDialog dialogData;

    if (Platform.isIOS) dialogData = IosDialog();
    else dialogData = AndroidDialog();

    return showDialog(
      context: context,
      builder: (context) {
        return dialogData.create(
          context,
          title,
          content,
          actions,
        );
      },
      barrierDismissible: barrierDismissible ?? true,
    );

  }

}