import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/dog.dart';

class MyDogApp extends StatelessWidget {
  const MyDogApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Dog>(
      create: (context) => Dog(name: 'dog10', breed: 'breed10', age: 3),
      child: MaterialApp(
        title: 'Provider 10',
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
      appBar: AppBar(title: const Text('Provider 10')),
      body: Selector<Dog, String>(
        selector: (BuildContext contex, Dog dog) => dog.name,
        builder: (BuildContext context, String name, Widget? child) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                child!,
                const SizedBox(height: 10.0),
                Text(
                  '- name: $name',
                  style: const TextStyle(fontSize: 20.0),
                ),
                const SizedBox(height: 10.0),
                const BreedAndAge(),
              ],
            ),
          );
        },
        child: const Text(
          'I like dogs very much',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}

class BreedAndAge extends StatelessWidget {
  const BreedAndAge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<Dog, String>(
      selector: (BuildContext context, Dog dog) => dog.breed,
      builder: (_, String breed, __) {
        return Column(
          children: [
            Text(
              '- breed: $breed',
              style: const TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 10.0),
            const Age(),
          ],
        );
      },
    );
  }
}

class Age extends StatelessWidget {
  const Age({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<Dog, int>(
      selector: (BuildContext context, Dog dog) => dog.age,
      builder: (_, int age, __) {
        return Column(
          children: [
            Text(
              '- age: $age',
              style: const TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.read<Dog>().grow(),
              child: const Text(
                'Grow',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ],
        );
      },
    );
  }
}
