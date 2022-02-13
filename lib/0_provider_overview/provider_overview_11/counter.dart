import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'count_notifier.dart';

class MyCounterApp extends StatelessWidget {
  const MyCounterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
      home: const CounterHomePage(),
    );
  }
}

class CounterHomePage extends StatelessWidget {
  const CounterHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ChangeNotifierProvider<Counter>(
          create: (_) => Counter(),
          child: Builder(
            builder: (context) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${context.watch<Counter>().counter}',
                    style: const TextStyle(
                      fontSize: 50.0,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    child: const Text(
                      'Increment',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    onPressed: () {
                      context.read<Counter>().increment();
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
