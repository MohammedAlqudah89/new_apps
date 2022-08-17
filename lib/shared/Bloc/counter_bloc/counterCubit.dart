
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_apps/shared/Bloc/counter_bloc/counterStates.dart';

class CounterCubit extends Cubit<CounterState>
{
 // CounterCubit(super.CounterInitialState);
  CounterCubit():super(CounterInitialState());
  int counter=0;

  static CounterCubit get (context) => BlocProvider.of(context);

  void plus ()
  {
    counter ++;
    emit(CounterPlusState(counter));
  }

  void minus()
  {
    counter --;
    emit(CounterMinusState(counter));
  }

}
