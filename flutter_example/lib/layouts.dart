import 'package:flutter/material.dart';

class LayoutsExample {
  void executeExample(int i) {
    switch (i) {
      case 1:
        runApp(LayoutExample1());
        break;
    }
  }
}

class BoarderedImage extends StatelessWidget {
  const BoarderedImage({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      color: Colors.lightBlueAccent,
      padding: EdgeInsets.all(8.0),
      width: 100,
      height: 100,
      child: Image.asset('images/caterpillar.png'),
    ));
  }
}

class LayoutExample1 extends StatelessWidget {
  const LayoutExample1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Layout Example'),
          ),
          body: Center(
            child: BoarderedImage(),
          )),
    );
  }
}
