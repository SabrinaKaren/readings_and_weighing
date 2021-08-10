import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:readings_and_weighing/app/modules/weighing/item/item_store.dart';
import 'package:readings_and_weighing/app/modules/weighing/weighing_common.dart';
import 'package:readings_and_weighing/app/shared/factories/dialog/dialog_factory.dart';
import 'package:readings_and_weighing/app/shared/factories/dialog/models/dialog_action.dart';

class WeighingItemWidget extends StatelessWidget {

  final ItemStore weighingItem;

  WeighingItemWidget({
    Key? key,
    required this.weighingItem,
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
              onPressed: () => WeighingCommon().showFormDialog(context),
            ),
            IconButton(
              icon: Icon(Icons.delete, size: 25, color: Colors.red),
              onPressed: () {
                DialogFactory.showAlertDialog(
                  context,
                  Text('Excluir'),
                  Text('Você realmente deseja excluir este registro?'),
                  [
                    DialogAction(child: Text('Excluir'), onPressed: () {
                      print('Excluir registro!');
                    }),
                    DialogAction(child: Text('Cancelar'), onPressed: () {
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