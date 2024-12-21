import 'package:flutter/material.dart';

class WidgetPractise {
  void executeExample(){
    //TextExample();
    BasicLayoutExample();
  }
}

void TextExample()
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

void BasicLayoutExample()
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
