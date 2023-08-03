import 'package:equatable/equatable.dart';


class Todo extends Equatable{
  final int id;
  final String content;
  final bool isDone;

  const Todo({
    required this.id,
    required this.content,
    required this.isDone,
  });

  Todo copyWith ({
    int? id,
    String? content,
    bool? isDone,
  }) => Todo(
      id: id ?? this.id,
      content: content ?? this.content,
      isDone: isDone ?? this.isDone
  );

  @override
  List<Object?> get props => [id, content, isDone];

}