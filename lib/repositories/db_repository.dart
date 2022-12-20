import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:qr_reader/models/scan_model.dart';
import 'package:qr_reader/repositories/table_manager.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();

  final String _tableName = "scans";

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, "ScansDB.db");
    return await openDatabase(path, version: 1, onOpen: (db) {}, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await TableManager.shared.scans(db);
  }

  Future<int> nuevoScanRaw(ScanModel nuevoScan) async {
    final id = nuevoScan.id;
    final tipo = nuevoScan.tipo;
    final valor = nuevoScan.valor;
    final db = await database;
    final res = await db.rawInsert("""
      INSERT INTO scans (id, tipo, valor)
      VALUES ($id, $tipo, $valor)
    """);
    return res;
  }

  Future<int> nuevoScan(ScanModel nuevoScan) async {
    final db = await database;
    final res = await db.insert(_tableName, nuevoScan.toJson());
    return res;
  }

  Future<ScanModel?> getScanById(int id) async {
    final db = await database;
    final res = await db.query(_tableName, where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? ScanModel.fromJson(res.first) : null;
  }

  Future<List<ScanModel>> getTodosLosScans() async {
    final db = await database;
    final res = await db.query(_tableName);
    return res.isNotEmpty ? res.map((e) => ScanModel.fromJson(e)).toList() : [];
  }

  Future<List<ScanModel>> getScansPorTipo(String tipo) async {
    final db = await database;
    final res = await db.rawQuery("""
      SELECT * FROM $_tableName WHERE tipo = "$tipo"
    """);
    return res.isNotEmpty ? res.map((e) => ScanModel.fromJson(e)).toList() : [];
  }

  Future<int> updateScanModel(ScanModel nuevo) async {
    final db = await database;
    final res = await db.update(_tableName, nuevo.toJson(), where: "id = ?", whereArgs: [nuevo.id]);
    return res;
  }

  Future<int> deleteScan(int id) async {
    final db = await database;
    final res = await db.delete(_tableName, where: "id = ?", whereArgs: [id]);
    return res;
  }

  Future<int> deleteAllScans() async {
    final db = await database;
    final res = await db.rawDelete("""
      DELETE FROM $_tableName
    """);
    return res;
  }
}
