import 'package:readings_and_weighing/app/modules/weighing/weighing_repository.dart';
import 'package:readings_and_weighing/app/modules/weighing/weighing_page.dart';
import 'package:readings_and_weighing/app/modules/weighing/weighing_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class WeighingModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => WeighingRepository()),
    Bind.lazySingleton((i) => WeighingStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => WeighingPage()),
  ];
}
