import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:readings_and_weighing/app/modules/weighing/item/item_store.dart';

class WeighingItemWidget extends StatelessWidget {

  final ItemStore weighingItem;
  const WeighingItemWidget({Key? key, required this.weighingItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Observer(builder: (_) {
      return ListTile(
        title: Text(weighingItem.title),
        trailing: IconButton(
          onPressed: null,
          icon: Icon(Icons.remove_circle, size: 20),
        ),
      );
    });

  }

}