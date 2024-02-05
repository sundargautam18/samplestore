import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samplestore/features/animation/cart_cubit.dart';
import 'package:samplestore/features/animation/counter_cubit.dart';

class CubitExample extends StatefulWidget {
  const CubitExample({super.key});

  @override
  State<CubitExample> createState() => _CubitExampleState();
}

class _CubitExampleState extends State<CubitExample> {
  @override
  Widget build(BuildContext context) {
    final CartCubit counterCubit = BlocProvider.of<CartCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Cubit cart example"),
      ),
      body: BlocBuilder<CartCubit, List<CartItem>>(builder: (context, state) {
        return Column(children: [
          ...state
              .map((e) => Row(
                    children: [
                      Text(e.name),
                      10.horizontalSpace,
                      Text(e.quantity.toString()),
                    ],
                  ))
              .toList(),
        ]);
      }),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              counterCubit
                  .addToCart(CartItem(name: "test2", quantity: 1, price: 200));
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              counterCubit.removeFromCart(
                  CartItem(name: "test", quantity: 1, price: 200));
            },
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
