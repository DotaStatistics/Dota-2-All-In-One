import 'dart:async';
import 'dart:ffi';
import 'package:dota_stats/models/playerDetails.dart';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final _databaseName = "All_In_One_Dota2";
  static final _databaseVersion = 1;
  // make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  // only have a single app-wide reference to the database
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    String dataBaseDirectory = await getDatabasesPath();
    String path = join(dataBaseDirectory, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: (db, version) async {
          await db.execute(
            "CREATE TABLE savedProfiles(id INTEGER PRIMARY KEY, name TEXT, avatar TEXT)"
          );
        });
  }

  Future<bool> isSaved(int id) async {
    final Database db = await DatabaseHelper.instance.database;
    var response = await db.query("savedProfiles",
        where: "id = ?",
        whereArgs: [id]);
    return response.isEmpty ? false : true;
  }

  Future<void> insertPlayer(DBPlayer player) async {
    // Get a reference to the database.
    final Database db = await DatabaseHelper.instance.database;
    await db.insert(
      'savedProfiles',
      player.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deletePlayer(DBPlayer player) async {
    final Database db = await DatabaseHelper.instance.database;
    await db.delete(
      'savedProfiles',
      where: "id = ?",
      whereArgs: [player.id],
    );
  }

  Future<List<DBPlayer>> savedProfiles() async {
    // Get a reference to the database.
    final Database db = await DatabaseHelper.instance.database;

    // Query the table for all the saved Profiles
    final List<Map<String, dynamic>> maps = await db.query('savedProfiles');

    // Convert the List
    return List.generate(maps.length, (i) {
      return DBPlayer(
        id: maps[i]['id'],
        name: maps[i]['name'],
        avatar: maps[i]['avatar'],
      );
    });
  }
}

//TODO saved & recent booleans in datenbank integrieren

class DBPlayer {
  final int id;
  final String name;
  final String avatar;

  DBPlayer({this.id, this.name, this.avatar});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'avatar': avatar,
    };
  }

  factory DBPlayer.fromAPI(PlayerDetails player) => DBPlayer(
      id: player.steamAccount.id,
      name: player.steamAccount.name,
      avatar: player.steamAccount.avatar
  );
}





