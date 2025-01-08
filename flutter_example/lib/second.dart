import 'package:flutter/material.dart';


class SecondPartExample {
  void executeExample(int number) {
    switch (number) {
      case 1:
        runApp(MyNote());
        break;
      case 2:
        break;
      default:
    }
  }
}

// example 2

// class Note2 extends StatefulWidget {
//   final Color color;
//   final double width;
//   final double height;
// 
//   const Note2({Key? key, required this.color, required this.width, required this.height}) : super(key: key);
// 
//     State<Note> createState() => _NoteState(note: this);
// }
// 
// class _NoteState extends State<Note2> {
//   final Note2 note;
// 
//   const _NoteState({required this.note})
// 
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: note.color,
//       width: note.width,
//       height: note.height,
//     );
//   }
// }

// class MyNote2 extends StatelessWidget {
//   @override
//     Widget build(BuildContext context) {
//       return MaterialApp(
//         title: 'My Note',
//         
//       );
//     }
// }
// 
// class MyHomePage2 extends StatefulWidget{
//   final String title;
//   const MyHomePage2({super.key, required this.title})
//   @override
//     State<StatefulWidget> createState() => ;
// }
// 
// class _MyHomePagesState extends State<MyHomePage2> {
//   @override
//     Widget build(BuildContext context) {
//       return Scaffold(
//         body: Center(
//           child: Stack(
//             children: [],
//           ),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: 
//           
//         ),
//       );
//     }
// }

// example 1
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
