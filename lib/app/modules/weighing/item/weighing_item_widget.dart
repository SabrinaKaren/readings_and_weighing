import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:readings_and_weighing/app/modules/weighing/item/item_store.dart';
import 'package:readings_and_weighing/app/modules/weighing/models/weighing_model.dart';
import 'package:readings_and_weighing/app/modules/weighing/weighing_common.dart';
import 'package:readings_and_weighing/app/shared/factories/dialog/dialog_factory.dart';
import 'package:readings_and_weighing/app/shared/factories/dialog/dialog_action_model.dart';

class WeighingItemWidget extends StatelessWidget {

  final ItemStore weighingItem;
  final WeighingModel weighingObject;

  WeighingItemWidget({
    Key? key,
    required this.weighingItem,
    required this.weighingObject,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Observer(builder: (_) {
      return ListTile(
        title: Text(weighingItem.title),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.edit, size: 25, color: Colors.blue),
              onPressed: () => WeighingCommon().showFormDialog(context, weighingObject),
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
    });

  }

}