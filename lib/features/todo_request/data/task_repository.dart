import 'package:path/path.dart';
import 'package:quran_app/core/constants/database_constants.dart';
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
        /// TODO: To be continued
      },
    );
    return database;
  }


}
