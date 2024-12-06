
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/tasks.dart';
import 'package:sqflite/sqflite.dart' as sql;
class TasksController with ChangeNotifier {
  List<Tasks> _tasks = [];

  List<Tasks> get tasks => _tasks;
  Future<sql.Database> initializeDatabase() async {
    return sql.openDatabase('tasks.db',
      version:1,
      onCreate: (db, version) {
        return db.execute(
            """CREATE TABLE tasks(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, title TEXT,category STRING, note TEXT,date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP)""");
      },);}

  Future<void> insertTask(Map<String, dynamic> task) async {
    final db=await initializeDatabase();
    await db.insert('tasks', task, conflictAlgorithm: sql.ConflictAlgorithm.replace);
    getTasks();


  }


  getTasks() async {
    final db = await initializeDatabase();
    final data= await db.query('tasks');
    _tasks=data.map((tasks)=>Tasks.fromJson(tasks)).toList();
    notifyListeners();
  }
deleteTask(int id) async {
    final db=await initializeDatabase();
    await db.delete('tasks', where: 'id = ?', whereArgs: [id]);
  }
  Future<void> updateTask(int id, Map<String, dynamic> updatedTask) async {
    final db = await initializeDatabase();
    await db.update(
      'tasks',
      updatedTask,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
  Future<void> update() async {
    try {
      final db = await initializeDatabase();
      final data = await db.query('tasks');
      _tasks = data.map((task) => Tasks.fromJson(task)).toList();
      notifyListeners();
    } catch (e) {
      print('Error fetching tasks: $e');
    }
  }

}