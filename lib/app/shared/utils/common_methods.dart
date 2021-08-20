import 'package:flutter/material.dart';

class CommonMethods {

  bool isTheOrientationLandscape(Orientation currentOrientation) => currentOrientation == Orientation.landscape;

  DateTime getDateInDateTime(String dateInString) {
    String day = dateInString.substring(0, 2);
    String month = dateInString.substring(3, 5);
    String year = dateInString.substring(6);
    return DateTime(int.parse(year), int.parse(month), int.parse(day));
  }

}