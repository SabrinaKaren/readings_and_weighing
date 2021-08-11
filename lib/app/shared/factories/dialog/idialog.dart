import 'package:flutter/cupertino.dart';
import 'dialog_action_model.dart';

abstract class IDialog {

  Widget create(BuildContext context, Widget title, Widget content, List<DialogActionModel> actions);

}