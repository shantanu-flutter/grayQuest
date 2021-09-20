import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test_app/Database/TablesColumnFile.dart';
import 'package:test_app/Model/UserModel.dart';

class AppDatabase {
  static final AppDatabase _appDatabase =
      new AppDatabase._internal(); //Creating Singelton Object
  AppDatabase._internal();
  static AppDatabase get() {
    return _appDatabase;
  }

  Database _database; //Database instance

  static bool didInit = false;
  Future<Database> getDb() async {
    //Get Database instance
    if (!didInit) await _init();
    return _database;
  }

  //generate Databse if no already initialized
  Future generateDatabase() async {
    if (!didInit) await _init();
  }

  Future _init() async {
    Directory documentsDirectory =
        await getApplicationDocumentsDirectory(); //Get Directory instance
    String path =
        join(documentsDirectory.path, "testapp.db"); //Path for database file
    _database = await openDatabase(path, version: 01,
        onCreate: (Database db, int version) async {
      await _createUserMaster(db);
      await _createAddressMaster(db);

      await _createRandomInsert(db);
    }, onUpgrade: (Database db, int oldVersion, int newVersion) async {});
    didInit = true; //update didiinit
  }

//User Master Create
  Future _createUserMaster(Database db) {
    String createTableQuery = "CREATE TABLE ${TablesColumnFile.userProfile}  ("
        " ${TablesColumnFile.userId} INTEGER  ,"
        " ${TablesColumnFile.password} TEXT,"
        " ${TablesColumnFile.name} TEXT,"
        " ${TablesColumnFile.email} TEXT PRIMARY KEY ,"
        " ${TablesColumnFile.website} TEXT,"
        " ${TablesColumnFile.company} TEXT"
        " ) ;";
    print(createTableQuery);
    return db.transaction((Transaction txn) {
      return txn.execute(createTableQuery);
    });
  }

//Address Table create
  Future _createAddressMaster(Database db) {
    String createTableQuery = "CREATE TABLE ${TablesColumnFile.userAddress}  ("
        " ${TablesColumnFile.userId} INTEGER PRIMARY KEY ,"
        " ${TablesColumnFile.password} TEXT,"
        " ${TablesColumnFile.name} TEXT,"
        " ${TablesColumnFile.email} TEXT,"
        " ${TablesColumnFile.website} TEXT,"
        " ${TablesColumnFile.company} DATETIME "
        " ) ;";

    print(createTableQuery);
    return db.transaction((Transaction txn) {
      return txn.execute(createTableQuery);
    });
  }

  //Get User from specifc ID
  Future<User> getUserWithId(String userId) async {
    print("Trying to get response");
    var db = await getDb();
    print(userId);
    var response = await db.query(TablesColumnFile.userProfile,
        where: "${TablesColumnFile.email} = ?", whereArgs: [userId]);
    print(response);
    return response.isNotEmpty ? User.fromMap(response.first) : null;
  }

  //Creating a dummy insert for login
  Future _createRandomInsert(Database db) async {
    User user = new User(
        email: "username",
        password: "username",
        name: "username",
        userId: 1,
        website: "etc@Grey.com",
        company: "Gray Quest");
    print("Creating Insert");
    await db.insert(
      TablesColumnFile.userProfile,
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
