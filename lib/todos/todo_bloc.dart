import 'package:bloc_prac/todos/todo_event.dart';
import 'package:bloc_prac/todos/todo_model.dart';
import 'package:bloc_prac/todos/todo_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoBloc extends Bloc<TodoEvents, TodoState> {
  TodoBloc() : super(InitialState(todoList: [])) {
        on<AddTodo>(_addTodo);
        on<GetTodos>(_getTodos);
        on<UpdateTodo>(_updateTodo);
        on<DeleteTodo>(_deleteTodo);
  }


  void _getTodos (GetTodos event, Emitter<TodoState> emit) {

  }


  void _addTodo (AddTodo event, Emitter<TodoState> emit) {
    print('event!!! $event');
    // emit(state.copyWith(
    //
    // ))
  }


  void _updateTodo (UpdateTodo event, Emitter<TodoState> emit) {

  }

  void _deleteTodo (DeleteTodo event, Emitter<TodoState> emit) {

  }
}