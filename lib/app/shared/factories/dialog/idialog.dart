import 'package:flutter/cupertino.dart';
import 'models/dialog_action.dart';

abstract class IDialog {

  Widget create(BuildContext context, Widget title, Widget content, List<DialogAction> actions);

}