import 'package:flutter/material.dart';
import '0_provider_overview/counter.dart';
import '1_todo_app/views/home_page.dart';

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
      home: const MyCounterApp(),
      //home: const HomePage(),
    );
  }
}
