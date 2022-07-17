import 'package:counter_app/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class CounterCubit extends Cubit<CounterStates>{
// CounterCubit() : super(CounterInitialStates());
// }
class CounterCubit extends Cubit<CounterStates> {
  CounterCubit() : super(CounterInitialStates());
  static CounterCubit get(context) => BlocProvider.of<CounterCubit>(context);
  int counter = 1;
  void plus() {
    emit(CounterPlusStates());
    counter++;
    debugPrint('$counter');
  }

  void minus() {
    emit(CounterMinusStates());
    counter--;
    debugPrint('$counter');
  }
}
