import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/dog.dart';
import 'models/babied.dart';

class MyDogApp extends StatelessWidget {
  const MyDogApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // parent widget for FutureProvider
        ChangeNotifierProvider<Dog>(
          create: (context) => Dog(name: 'dog07', breed: 'breed07', age: 3),
        ),
        // childe widget of the ChangeNotifierProvider
        FutureProvider<int>(
          initialData: 0,
          create: (context) {
            final int dogAge = context.read<Dog>().age;
            final babies = Babies(age: dogAge);
            return babies.getBabies();
          },
        ),
        StreamProvider<String>(
          initialData: 'Bark 0 time',
          create: (context) {
            final int dogAge = context.read<Dog>().age;
            final babies = Babies(age: dogAge * 2);
            return babies.bark();
          },
        )
      ],
      child: MaterialApp(
        title: 'Provider 07',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.blue),
        home: const DogHomePage(),
      ),
    );
  }
}

class DogHomePage extends StatefulWidget {
  const DogHomePage({Key? key}) : super(key: key);

  @override
  State<DogHomePage> createState() => _DogHomePageState();
}

class _DogHomePageState extends State<DogHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Provider 07')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '- name: ${context.watch<Dog>().name}',
              style: const TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 10.0),
            const BreedAndAge(),
          ],
        ),
      ),
    );
  }
}

class BreedAndAge extends StatelessWidget {
  const BreedAndAge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '- breed: ${context.select<Dog, String>((Dog dog) => dog.breed)}',
          style: const TextStyle(fontSize: 20.0),
        ),
        const SizedBox(height: 10.0),
        const Age(),
      ],
    );
  }
}

class Age extends StatelessWidget {
  const Age({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '- age: ${context.select<Dog, int>((Dog dog) => dog.age)}',
          style: const TextStyle(fontSize: 20.0),
        ),
        const SizedBox(height: 10.0),
        Text(
          '- number of babies: ${context.watch<int>()}',
          style: const TextStyle(fontSize: 20.0),
        ),
        const SizedBox(height: 10.0),
        Text(
          '- ${context.watch<String>()}',
          style: const TextStyle(fontSize: 20.0),
        ),
        const SizedBox(height: 20.0),
        ElevatedButton(
          onPressed: () => context.read<Dog>().grow(),
          child: const Text(
            'Grow',
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ],
    );
  }
}
