import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

// database table and column names
final String tableTasks = 'Tasks';
final String columnId = 'id';
final String columnTitle = 'title';
final String columnPriority = 'priority';
final String columnDueDate = 'dueDate';

// data model class
class Task {

  int id;
  String title;
  int priority;
  String dueDate;

  Task();

  // convenience constructor to create a Task object
  Task.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    title = map[columnTitle];
    priority = map[columnPriority];
    dueDate = map[columnDueDate];
  }

  // convenience method to create a Map from this Task object
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnTitle: title,
      columnPriority: priority,
      columnDueDate: dueDate
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }
}

// singleton class to manage the database
class DatabaseHelper {

  // This is the actual database filename that is saved in the docs directory.
  static final _databaseName = "dosuallyDatabase.db";
  // Increment this version when you need to change the schema.
  static final _databaseVersion = 1;

  // Make this a singleton class.
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // Only allow a single open connection to the database.
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  // open the database
  _initDatabase() async {
    // The path_provider plugin gets the right directory for Android or iOS.
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    // Open the database. Can also add an onUpdate callback parameter.
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate);
  }

  // SQL string to create the database
  Future _onCreate(Database db, int version) async {
    await db.execute('''
              CREATE TABLE $tableTasks (
                $columnId INTEGER PRIMARY KEY,
                $columnTitle TEXT NOT NULL,
                $columnPriority INTEGER NOT NULL,
                $columnDueDate TEXT NOT NULL
              )
              ''');
  }

  // Database helper methods:

  Future<int> insert(Task task) async {
    Database db = await database;
    int id = await db.insert(tableTasks, task.toMap());
    return id;
  }

  Future<Task> queryTask(int id) async {
    Database db = await database;
    List<Map> maps = await db.query(tableTasks,
        columns: [columnId, columnTitle, columnPriority, columnDueDate],
        where: '$columnId = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return Task.fromMap(maps.first);
    }
    return null;
  }


  Future<List> queryAllTasks() async{
    Database db = await database;
    List<Map> map = await db.query(tableTasks,
    columns: [columnId, columnTitle, columnPriority, columnDueDate]);
    List<Task> tasks = List();
    for (var value in map) {
     tasks.add(Task.fromMap(value));
    }
    return tasks;
  }

  void deleteTask(int index) async{
    Database db = await database;
    db.rawDelete('DELETE FROM Tasks WHERE id = $index');
  }

// TODO: delete(int id)
// TODO: update(Task task)
}