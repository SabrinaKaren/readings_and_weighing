import 'package:readings_and_weighing/app/modules/readings/repositories/readings_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:readings_and_weighing/app/modules/weighing/repositories/weighing_repository.dart';
import '../readings/readings_store.dart';
import 'readings_page.dart';

class ReadingsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ReadingsRepository()),
    Bind.lazySingleton((i) => ReadingsStore()),
    Bind.lazySingleton((i) => WeighingRepository()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => ReadingsPage()),
  ];
}
