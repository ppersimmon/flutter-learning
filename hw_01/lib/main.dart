import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Show My Name',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'My Name App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Person person = Person(firstName: 'John', lastName: 'Doe');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Text('${person.firstName} ${person.lastName}'),
      ),
    );
  }
}

class Person {
  String _firstName;
  String _lastName;

  Person({required String firstName, required String lastName})
      : _firstName = firstName,
        _lastName = lastName;

  String get firstName => _firstName;
  String get lastName => _lastName;

  set firstName(String value) {
    if (value.isNotEmpty) _firstName = value;
  }

  set lastName(String value) {
    if (value.isNotEmpty) _lastName = value;
  }
}
