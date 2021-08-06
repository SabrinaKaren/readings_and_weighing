import 'package:readings_and_weighing/app/shared/utils/random_generator.dart';

class WeighingRepository {

  RandomGenerator faker = RandomGenerator();

  List<String> getWeighingList() {
    List<String> listToReturn = [];
    for (int i=0; i<20; i++) {
      listToReturn.add(faker.generateName());
    }
    return listToReturn;
  }

}