import 'package:readings_and_weighing/app/config/database/sqflite/db_provider.dart';
import 'package:readings_and_weighing/app/modules/weighing/models/weighing_model.dart';
import 'package:sqflite/sqflite.dart';

class WeighingTable extends DbProvider {

  static final String weighingTableName = "weighing";

  Future<int> insert(WeighingModel weighing) async {
    Database dataBase = await db;
    return await dataBase.insert(weighingTableName, weighing.toJson());
  }

  Future<List<Map<String, dynamic>>> getAll() async {
    Database dataBase = await db;
    String sql = "SELECT * FROM $weighingTableName";
    return await dataBase.rawQuery(sql);
  }

  Future<List<Map<String, dynamic>>> getById(String id) async {
    Database dataBase = await db;
    String sql = "SELECT * FROM $weighingTableName WHERE id = '$id'";
    return await dataBase.rawQuery(sql);
  }

  Future<int> update(String id, Map<String, dynamic> values) async {
    Database dataBase = await db;
    return await dataBase.update(
        weighingTableName,
        values,
        where: "id = ?",
        whereArgs: [id]
    );
  }

  Future<int> deleteById(String id) async {
    Database dataBase = await db;
    return await dataBase.delete(
        weighingTableName,
        where: "id = ?",
        whereArgs: [id]
    );
  }

  Future<int> deleteAll() async {
    Database dataBase = await db;
    return await dataBase.delete(weighingTableName);
  }

}