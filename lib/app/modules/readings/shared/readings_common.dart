import 'package:mobx/mobx.dart';
import 'package:readings_and_weighing/app/modules/readings/models/readings_model.dart';
import 'package:readings_and_weighing/app/shared/utils/common_methods.dart';
import 'package:readings_and_weighing/app/shared/utils/random_generator.dart';

class ReadingsCommon {

  final RandomGenerator faker = RandomGenerator();
  final CommonMethods _commonMethods = CommonMethods();

  ReadingsModel generateReadingsMOCK() {
    return ReadingsModel(id: faker.generateUuid(), date: faker.generateDate(), value: faker.generateName());
  }

  ObservableList<ReadingsModel> orderListByDate(ObservableList<ReadingsModel> readingsList) {
    readingsList.sort((a, b) => _commonMethods.getDateInDateTime(b.date).compareTo(_commonMethods.getDateInDateTime(a.date)));
    return readingsList;
  }

}