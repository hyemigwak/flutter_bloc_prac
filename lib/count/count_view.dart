import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_event.dart';


class CounterView extends StatefulWidget {
  @override
  _CounterView createState() => _CounterView();
}

class _CounterView extends State<CounterView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, int>(
        builder: (context, count) {
          return Center(
            child: Column(
              children: [
                Text('$count',
                    style: Theme.of(context).textTheme.displayLarge),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                  ),
                  onPressed: (){
                    context.read<CounterBloc>().add(CounterIncrementPressed());
                  },
                  child: const Text('더하기',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    )
                  )
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white38,
                    ),
                    onPressed: (){
                      context.read<CounterBloc>().add(CounterDecrementPressed());
                    },
                    child: const Text('빼기',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      )
                    )
                )
              ]
            ),
          );
        }
      );
  }
}