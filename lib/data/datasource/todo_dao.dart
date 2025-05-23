import 'package:counterpage/data/datasource/database_helper.dart';
import 'package:counterpage/data/model/todo.dart';

class TodoDao {
  final dbProvider = DatabaseHelper();

  Future<int> insert(Todo todo) async {
    final db = await dbProvider.database;
    return await db.insert('todos', todo.toMap());
  }

  Future<List<Todo>> getAllTodos() async {
    final db = await dbProvider.database;
    final result = await db.query('todo', orderBy: 'date DESC');
    final rows = await db.query('todo');

    // log add data
    rows.forEach((row) => print(row));
    return result.map((e) => Todo.fromMap(e)).toList();
  }

  Future<int> update(Todo todo) async {
    final db = await dbProvider.database;
    return await db.update(
      'todo',
      todo.toMap(),
      where: 'id = ?',
      whereArgs: [todo.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await dbProvider.database;
    return await db.delete(
      'todo',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

}