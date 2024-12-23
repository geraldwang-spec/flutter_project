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
      children: [
        Container(
          child: Text('Hello World', textAlign: TextAlign.center, textDirection: TextDirection.ltr,
            style: TextStyle(color: Colors.yellow),
          ),
          color: Colors.blue,
          margin: const EdgeInsets.all(20.0),
          width: 200.0,
        ),
       Container(
          child: Text('哈囉！世界！',
            textAlign: TextAlign.center,
            textDirection: TextDirection.ltr,
            style: TextStyle(color: Colors.blue),
          ),
          color: Colors.yellow,
          margin: const EdgeInsets.all(20.0),
          width: 400,
        )
      ],  
      mainAxisAlignment: MainAxisAlignment.center,
    )
  );
}

void basicLayoutExample2()
{
  runApp(
    Column(
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
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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

