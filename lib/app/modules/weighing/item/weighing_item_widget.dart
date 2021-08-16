import 'package:flutter/material.dart';
import 'package:readings_and_weighing/app/modules/weighing/models/weighing_model.dart';
import 'package:readings_and_weighing/app/modules/weighing/weighing_common.dart';
import 'package:readings_and_weighing/app/shared/factories/dialog/dialog_factory.dart';
import 'package:readings_and_weighing/app/shared/factories/dialog/dialog_action_model.dart';
import 'package:readings_and_weighing/app/shared/utils/input_formatters.dart';

class WeighingItemWidget extends StatefulWidget {

  final WeighingModel weighingObject;

  WeighingItemWidget({
    Key? key,
    required this.weighingObject,
  }) : super(key: key);

  @override
  _WeighingItemWidgetState createState() => _WeighingItemWidgetState();

}

class _WeighingItemWidgetState extends State<WeighingItemWidget> {

  InputFormatters formatter = InputFormatters();

  @override
  Widget build(BuildContext context) {

    return ListTile(
      title: Text(widget.weighingObject.date),
      subtitle: Text(formatter.getFormattedDouble(widget.weighingObject.weight)),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.edit, size: 25, color: Colors.blue),
            onPressed: () => WeighingCommon().showFormDialog(context, widget.weighingObject),
          ),
          IconButton(
            icon: Icon(Icons.delete, size: 25, color: Colors.red),
            onPressed: () {
              DialogFactory.showAlertDialog(
                context,
                Text('Excluir'),
                Text('Você realmente deseja excluir este registro?'),
                [
                  DialogActionModel(child: Text('Excluir', style: TextStyle(fontWeight: FontWeight.bold)), onPressed: () {
                    print('Excluir registro!');
                  }),
                  DialogActionModel(child: Text('Cancelar', style: TextStyle(fontWeight: FontWeight.bold)), onPressed: () {
                    Navigator.of(context).pop();
                  }),
                ],
              );
            },
          ),
        ],
      ),
    );

  }
  
}