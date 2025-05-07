import 'package:bloc/bloc.dart';
import 'package:counterpage/model/todo.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoLoaded(todos: [], selectedDate: null)) {
    on<TodoEventAdd>((event, emit) {
      final currentState = state;
      if (currentState is TodoLoaded) {
        final List<Todo> updateTodos = List.from(currentState.todos);
        updateTodos.add(
          Todo(title: event.title, isCompleted: false, date: event.date),
        );
        emit(
          TodoLoaded(
            todos: updateTodos,
            selectedDate: currentState.selectedDate,
          ),
        );
      }
    });
    on<TodoSelectDate>((event, emit) {
      final currentState = state;
      if (currentState is TodoLoaded) {
        emit(TodoLoaded(todos: currentState.todos, selectedDate: event.date));
      }
    });

  }
}
