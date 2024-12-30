import 'package:flutter/material.dart';

class StateLessWidgetPractise {
  void executeExample(){
    basicLayoutExample2();
  }
}

void basicLayoutExample2()
{
  runApp(
    Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text('Hello, World!', textAlign: TextAlign.center, textDirection: TextDirection.ltr,
          style: TextStyle(color: Colors.yellow),
        ),
        Text('哈囉！世界！', textAlign: TextAlign.center, textDirection: TextDirection.ltr,
          style: TextStyle(color: Colors.yellow),
        ),
        Text('哈囉！QOO！', textAlign: TextAlign.center, textDirection: TextDirection.ltr,
          style: TextStyle(color: Colors.yellow),
        ),
      ],  
    )
  );
}

