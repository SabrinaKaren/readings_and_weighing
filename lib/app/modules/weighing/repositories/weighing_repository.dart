import 'package:readings_and_weighing/app/modules/weighing/models/weighing_model.dart';
import 'package:readings_and_weighing/app/modules/weighing/weighing_common.dart';

class WeighingRepository {

  final WeighingCommon weighingCommon = WeighingCommon();

  List<WeighingModel> getWeighingList() {
    List<WeighingModel> listToReturn = [];
    for (int i=0; i<8; i++) {
      listToReturn.add(weighingCommon.generateWeighingMOCK());
    }
    return listToReturn;
  }

}