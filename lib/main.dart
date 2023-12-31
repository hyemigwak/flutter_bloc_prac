import 'package:bloc_prac/todos/todo_bloc.dart';
import 'package:bloc_prac/todos/todo_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'count/count_view.dart';
import 'count/counter_event.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TodoBloc>(
      create: (BuildContext context) => TodoBloc(),
      child: MaterialApp(
        title: 'bloc prac',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
          backgroundColor: Colors.deepPurple,
          appBar: AppBar(
            title: const Text('Amy Dev TodoList 🐣',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            )
          ),
          body: const TodoListView(),
        ),
      ),
    );
  }
}


class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('카운터 예제')),
      body: CounterView(),
    );
  }
}
