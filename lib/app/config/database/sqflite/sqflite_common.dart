// database names
String readingsAndWeighingDb = "db_readings_and_weighing.db";

// table names
String weighingTableName = "weighing";
String readingTableName = "reading";

// sql scripts
List<String> createTables = [
  "CREATE TABLE $weighingTableName (id TEXT, date TEXT, weight TEXT)"
];