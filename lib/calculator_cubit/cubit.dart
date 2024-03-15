import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_calculator/calculator_cubit/state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(InitialState());
}
