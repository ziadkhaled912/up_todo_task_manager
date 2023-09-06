import 'package:flutter/foundation.dart' show immutable;

@immutable
class DatabaseConstants {
  const DatabaseConstants._();

  static const String databaseName = "task_database";
  static const String taskTable = "task";
}