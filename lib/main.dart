import 'package:flutter/material.dart';

import 'routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Provider Tutorial',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: const MyCounterApp(),
      //home: const MyDogApp(),
      //home: const MyConsumer()
      home: const MyDogApp(), //selector
      //home: const HomePage(),
    );
  }
}
