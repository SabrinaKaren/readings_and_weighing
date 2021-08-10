import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:readings_and_weighing/app/modules/weighing/weighing_store.dart';
import 'package:flutter/material.dart';
import 'package:readings_and_weighing/app/modules/weighing/widgets/weighing_item_widget.dart';

class WeighingPage extends StatefulWidget {
  final String title;
  const WeighingPage({Key? key, this.title = 'Pesagem'}) : super(key: key);
  @override
  WeighingPageState createState() => WeighingPageState();
}

class WeighingPageState extends State<WeighingPage> {

  final WeighingStore store = Modular.get();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              icon: Icon(Icons.add_box_rounded),
              iconSize: 30,
              onPressed: () => store.addNewItem(),
            ),
          ),
        ],
        backgroundColor: Colors.blueAccent,
      ),
      body: Observer(builder: (_) {
        return ListView.builder(
          itemCount: store.weighingList!.length,
          itemBuilder: (_, index) {
            var item = store.weighingList![index];
            return WeighingItemWidget(weighingItem: item);
          },
        );
      }),
    );

  }

}