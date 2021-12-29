import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart' ;

class DatabaseHelper {

  static final _databaseName = "projetflutter";
  static final _databaseVersion = 1;


  static final table_admin = 'admin';
  static final column_id = 'id_admin';
  static final column_name = 'nom_admin';
  static final column_email = 'email';
  static final column_password = 'password';






  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  Database? _database = null;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
          "CREATE TABLE $table_admin ("
          "$column_id INTEGER PRIMARY KEY AUTOINCREMENT,"
              "   $column_name TEXT NOT NULL,"
    "$column_email TEXT NOT NULL,"
              " $column_password TEXT NOT NULL"
              ")"
          
          
    
          );
  }





  Future<List<Map<String, dynamic>>?> getLoginUser(String userEm, String password) async {
    var dbClient = await database;
    var res = await dbClient.rawQuery("SELECT * FROM $table_admin WHERE "
        "$column_email = '$userEm' AND "
        "$column_password = '$password'");

    if (res.length > 0) {
      return res;
    }

    return null;
  }


  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table_admin, row
    );
  }




  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(table_admin);
  }


  Future<int?> queryRowCount() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM $table_admin'));
  }


  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[column_id];
    return await db.update(table_admin, row, where: '$column_id = ?', whereArgs: [id]);
  }


  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(table_admin, where: '$column_id = ?', whereArgs: [id]);
  }






}