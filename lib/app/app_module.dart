import 'package:readings_and_weighing/app/modules/readings/readings_module.dart';
import 'package:readings_and_weighing/app/modules/weighing/weighing_module.dart';
import 'package:readings_and_weighing/app/pages/splash/splash_page.dart';
import 'package:readings_and_weighing/app/pages/splash/splash_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => SplashStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => SplashPage()),
    ModuleRoute('/home', module: HomeModule()),
    ModuleRoute('/readings', module: ReadingsModule()),
    ModuleRoute('/weighing', module: WeighingModule()),
  ];
}
