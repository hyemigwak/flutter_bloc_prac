
abstract class TodoEvents {
  const TodoEvents();
}

class AddTodo extends TodoEvents {
  final String content;
  const AddTodo({required this.content});
}
class UpdateTodo extends TodoEvents {
  final int id;
  const UpdateTodo({required this.id});
}
class DeleteTodo extends TodoEvents {
  final int id;
  const DeleteTodo({required this.id});
}



