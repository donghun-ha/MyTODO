import 'package:flutter_to_do_app/models/task.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHandler {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'task.db'),
      onCreate: (db, version) async {
        await db.execute("""
            CREATE TABLE task (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              title TEXT,
              note TEXT,
              date TEXT,
              startTime TEXT,
              endTime TEXT,
              remind INTEGER,
              repeat TEXT,
              color INTEGER,
              isCompleted INTEGER
            );
          """);
      },
      version: 1,
    );
  }

  // insertTask작성
  Future<int> insertTask(Task task) async {
    final Database db = await initializeDB();
    return await db.rawInsert("""
INSERT INTO task (id, title, note, date, startTime, endTime, remind, repeat, color, isCompleted)
VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
""", [
      task.id,
      task.title,
      task.note,
      task.date,
      task.startTime,
      task.endTime,
      task.remind,
      task.repeat,
      task.color,
      task.isCompleted,
    ]);
  }

  // queryTask 불러오기
  Future<List<Task>> queryTask() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult =
        await db.rawQuery('SELECT * FROM task');
    return queryResult.map((e) => Task.fromMap(e)).toList();
  }

  // deleteTask: Slidable을 이용한 리스트 삭제
  Future<int> deleteTask(int id) async {
    final Database db = await initializeDB();
    return await db.rawDelete("""
        DELETE FROM task WHERE id = ?
      """, [id]);
  }

  // updateTask 수정
  Future<int> updateCompletedTask(int id) async {
    final Database db = await initializeDB();
    return await db.rawUpdate(
      """
        UPDATE task SET isCompleted = ? where id = ?
      """,
      [1, id],
    );
  }
}// End
