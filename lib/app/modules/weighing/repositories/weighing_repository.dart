import 'package:readings_and_weighing/app/modules/weighing/item/item_store.dart';
import 'package:readings_and_weighing/app/shared/utils/random_generator.dart';

class WeighingRepository {

  RandomGenerator faker = RandomGenerator();

  List<ItemStore> getWeighingList() {
    List<ItemStore> listToReturn = [];
    for (int i=0; i<8; i++) {
      listToReturn.add(ItemStore(faker.generateName()));
    }
    return listToReturn;
  }

}