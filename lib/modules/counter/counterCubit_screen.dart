import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_apps/shared/Bloc/counter_bloc/counterCubit.dart';
import '../../shared/Bloc/counter_bloc/counterStates.dart';

class CounterCubitScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: BlocConsumer<CounterCubit,CounterState>(
        listener: (context, state)
        {
          if (state is CounterPlusState)
            {
              //print('Plus state ${state.counter}');
            }
          if (state is CounterMinusState)
          {
            //print('Minus state ${state.counter}');
          }
        },
        builder: (context,state){
          return Scaffold(
            appBar: AppBar(
              title: const Text('Counter App'),
            ),
            body: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(onPressed: () {
                      CounterCubit.get(context).plus();
                    },
                      child: const Icon(
                        Icons.add,
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    FloatingActionButton(onPressed: () {

                      CounterCubit.get(context).minus();
                    },
                      child: const Icon(
                        Icons.minimize,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Text(
                  '${CounterCubit.get(context).counter}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 50.0,
                  ),
                ),
              ],
            ),

          );
        },

      ),
    );
  }
}
