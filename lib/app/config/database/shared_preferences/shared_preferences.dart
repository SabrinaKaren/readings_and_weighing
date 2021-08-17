import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesStorage {

  Future write(String key, String valueType, dynamic value) async {

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    switch(valueType) {
      case 'string':
        prefs.setString(key, value);
        break;
      case 'bool':
        prefs.setBool(key, value);
        break;
      case 'int':
        prefs.setInt(key, value);
        break;
      case 'double':
        prefs.setDouble(key, value);
        break;
      default:
        prefs.setString(key, value);
        break;
    }

  }

  Future read(String key, String valueType) async {

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var value;

    switch(valueType) {
      case 'string':
        value = prefs.getString(key);
        break;
      case 'bool':
        value = prefs.getBool(key);
        break;
      case 'int':
        value = prefs.getInt(key);
        break;
      case 'double':
        value = prefs.getDouble(key);
        break;
      default:
        value = prefs.getString(key);
        break;
    }

    return value;

  }

  Future delete(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

}