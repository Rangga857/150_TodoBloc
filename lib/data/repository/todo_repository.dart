import 'package:counterpage/data/datasource/todo_dao.dart';
import 'package:counterpage/data/model/todo.dart';

class TodoRepository {
  final TodoDao _todoDao = TodoDao();

  Future<int> createTodo(Todo todo){
    return _todoDao.insert(todo); 
  }

  Future<List<Todo>> fetchTodos() async {
    return await _todoDao.getAllTodos();
  }

  Future<int> updateTodo(Todo todo) async {
    return await _todoDao.update(todo);
  }

  Future<int> deleteTodo(int id) async {
    return await _todoDao.delete(id);
  }
}