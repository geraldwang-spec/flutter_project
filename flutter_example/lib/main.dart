import 'package:flutter/material.dart';
import 'package:flutter_example/first.dart';
import 'package:flutter_example/second.dart';
import 'package:flutter_example/widget_example.dart';
import 'package:flutter_example/statelesswidget_example.dart';
import 'package:flutter_example/state_ful_widget.dart';
import 'package:flutter_example/dart_example.dart';

void main() {
  // runApp(const MyApp());
  //runApp(const AppbarExample());
  // AppBarTest appbarT = AppBarTest();
  // appbarT.executeExample();

  // WidgetPractise widgetP = WidgetPractise();
  // widgetP.executeExample();

  // StateLessWidgetPractise stateP = StateLessWidgetPractise();
  // stateP.executeExample();

  // StateFulWidgetExample statefulEx = StateFulWidgetExample();
  // statefulEx.executeExample(18);

  // SecondPartExample secondE = SecondPartExample();
  // secondE.executeExample(1);
  DartExample dart = DartExample();
  dart.executeExample(4);
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
        ));
  }
}
