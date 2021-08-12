import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readings_and_weighing/app/modules/readings/readings_store.dart';
import 'package:flutter/material.dart';

class ReadingsPage extends StatefulWidget {

  final String title;
  const ReadingsPage({Key? key, this.title = 'Leituras'}) : super(key: key);

  @override
  ReadingsPageState createState() => ReadingsPageState();

}

class ReadingsPageState extends State<ReadingsPage> {

  final ReadingsStore store = Modular.get();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: GoogleFonts.aBeeZee()),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
    
  }

}