import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:readings_and_weighing/app/modules/readings/models/readings_model.dart';
import 'package:readings_and_weighing/app/modules/readings/readings_store.dart';
import 'package:readings_and_weighing/app/shared/factories/dialog/dialog_action_model.dart';
import 'package:readings_and_weighing/app/shared/factories/dialog/dialog_factory.dart';
import 'package:readings_and_weighing/app/shared/utils/input_formatters.dart';

class ReadingsItemWidget extends StatefulWidget {

  final ReadingsModel readingsObject;

  ReadingsItemWidget({
    Key? key,
    required this.readingsObject,
  }) : super(key: key);

  @override
  _ReadingsItemWidgetState createState() => _ReadingsItemWidgetState();

}

class _ReadingsItemWidgetState extends State<ReadingsItemWidget> {

  InputFormatters formatter = InputFormatters();
  final ReadingsStore _store = Modular.get();

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        ListTile(
          title: Text(widget.readingsObject.date),
          subtitle: Text(widget.readingsObject.value),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.edit, size: 25, color: Colors.blue),
                // onPressed: () => WeighingCommon().showFormDialog(context, widget.readingsObject),
                onPressed: () => print('Bora editar esta pesagem?'),
              ),
              IconButton(
                icon: Icon(Icons.delete, size: 25, color: Colors.red),
                onPressed: () {
                  DialogFactory.showAlertDialog(
                    context,
                    Text('Excluir'),
                    Text('Você realmente deseja excluir este registro?'),
                    [
                      DialogActionModel(
                        child: Text('Excluir', style: TextStyle(fontWeight: FontWeight.bold)),
                        onPressed: () => _store.deleteReadings(widget.readingsObject.id),
                      ),
                      DialogActionModel(
                        child: Text('Cancelar', style: TextStyle(fontWeight: FontWeight.bold)),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
        Divider(height: 1),
      ],
    );

  }
  
}