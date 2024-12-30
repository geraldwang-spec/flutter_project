import 'package:flutter/material.dart';

class WidgetPractise {
  void executeExample(){
    //TextExample();
    // basicLayoutExample();
    // basicLayoutExample2();
    basicLayoutExample3();

  }
}

void basicLayoutExample3()
{
  runApp(
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          color: Colors.blue,
          margin: const EdgeInsets.all(20.0),
          width: 200.0,
          child: Text('Hello World', textAlign: TextAlign.center, textDirection: TextDirection.ltr,
            style: TextStyle(color: Colors.yellow),
          ),
        ),
       Container(
          color: Colors.yellow,
          margin: const EdgeInsets.all(20.0),
          width: 400,
          child: Text('哈囉！世界！',
            textAlign: TextAlign.center,
            textDirection: TextDirection.ltr,
            style: TextStyle(color: Colors.blue),
          ),
        )
      ],  
    )
  );
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

