import 'dart:async';

import 'package:app_concessionaria/domain/usuarios/usuario.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class UsuariosDatabase {
  static final UsuariosDatabase instance = UsuariosDatabase._init();

  static Database? _database;

  UsuariosDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('usuarios.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE usuarios (
        id TEXT PRIMARY KEY,
        nome TEXT,
        email TEXT,
        senha TEXT
      )
    ''');
  }

  Future<List> getUsuarios() async {
    final db = await instance.database;

    const orderBy = 'nome ASC';

    final result = await db.query('usuarios', orderBy: orderBy);

    return result.map((json) => Usuario.fromJson(json)).toList();
  }

  Future<Usuario?> getUsuarioById(String id) async {
    final db = await instance.database;

    final result = await db.query('usuarios', where: 'id = ?', whereArgs: [id]);

    return result.isNotEmpty ? Usuario.fromJson(result.first) : null;
  }

  Future<void> addUsuario(Usuario usuario) async {
    final db = await instance.database;

    await db.insert('usuarios', usuario.toJson());
  }

  Future<void> updateUsuario(Usuario usuario) async {
    final db = await instance.database;

    await db.update('usuarios', usuario.toJson(),
        where: 'id = ?', whereArgs: [usuario.id]);
  }

  Future<void> deleteUsuario(String id) async {
    final db = await instance.database;

    await db.delete('usuarios', where: 'id = ?', whereArgs: [id]);
  }
}
