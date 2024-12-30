import 'package:flutter/material.dart';


class SecondPartExample {
  void executeExample(int number) {
    switch (number) {
      case 1:
        runApp(MyNote());
        break;
      default:
    }
  }
}

class Note extends StatelessWidget {
  final Color color;
  final double width;
  final double height;
  
  const Note({super.key, required this.color, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: width,
      height: height,
    );
  }
}

// example 1
class MyNote extends StatelessWidget {
  const MyNote({super.key});

  @override
    Widget build(BuildContext context) {
      return MaterialApp(
        title: 'My Note',
        home: MyHomePage(),
      );
    }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  
  @override
    State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Note> notes = [
    Note(color: Colors.red, width: 200, height: 200),
    Note(color: Colors.green, width: 200, height: 200),
    Note(color: Colors.blue, width: 200, height: 200),
  ];

  void roundRobin() {
    setState(() {
      notes.add(notes.removeAt(0));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: notes,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: roundRobin,
        tooltip: 'round robin',
        child: Icon(Icons.swap_vert),
      ),
    );
  }
}
