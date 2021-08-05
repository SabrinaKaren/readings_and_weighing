import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:readings_and_weighing/app/modules/readings/readings_module.dart';
 
void main() {

  setUpAll(() {
    initModule(ReadingsModule());
  });
}