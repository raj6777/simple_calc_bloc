import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/screen_bloc.dart';
import 'events/screen_events.dart';
import 'states/screen_states.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ScreenBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final firstValue = TextEditingController();
  final secondValue = TextEditingController();
  final resultValue = TextEditingController(); // Third TextEditingController



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: firstValue,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp("[0-9]")),
              ],
              decoration: const InputDecoration(
                labelText: "Enter First Value",
                hintText: "First Value",
              ),
            ),
            TextField(
              controller: secondValue,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp("[0-9]")),
              ],
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Enter Second Value",
                hintText: "Second Value",
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: const Text("+"),
                  onPressed: () {
                    double first = double.tryParse(firstValue.text) ?? 0;
                    double second = double.tryParse(secondValue.text) ?? 0;
                    context.read<ScreenBloc>().add(AddEvents(firstValue: first, secondValue: second));
                  },
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  child: const Text("-"),
                  onPressed: () {
                    double first = double.tryParse(firstValue.text) ?? 0;
                    double second = double.tryParse(secondValue.text) ?? 0;
                    context.read<ScreenBloc>().add(SubtractEvents(firstValue: first, secondValue: second));
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: const Text("*"),
                  onPressed: () {
                    double first = double.tryParse(firstValue.text) ?? 0;
                    double second = double.tryParse(secondValue.text) ?? 0;
                    context.read<ScreenBloc>().add(MultiplyEvents(firstValue: first, secondValue: second));
                  },
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  child: const Text("/"),
                  onPressed: () {
                    double first = double.tryParse(firstValue.text) ?? 0;
                    double second = double.tryParse(secondValue.text) ?? 0;
                    context.read<ScreenBloc>().add(DivideEvents(firstValue: first, secondValue: second));
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextField(
              controller: resultValue,  // Third text field for result
              readOnly: true,            // Make it read-only
              decoration: const InputDecoration(
                labelText: "Result",
                hintText: "Result will be displayed here",
              ),
            ),
            const SizedBox(height: 20),
            BlocConsumer<ScreenBloc, ScreenStates>(
              listener: (context, state) {
                if (state is ResultState) {
                  // Update the result text field with the result
                  resultValue.text = state.result.toString();
                } else if (state is ErrorState) {
                  resultValue.text = state.message;
                  /*   ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error: ${state.message}')),
                  );*/
                }
              },
              builder: (context, state) {
                if (state is ResultState) {
                  return Text('Result: ${state.result}', style: const TextStyle(fontSize: 24));
                } else if (state is ErrorState) {
                  return Text('Error: ${state.message}', style: const TextStyle(color: Colors.red));
                }
                return const SizedBox.shrink(); // Placeholder if no result yet
              },
            ),
          ],
        ),
      ),
    );
  }
}
