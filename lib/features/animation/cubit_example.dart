import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samplestore/features/animation/counter_cubit.dart';

class CubitExample extends StatefulWidget {
  const CubitExample({super.key});

  @override
  State<CubitExample> createState() => _CubitExampleState();
}

class _CubitExampleState extends State<CubitExample> {
  @override
  Widget build(BuildContext context) {
    final CounterCubit counterCubit = BlocProvider.of<CounterCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Cubit Example"),
      ),
      body: BlocBuilder<CounterCubit, int>(builder: (context, state) {
        return Center(
          child: Text(state.toString()),
        );
      }),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              counterCubit.increment();
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              counterCubit.decrement();
            },
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
