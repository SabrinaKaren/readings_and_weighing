import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readings_and_weighing/app/modules/readings/item/readings_item_widget.dart';
import 'package:readings_and_weighing/app/modules/readings/readings_store.dart';
import 'package:flutter/material.dart';

class ReadingsPage extends StatefulWidget {

  final String title;
  const ReadingsPage({Key? key, this.title = 'Leituras'}) : super(key: key);

  @override
  ReadingsPageState createState() => ReadingsPageState();

}

class ReadingsPageState extends State<ReadingsPage> {

  final ReadingsStore _store = Modular.get();

  @override
  Widget build(BuildContext context) {

    return Observer(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.title, style: GoogleFonts.aBeeZee()),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: IconButton(
                  icon: Icon(_store.isAnalyzing ? Icons.leaderboard_rounded : Icons.leaderboard_outlined),
                  iconSize: 30,
                  onPressed: () => _store.changeIsAnalyzing(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: IconButton(
                  icon: Icon(Icons.add_box_rounded),
                  iconSize: 30,
                  onPressed: _store.isAnalyzing ? null : () => _store.showFormDialogToAddItem(context),
                ),
              ),
            ],
            backgroundColor: Colors.indigo,
          ),
          body: Visibility(
            visible: !_store.isAnalyzing,
            child: ListView.builder(
              itemCount: _store.readingsList.length,
              itemBuilder: (_, index) {
                if (_store.readingsList.isNotEmpty) {
                  var item = _store.readingsList[index];
                  return ReadingsItemWidget(readingsObject: item);
                }
                return Text("");
              },
            ),
            replacement: Center(
              child: Container(
                color: Colors.pink,
                child: Text(
                  'AGUARDE, ESTAMOS EM CONSTRUÇÃO . . .',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        );
      }
    );

  }

}