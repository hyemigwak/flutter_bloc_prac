import 'package:bloc_prac/todos/todo_event.dart';
import 'package:bloc_prac/todos/todo_model.dart';
import 'package:bloc_prac/todos/todo_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoBloc extends Bloc<TodoEvents, TodoState> {
  TodoBloc() : super(TodoState()) {
        on<AddTodo>(_addTodo);
        on<UpdateTodo>(_updateTodo);
        on<DeleteTodo>(_deleteTodo);
  }

  void _addTodo (AddTodo event, Emitter<TodoState> emit) {
    var _todoList = [...state.todoList];

    final newTodo = Todo(
      id: _todoList.isEmpty ? 1 : _todoList.last.id + 1,
      content: event.content,
      isDone: false
    );
    _todoList.add(newTodo);

    emit(state.copyWith(
        todoList: _todoList,
        status: TodoStatus.todoAdded
    ));

  }

  void _updateTodo (UpdateTodo event, Emitter<TodoState> emit) {
    var _todoList = [...state.todoList];
    final newTodos = _todoList.map((t) => t.id == event.id ?
    t.copyWith(isDone: !t.isDone): t).toList();

    emit(state.copyWith(todoList: newTodos));
  }

  void _deleteTodo (DeleteTodo event, Emitter<TodoState> emit) {
    var _todoList = [...state.todoList];
    _todoList.removeWhere((t) => t.id == event.id);

    emit(state.copyWith(
        todoList: _todoList,
        status: _todoList.isEmpty ? TodoStatus.initial : TodoStatus.todoAdded
    ));
  }
}