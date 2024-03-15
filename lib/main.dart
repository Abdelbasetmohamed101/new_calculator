import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_calculator/calculator_cubit/cubit.dart';
import 'package:new_calculator/calculator_cubit/state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CalculatorCubit(),
      child: MaterialApp(
        title: 'test_1',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 0, 23, 198)),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Calculator'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CalculatorCubit, CalculatorState>(
      listener: (context, state) {},
      builder: (context, state) {
        var calculator = CalculatorCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(title),
          ),
          body: Center(
              child: Column(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.bottomRight,
                  padding: const EdgeInsets.all(16.0),
                  child: Text('${calculator.value}'),
                ),
              ),
              const Divider(height: 1.0),
              Row(
                children: [
                  buildButton('7', onPressed: () {
                    calculator.Value_Check(7);
                  }),
                  buildButton('8', onPressed: () {
                    calculator.Value_Check(8);
                  }),
                  buildButton('9', onPressed: () {
                    calculator.Value_Check(9);
                  }),
                  buildButton('/', onPressed: () {
                    calculator.Value_Check('/');
                  }),
                ],
              ),
              Row(
                children: [
                  buildButton('4', onPressed: () {
                    calculator.Value_Check(4);
                  }),
                  buildButton('5', onPressed: () {
                    calculator.Value_Check(5);
                  }),
                  buildButton('6', onPressed: () {
                    calculator.Value_Check(6);
                  }),
                  buildButton('x', onPressed: () {
                    calculator.Value_Check('x');
                  }),
                ],
              ),
              Row(
                children: [
                  buildButton('1', onPressed: () {
                    calculator.Value_Check(1);
                  }),
                  buildButton('2', onPressed: () {
                    calculator.Value_Check(2);
                  }),
                  buildButton('3', onPressed: () {
                    calculator.Value_Check(3);
                  }),
                  buildButton('-',
                      onPressed: () => calculator.Value_Check('-')),
                ],
              ),
              Row(
                children: [
                  buildButton('0', onPressed: () => calculator.Value_Check(0)),
                  buildButton('AC', onPressed: () {
                    calculator.Value_Check('AC');
                  }),
                  buildButton('=', onPressed: () {
                    calculator.resulting();
                  }),
                  buildButton('+', onPressed: () {
                    calculator.Value_Check('+');
                  }),
                ],
              ),
            ],
          )),
        );
      },
    );
  }

  Widget buildButton(String buttonText, {required VoidCallback onPressed}) {
    return Expanded(
      child: MaterialButton(
        onPressed: () {
          onPressed();
        },
        child: Text(
          buttonText,
          style: const TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
