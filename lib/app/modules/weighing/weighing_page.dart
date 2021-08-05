import 'package:flutter_modular/flutter_modular.dart';
import 'package:readings_and_weighing/app/modules/weighing/weighing_store.dart';
import 'package:flutter/material.dart';

class WeighingPage extends StatefulWidget {
  final String title;
  const WeighingPage({Key? key, this.title = 'WeighingPage'}) : super(key: key);
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
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}