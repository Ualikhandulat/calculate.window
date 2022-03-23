import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) {
      return _database as Database;
    }

    return initDB();
  }

  static Future<Database> initDB() async {
    return await openDatabase(
      join(await getDatabasesPath(), "orders_database.db"),
      onCreate: (Database db, int version) {
        return db.execute(
          'CREATE TABLE orders(id INTEGER PRIMARY KEY, address TEXT)',
        );
      },
      version: 1,
    );
  }
}
