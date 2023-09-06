import 'package:path/path.dart';
import 'package:quran_app/core/constants/database_constants.dart';
import 'package:quran_app/features/todo_list/models/task_model.dart';
import 'package:sqflite/sqflite.dart';

class TaskRepository {
  TaskRepository._();

  static final TaskRepository _instance = TaskRepository._();

  factory TaskRepository() {
    return _instance;
  }


  Database? _database;

  Future<Database> get database async {
    if(_database != null) _database;
    _database = await _initDb();
    return _database!;
  }

  Future<Database> _initDb() async {
    final database = await openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      join(await getDatabasesPath(), '${DatabaseConstants.databaseName}.db'),
      version: 1,
      onCreate: (database, version) {
        database.execute(
            "CREATE TABLE ${DatabaseConstants.taskTable}(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, title TEXT, description TEXT, priority INTEGER, taskTime TEXT)"
        );
      },
      onOpen: (database) async {
        // print("table is deleted");
      }
    );
    return database;
  }


  Future<bool> insertTask(Task task) async {
    try {
      print("task is being added");
      final db = await database;
      // await databaseFactory.deleteDatabase(join(await getDatabasesPath(), '${DatabaseConstants.databaseName}.db'));

      await db.insert(
        DatabaseConstants.taskTable,
        task.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      print("task is added successfully");
      return true;
    } catch (error) {
      print("Error while adding task ${error.toString()}");
      return false;
    }
  }

  Future<List<Task>> getAllTasks() async {
    try {
      print("getting tasks is being added");
      final db = await database;
      final result = await db.query(DatabaseConstants.taskTable);
      final tasksList = result.map((item) => Task.fromMap(item)).toList();
      print("tasks have retrieved $tasksList");
      return tasksList;
    } catch (error) {
      print("Error while retrieving tasks ${error.toString()}");
      return [];
    }
  }
}
