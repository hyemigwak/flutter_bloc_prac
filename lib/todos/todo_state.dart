import 'package:bloc_prac/todos/todo_model.dart';
import 'package:equatable/equatable.dart';

enum TodoStatus {
  initial,
  todoAdded,
}

class TodoState extends Equatable {
  const TodoState({
    this.status = TodoStatus.initial,
    this.todoList = const [],
  });

  final TodoStatus status;
  final List<Todo> todoList;

  TodoState copyWith ({
    TodoStatus? status,
    List<Todo>? todoList,
  }) => TodoState(
    status: status ?? this.status,
    todoList: todoList ?? this.todoList
  );

  @override
  List<Object?> get props => [status, todoList];
}