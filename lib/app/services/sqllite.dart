import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqlLite {
  late Database db;
  static SqlLite? _instance;
  static SqlLite get inst => _instance ??= SqlLite._();

  SqlLite._();

  // ignore: always_declare_return_types
  init() async {
    db = await openDatabase(
      join(await getDatabasesPath(), 'demo_app.db'),
      onCreate: (Database db, int version) {
        return db.execute('CREATE TABLE "options" ("key" VARCHAR(50) NOT NULL, "value" TEXT NULL, "created_at" DATETIME NULL, PRIMARY KEY ("key"))');
      },
      onUpgrade: (Database db, int oldVersion, int newVersion) {
        if (oldVersion < 2) {
          return db.execute('ALTER TABLE "options" ADD COLUMN "created_at" DATETIME NULL').then((value) {
            return db.execute('UPDATE "options" SET "created_at" = ? WHERE "created_at" IS NULL', [DateTime.now().toIso8601String()]);
          });
        }
      },
      version: 2,
    );
  }

  Future saveOption(String key, String value) {
    return db.rawInsert('REPLACE INTO `options` (`key`, `value`, `created_at`) VALUES (?, ?, ?);', [key, value, DateTime.now().toIso8601String()]);
  }

  Future<String?> getOption(String key) async {
    final List<Map<String, dynamic>> list = await db.query('options', columns: ['value'], where: '`key` = ?', whereArgs: [key], limit: 1);
    if (list.isNotEmpty) {
      final firstRow = list.first;
      if (firstRow.isNotEmpty) {
        return firstRow.values.first;
      }
    }
    return null;
  }

  Future<Map<String, String>?> getOptionWithTimestamp(String key) async {
    final List<Map<String, dynamic>> list = await db.query('options', columns: ['value', 'created_at'], where: '`key` = ?', whereArgs: [key], limit: 1);
    if (list.isNotEmpty) {
      final firstRow = list.first;
      if (firstRow.isNotEmpty) {
        return {
          'value': firstRow.values.first,
          'timestamp': firstRow.values.last,
        };
      }
    }
    return null;
  }

  Future<int> removeOption(String key) async {
    return await db.delete('options', where: '`key` = ?', whereArgs: [key]);
  }
}
