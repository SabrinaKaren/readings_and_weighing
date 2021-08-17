import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../sqflite/sqflite_common.dart' as sqfliteCommon;

class DbProvider {
  
  Database? _db;

  get db async {
    if(_db != null) {
      return _db;
    } else{
      _db = await _initDb();
      return _db;
    }
  }

  _initDb() async {
    final dataBasePath = await getDatabasesPath();
    final dataBaseLocal = join(dataBasePath, sqfliteCommon.readingsAndWeighingDb);
    return await openDatabase(dataBaseLocal, version: 1, onCreate: _onCreate );
  }

  _onCreate(Database db, int version) async {
    List<String> createTables = sqfliteCommon.createTables;
    for (String query in createTables) {
      await db.execute(query);
    }
  }

}