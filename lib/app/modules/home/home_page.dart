import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:readings_and_weighing/app/modules/home/widgets/home_background_page.dart';
import 'home_store.dart';
import 'widgets/gesture_menu_item_widget.dart';

class HomePage extends StatefulWidget {

  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends ModularState<HomePage, HomeStore> {

  final HomeStore store = Modular.get();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: HomeBackgroundPageState(
          mainContent: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureMenuItemWidget(
                image: 'assets/images/readings_icon_01.png',
                title: 'Leituras',
                onTap: () => store.navigator('readings'),
              ),
              GestureMenuItemWidget(
                image: 'assets/images/weighing_icon_01.png',
                title: 'Pesagem',
                imageColor: Colors.white,
                onTap: () => store.navigator('weighing'),
              ),
            ],
          ),
        ),
      ),
    );
    
  }

}