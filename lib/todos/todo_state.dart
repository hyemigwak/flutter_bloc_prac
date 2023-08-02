import 'package:bloc_prac/todos/todo_model.dart';
import 'package:equatable/equatable.dart';


abstract class TodoState extends Equatable {}

class InitialState extends TodoState {
  InitialState({
    this.todoList = const [],
  });

  List<Todo> todoList = [];

  @override
  List<Object?> get props => [todoList];
}


