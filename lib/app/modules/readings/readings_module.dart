import 'package:flutter_modular/flutter_modular.dart';
import '../readings/readings_store.dart'; 
import 'readings_page.dart';

class ReadingsModule extends Module {

  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ReadingsStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => ReadingsPage()),
  ];

}