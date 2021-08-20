import 'package:readings_and_weighing/app/modules/readings/models/readings_model.dart';
import 'package:readings_and_weighing/app/modules/readings/shared/readings_common.dart';

class ReadingsRepository {

  final ReadingsCommon _readingsCommon = ReadingsCommon();

  Future<List<ReadingsModel>> getReadingsList() async {
    List<ReadingsModel> listToReturn = [];
    for (var i=0; i<5; i++) {
      listToReturn.add(_readingsCommon.generateReadingsMOCK());
    }
    return listToReturn;
  }

}