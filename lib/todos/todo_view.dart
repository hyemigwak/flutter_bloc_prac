import 'package:bloc_prac/todos/todo_bloc.dart';
import 'package:bloc_prac/todos/todo_model.dart';
import 'package:bloc_prac/todos/todo_state.dart';
import 'package:bloc_prac/todos/widgets/todo_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoListView extends StatefulWidget {
  const TodoListView({super.key});

  @override
  State<TodoListView> createState() => _TodoListView();
}

class _TodoListView extends State<TodoListView> {

  // List<Todo> todoList = [
  //   Todo(id: 0, content: 'bloc todoList 만들기', isDone: true),
  //   Todo(id: 1, content: 'ios 프로비저닝 설정 다시하기', isDone: false),
  //   Todo(id: 2, content: '피그마 로직 체크하기', isDone: false),
  // ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          return Container(
            color: Colors.deepPurple,
            child: Column(
                children: [
                  const SizedBox(height: 10.0),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.,
                      itemBuilder: (BuildContext context, int idx) {
                        return TodoCard(
                          todo: state.todoList[idx],
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 15)),
                      ),
                      onPressed: () {
                        _addTodoDialog(context);
                      },
                      child: const Text('할 일 추가하기 💛',
                          style: TextStyle(
                            fontSize: 20,
                          )
                      ),
                    ),
                  ),
                  const SizedBox(height: 10)
                ]
            ),

          );
        }
    );
  }
}

void _addTodoDialog(BuildContext context) {
  final textFieldController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
          title: const Text('다 놀았으면 할 일을 하자'),
          content: TextField(
            onChanged: (value) {},
            controller: textFieldController,
            decoration: const InputDecoration(hintText: "할게많구나..."),
          ),
          actions: [
            ElevatedButton(
              child: const Text('등로옥🎀'),
              onPressed: () => Navigator.pop(context, textFieldController.text),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffECE8E7),
                foregroundColor: Colors.black.withOpacity(0.4),
              ),
              child: const Text('닫기'),
              onPressed: () => Navigator.pop(context),
            ),
          ]
      );
    },
  );
}