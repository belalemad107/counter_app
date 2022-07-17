import 'package:counter_app/cubit/cubit.dart';
import 'package:counter_app/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => CounterCubit(),
        child: BlocConsumer<CounterCubit, CounterStates>(
          listener: (context, state) {
            if (state is CounterInitialStates) {
              debugPrint('CounterInitialStates');
            }
            if (state is CounterPlusStates) {
              debugPrint('CounterPlusStates');
            }
            if (state is CounterMinusStates) {
              debugPrint('CounterMinusStates');
            }
          },
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          CounterCubit.get(context).minus();
                        });
                      },
                      child: Icon(Icons.minimize),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      '${CounterCubit.get(context).counter}',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          CounterCubit.get(context).plus();
                        });
                      },
                      child: Icon(Icons.add),
                    )
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
