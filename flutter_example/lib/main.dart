import 'package:flutter/material.dart';
import 'package:flutter_example/first.dart';
import 'package:flutter_example/widgetExample.dart';

void main() {
  // runApp(const MyApp());
  //runApp(const AppbarExample());
  // AppBarTest appbarT = AppBarTest();
  // appbarT.executeExample();
    
  WidgetPractise widgetP = WidgetPractise();
  widgetP.executeExample();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        backgroundColor: Colors.lightGreen,
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text('GeeksforGeeks'),
        ),
        body: const Center(
          child: Text('Hello Geeks'),
        ),
      )
    );
  }
}

