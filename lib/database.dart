import 'dart:async';
import 'package:dota_stats/models/playerInfo.dart';
import 'models/gameModes.dart';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:dota_stats/models/item.dart';
import 'models/role.dart';

class DatabaseHelper {
  static final _databaseName = "All_In_One_Dota2_v4";
  static final _databaseVersion = 2;
  //static final _gameVersion

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
    String path = join(dataBaseDirectory, _databaseName,);
    return await openDatabase(path, version: _databaseVersion,
        onCreate: (db, version) async {
          await db.execute(
            "CREATE TABLE savedProfiles(id INTEGER PRIMARY KEY, name TEXT, avatar TEXT)",
          );
          await db.execute(
            "CREATE TABLE itemList(id INTEGER PRIMARY KEY, name TEXT, image TEXT)",
          );
          await db.execute(
            "CREATE TABLE gameModeList(id INTEGER PRIMARY KEY, name TEXT, langKey TEXT)",
          );
          await db.execute(
            "CREATE TABLE roleList(id INTEGER PRIMARY KEY, name TEXT, langKey TEXT)",
          );
        });
  }

  Future close() async => DatabaseHelper.instance.close();

  Future<bool> isSaved(int id) async {
    final Database db = await DatabaseHelper.instance.database;
    var response =
    await db.query("savedProfiles", where: "id = ?", whereArgs: [id]);
    return response.isEmpty ? false : true;
  }

  Future<void> insertPlayer(DBPlayer player) async {
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
    final Database db = await DatabaseHelper.instance.database;
    final List<Map<String, dynamic>> maps = await db.query('savedProfiles');

    return List.generate(maps.length, (i) {
      return DBPlayer(
        id: maps[i]['id'],
        name: maps[i]['name'],
        avatar: maps[i]['avatar'],
      );
    });
  }

  Future<void> fillItemTable(List<DBItem> items) async {
    final Database db = await DatabaseHelper.instance.database;
    items.forEach((item) async =>
    {
      await db.insert(
        'itemList',
        item.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      )
    });
  }

  Future<List<DBItem>> itemList() async {
    final Database db = await DatabaseHelper.instance.database;
    final List<Map<String, dynamic>> maps = await db.query('itemList');

    // Convert the List
    return List.generate(maps.length, (i) {
      return DBItem(
        id: maps[i]['id'],
        name: maps[i]['name'],
        image: maps[i]['image'],
      );
    });
  }

  Future<String> getImageUrl(int itemId) async {
    final Database db = await DatabaseHelper.instance.database;
      final List<Map<String, dynamic>> maps = await db.query(
        "itemList",
        where: "id = ?",
        whereArgs: [itemId],
      );
    return maps[0]['image'];
    }

  Future<void> fillGameModeTable(List<GameMode> modes) async {
    final Database db = await DatabaseHelper.instance.database;
    modes.forEach((mode) =>
    {
      db.insert(
        'gameModeList',
        mode.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      )
    });
  }

  Future<List<GameMode>> getGameModeList() async {
    final Database db = await DatabaseHelper.instance.database;
    final List<Map<String, dynamic>> maps = await db.query('gameModeList');
    return List.generate(maps.length, (i) {
      return GameMode(
        id: maps[i]['id'],
        name: maps[i]['name'],
        langKey: maps[i]['langKey'],
      );
    });
  }

  Future<List<Role>> getRoleList() async {
    final Database db = await DatabaseHelper.instance.database;
    final List<Map<String, dynamic>> maps = await db.query('roleList');
    return List.generate(maps.length, (i) {
      return Role(
        id: maps[i]['id'],
        name: maps[i]['name'],
        langKey: maps[i]['langKey'],
      );
    });
  }


  Future<String> getGameModeName(int id) async {
    final Database db = await DatabaseHelper.instance.database;
    final List<Map<String, dynamic>> maps = await db.query(
      "gameModeList",
      where: "id = ?",
      whereArgs: [id],
    );
    await DatabaseHelper.instance.close();
    return maps[0]['name'];
  }

  Future<void> fillRoleTable(List<Role> roles) async {
    final Database db = await DatabaseHelper.instance.database;
    roles.forEach((role) =>
    {
      db.insert(
        'roleList',
        role.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      )
    });
  }

  Future<String> getRoleName(int id) async {
    final Database db = await DatabaseHelper.instance.database;
    final List<Map<String, dynamic>> maps = await db.query(
      "roleList",
      where: "id = ?",
      whereArgs: [id],
    );
    await DatabaseHelper.instance.close();
    return maps[0]['name'];
  }
}

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

  factory DBPlayer.fromAPI(PlayerInfo player) => DBPlayer(
      id: player.details.steamAccount.id,
      name: player.details.steamAccount.name,
      avatar: player.details.steamAccount.avatar);
}

class DBItem {
  final int id;
  final String name;
  final String image;
  DBItem({this.id, this.name, this.image});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
    };
  }

  factory DBItem.fromAPI(Item item) =>
      DBItem(id: item.id, name: item.name, image: item.image);
}
