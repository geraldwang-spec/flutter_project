import 'package:flutter/material.dart';

class WidgetPractise {
  void executeExample() {
    //TextExample();
    // basicLayoutExample();
    // basicLayoutExample2();
    basicLayoutExample3();
  }

  void executeExample1(int i) {
    switch (i) {
      case 1:
        runApp(ParentWidgetEX());
        break;
      default:
    }
  }
}

class ParentWidgetEX extends StatelessWidget {
  const ParentWidgetEX({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'ParentWidget Example', home: ParentWidget());
  }
}

class ParentWidget extends StatefulWidget {
  const ParentWidget({super.key});
  @override
  State<StatefulWidget> createState() => _ParentWidget();
}

class _ParentWidget extends State<ParentWidget> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ChangeNotify Example')),
      body: Container(
        child: TapboxB(active: _active, onChanged: _handleTapboxChanged),
      ),
    );
  }
}

class TapboxB extends StatelessWidget {
  const TapboxB({super.key, this.active = false, required this.onChanged});

  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
        child: Center(
          child: Text(
            active ? 'Active' : 'Inactive',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

void basicLayoutExample3() {
  runApp(
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          color: Colors.blue,
          margin: const EdgeInsets.all(20.0),
          width: 200.0,
          child: Text(
            'Hello World',
            textAlign: TextAlign.center,
            textDirection: TextDirection.ltr,
            style: TextStyle(color: Colors.yellow),
          ),
        ),
        Container(
          color: Colors.yellow,
          margin: const EdgeInsets.all(20.0),
          width: 400,
          child: Text(
            '哈囉！世界！',
            textAlign: TextAlign.center,
            textDirection: TextDirection.ltr,
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ],
    ),
  );
}

void basicLayoutExample2() {
  runApp(
    Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Hello, World!',
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr,
          style: TextStyle(color: Colors.yellow),
        ),
        Text(
          '哈囉！世界！',
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr,
          style: TextStyle(color: Colors.yellow),
        ),
        Text(
          '哈囉！QOO！',
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr,
          style: TextStyle(color: Colors.yellow),
        ),
      ],
    ),
  );
}

void basicLayoutExample() {
  runApp(
    Center(
      child: Text(
        'Hello, World',
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
        style: TextStyle(color: Colors.yellow),
      ),
    ),
  );
}

void textExample() {
  runApp(
    Text(
      'Hello, World',
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
      style: TextStyle(color: Colors.yellow),
    ),
  );
}
