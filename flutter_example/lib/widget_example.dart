import 'package:flutter/material.dart';

class WidgetPractise {
  void executeExample(){
    //TextExample();
    basicLayoutExample();
  }
}

void textExample()
{
  runApp(
    Text(
      'Hello, World',
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
      style: TextStyle(color: Colors.yellow),
    )
  );
}

void basicLayoutExample()
{
  runApp(
    Center(
      child: Text(
        'Hello, World',
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
        style: TextStyle(color: Colors.yellow),
      ),
    )
  );
}
