import 'dart:async';
import "package:flutter/material.dart";

class StateFulWidgetExample{
   void executeExample(int number){
    switch (number) {
          case 1:
            StateFulWidgetExample1 ex1 = StateFulWidgetExample1();
            ex1.executeTimeExample();
            break;
          default:
        }
  }
}

class StateFulWidgetExample1 {
  void executeTimeExample(){
    runApp(Center(child: Time()));
  }
}

class Time extends StatefulWidget {
 const Time({super.key});  
  @override
  State<Time> createState() => _TimeState();
}

class _TimeState extends State<Time> {
  DateTime _dateTime = DateTime.now();

  @override 
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
              _dateTime = DateTime.now();
            });
    });
  }

  @override
    Widget build(BuildContext context) {
      return Text (
        _dateTime.toString().substring(0, 19),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );
    }
}

