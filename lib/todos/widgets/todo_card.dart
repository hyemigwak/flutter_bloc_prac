import 'package:bloc_prac/todos/todo_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({super.key, required this.todo});

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 10.0),
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.7),
            borderRadius: BorderRadius.circular(6),
          ),
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            width: double.infinity,
            child: CheckboxListTile(
              title: Text('📌 ${todo.content}',
                  style: const TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  )),
              value: todo.isDone,
              onChanged: (bool? value) {
                if (kDebugMode) {
                  print('====value! $value');
                }
              },
              secondary: Icon(
                  Icons.delete,
                  color: Colors.deepPurple.withOpacity(0.6),
                  size: 18,
              ),
            ),
          ),
      ),
    );
  }
}