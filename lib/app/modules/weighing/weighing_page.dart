import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readings_and_weighing/app/modules/weighing/analytics/weighing_analytics_page.dart';
import 'package:readings_and_weighing/app/modules/weighing/weighing_store.dart';
import 'package:flutter/material.dart';
import 'package:readings_and_weighing/app/modules/weighing/item/weighing_item_widget.dart';

class WeighingPage extends StatefulWidget {
  final String title;
  const WeighingPage({Key? key, this.title = 'Pesagem'}) : super(key: key);
  @override
  WeighingPageState createState() => WeighingPageState();
}

class WeighingPageState extends State<WeighingPage> {

  final WeighingStore _store = Modular.get();

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
              itemCount: _store.weighingList.length,
              itemBuilder: (_, index) {
                if (_store.weighingList.isNotEmpty) {
                  var item = _store.weighingList[index];
                  return WeighingItemWidget(weighingObject: item);
                }
                return Text("");
              },
            ),
            replacement: WeighingAnalyticsPage(),
          ),
        );
      }
    );

  }

}