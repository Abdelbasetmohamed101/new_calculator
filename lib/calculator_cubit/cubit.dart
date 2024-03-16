import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_calculator/calculator_cubit/state.dart';

class CalculatorCubit extends Cubit<CalculatorState> {
  CalculatorCubit() : super(InitialState());
  static CalculatorCubit get(context) => BlocProvider.of(context);
  dynamic value = 0;
  dynamic result = 0;
  int num_1 = 0;
  int num_2 = 0;
  String op = '';
  void Value_Check(value) {
    if (op == '' && value is! String) {
      num_1 = value;
      this.value = value;
      emit(NumberOneState());
    } else if (value is String && value != 'AC') {
      op = value;
      this.value = value;
      emit(OperatorState());
    } else if (op != '' && value is! String) {
      num_2 = value;
      this.value = value;
      emit(NumberTwoState());
    } else if (value == "AC") {
      op = '';
      num_1 = 0;
      num_2 = 0;
      this.value = 0;
      emit(ClearState());
    } else {
      this.value = "error";
      emit(ErrorState());
    }
  }

  void resulting() {
    switch (op) {
      case '+':
        result = num_1 + num_2;
        value = result;
        emit(PlusState());
        break;
      case '-':
        result = num_1 - num_2;
        value = result;
        emit(MinusState());
        break;
      case 'x':
        result = num_1 * num_2;
        value = result;
        emit(MultiplyState());
        break;
      case '/':
        if (num_2 == 0) {
          this.value = "error";
          emit(ErrorState());
        } else {
          result = num_1 / num_2;
          value = result;
        }
        emit(DivState());
        break;
      default:
        value = "error";
        emit(ErrorState());
    }
  }
}
