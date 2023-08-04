import 'package:bloc_prac/todos/todo_event.dart';
import 'package:bloc_prac/todos/todo_model.dart';
import 'package:bloc_prac/todos/todo_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoBloc extends Bloc<TodoEvents, TodoState> {
  TodoBloc() : super(const TodoState()) {
        on<AddTodo>(_addTodo);
        on<UpdateTodo>(_updateTodo);
        on<DeleteTodo>(_deleteTodo);
  }

  void _addTodo (AddTodo event, Emitter<TodoState> emit) {
    List<Todo> todoList = [...state.todoList];

    // final currentState = state as

    final Todo newTodo = Todo(
      id: todoList.isEmpty ? 1 : todoList.last.id + 1,
      content: event.content,
      isDone: false
    );

    emit(state.copyWith(
        todoList: [...state.todoList, newTodo],
        status: TodoStatus.todoAdded
    ));

  }

  void _updateTodo (UpdateTodo event, Emitter<TodoState> emit) {
    var todoList = [...state.todoList];
    final newTodos = todoList.map((t) => t.id == event.id ?
    t.copyWith(isDone: !t.isDone): t).toList();

    emit(state.copyWith(todoList: newTodos));
  }

  void _deleteTodo (DeleteTodo event, Emitter<TodoState> emit) {
    var todoList = [...state.todoList];
    todoList.removeWhere((t) => t.id == event.id);

    emit(state.copyWith(
        todoList: todoList,
        status: todoList.isEmpty ? TodoStatus.initial : TodoStatus.todoAdded
    ));
  }
}