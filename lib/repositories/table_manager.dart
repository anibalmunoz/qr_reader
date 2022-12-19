import 'package:sqflite/sqflite.dart';

class TableManager {
  TableManager._();
  static final shared = TableManager._();

  Future<void> scans(Database db) async {
    const table = '''
        CREATE TABLE scans(
          id INTEGER PRIMARY KEY,
          tipo TEXT,
          valor TEXT
        )
      ''';
    await db.execute(table);
  }
}
