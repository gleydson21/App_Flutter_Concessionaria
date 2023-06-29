import 'dart:async';

import 'package:app_concessionaria/domain/carros/carro.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CarrosDatabase {
  static final CarrosDatabase instance = CarrosDatabase._init();

  static Database? _database;

  CarrosDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('carros.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE carros (
        id TEXT PRIMARY KEY,
        marca TEXT,
        modelo TEXT,
        ano INTEGER,
        cor TEXT,
        imagemUrl TEXT
      )
    ''');
  }

  Future<List> getCarros() async {
    final db = await instance.database;

    const orderBy = 'marca ASC';

    final result = await db.query('carros', orderBy: orderBy);

    return result.map((json) => Carro.fromJson(json)).toList();
  }

  Future<Carro?> getCarroById(String id) async {
    final db = await instance.database;

    final result = await db.query('carros', where: 'id = ?', whereArgs: [id]);

    return result.isNotEmpty ? Carro.fromJson(result.first) : null;
  }

  Future<void> addCarro(Carro carro) async {
    final db = await instance.database;

    await db.insert('carros', carro.toJson());
  }

  Future<void> updateCarro(Carro carro) async {
    final db = await instance.database;

    await db.update('carros', carro.toJson(),
        where: 'id = ?', whereArgs: [carro.id]);
  }

  Future<void> deleteCarro(String id) async {
    final db = await instance.database;

    await db.delete('carros', where: 'id = ?', whereArgs: [id]);
  }
}
