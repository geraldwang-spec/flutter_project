import 'package:flutter/material.dart';

class StateManagementExample {
  void executeExample(int i) {
    switch (i) {
      case 1:
        runApp(StateExample());
        break;
    }
  }
}

class ColorState extends InheritedWidget {
  final Color color;
  final Function(Color) changeColor;

  const ColorState({
    super.key,
    required this.color,
    required this.changeColor,
    required super.child,
  });

  static ColorState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ColorState>()!;
  }

  @override
  bool updateShouldNotify(ColorState oldWidget) {
    return color != oldWidget.color;
  }
}

class MyCounter2 extends StatelessWidget {
  final int count;
  const MyCounter2({super.key, required this.count});
  @override
  Widget build(BuildContext context) {
    return Text('$count');
  }
}

class MyCounter extends StatefulWidget {
  const MyCounter({super.key});

  @override
  State<StatefulWidget> createState() => _MyCounterState();
}

class _MyCounterState extends State<MyCounter> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Count $count'),
        TextButton(
          onPressed: () {
            setState(() {
              count++;
            });
          },
          child: Text('Increment'),
        ),
        MyCounter2(
          count: count,
        ),
        MyCounter2(
          count: count,
        ),
        TextButton(
          onPressed: () {
            setState(() {
              count++;
            });
          },
          child: Text('Increment'),
        )
      ],
    );
  }
}

class StateExample extends StatelessWidget {
  const StateExample({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MyCounter(),
      ),
    );
  }
}
