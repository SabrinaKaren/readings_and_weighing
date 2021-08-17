import 'package:readings_and_weighing/app/modules/weighing/models/weighing_model.dart';
import 'package:readings_and_weighing/app/modules/weighing/shared/weighing_common.dart';
import 'package:readings_and_weighing/app/modules/weighing/shared/weighing_table.dart';

class WeighingRepository {

  final WeighingTable _table = WeighingTable();
  final WeighingCommon weighingCommon = WeighingCommon();

  Future<List<WeighingModel>> getWeighingList() async {
    List<WeighingModel> listToReturn = [];
    var weighingList = await _table.getAll();
    if (weighingList.isNotEmpty) {
      weighingList.forEach((element) => listToReturn.add(WeighingModel.fromJson(element)));
    }
    return listToReturn;
  }

}