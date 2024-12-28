import 'dart:async';
import "package:flutter/material.dart";

class StateFulWidgetExample{
   void executeExample(int number){
    StateFulWidgetExample1 ex1 = StateFulWidgetExample1();
    ex1.executeTimeExample(number);
  }
}

class StateFulWidgetExample1 {
  void executeTimeExample(int number){
    switch (number) {
      case 1:
        runApp(Center(child: Time()));
        break;
      case 3:
        runApp(
          Container(
            color: Colors.red,
          )
        );
        break;
      case 4:
        runApp(
          Center(
            child: Container(
              //child: Container(color: Colors.red),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.green,
                border: Border.all(width: 10, color: Colors.blue),
              ),
              padding: const EdgeInsets.all(20),
              constraints: BoxConstraints(
                maxWidth: 300,
                maxHeight: 300,
              ),
            ),
          )
        );
        break;
      case 5:
        Matrix4 m = Matrix4.translationValues(-50, 150, 0);
        m.multiply(Matrix4.rotationZ(-5));
        m.multiply(Matrix4.rotationY(1));
        m.multiply(Matrix4.rotationX(1));

        runApp(
          Center(
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.green),
              constraints: BoxConstraints(maxWidth: 300, maxHeight: 300),
              transform: m,
              child: Text('Hello World',
                textDirection: TextDirection.ltr,
                style: TextStyle(fontSize: 40),
              ),
            ),
          )
        );
        break;
      case 6:
        runApp(
          Column(
            children: [
              Container(color: Colors.blue, width: 100, height: 100,),
              Container(color: Colors.yellow, width: 100, height: 100,),
            ],
          )
        );
        break;
      case 7:
        runApp(
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(color: Colors.blue, width:100, height: 100),
              Container(color: Colors.yellow, width: 100, height: 100),
            ],
          )
        );
        break;
      case 8:
        runApp(
          Row(
            textDirection: TextDirection.ltr,
            children: [
              Container(color: Colors.blue, width:100, height: 100),
              Container(color: Colors.yellow, width: 100, height: 100),
            ],
          )
        );
        break;
      case 9:
        runApp(
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                textDirection: TextDirection.ltr,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(color: Colors.blue, width:100, height: 100),
                  Container(color: Colors.yellow, width: 100, height: 100),
                ],
              ),
              Row(
                textDirection: TextDirection.ltr,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(color: Colors.blue, width:100, height: 100),
                  Container(color: Colors.yellow, width: 100, height: 100),
                  Container(color: Colors.red, width: 100, height: 100),
                ],
              )
            ],
          )
        );
        break;
      case 10:
        runApp(
          Column(
            children: [
              Container(color: Colors.blue, width: 100, height: 500),
              Container(color: Colors.yellow, width: 100, height: 500),
            ],
          )
        );
        break;
      case 11:
        runApp(
          Column(
            children: [
              Expanded(
                child: Container(color: Colors.blue, width: 100, height: 500), 
              ),
              Expanded(
                child: Container(color: Colors.yellow, width: 100, height: 500),
              ),
            ],
          )
        );
        break;
      case 12:
        runApp(
          Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(color: Colors.blue, width: 100), 
              ),
              Expanded(
                flex: 1,
                child: Container(color: Colors.yellow, width: 100),
              ),
              Expanded(
                flex: 1,
                child: Container(color: Colors.red, width: 100), 
              ),
            ],
          )
        );
        break;
      case 13:
        runApp(
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                color: Colors.blue,
                height: 100,
                child: Center(
                  child: Text('Flutter Notes', textDirection: TextDirection.ltr, textAlign: TextAlign.center),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: Text('context', textDirection: TextDirection.ltr, style: TextStyle(color: Colors.black)),
                ),
              ),
              Container(
                color: Colors.cyan,
                height: 80,
                child: Center(
                  child: Text('Version ...', textDirection: TextDirection.ltr, textAlign: TextAlign.center),
                ),
              ),
            ],
          )
        );
        break;
      case 14:
        runApp(
          AppScaffold(
            title: Text('Flutter Notes 14', textDirection: TextDirection.ltr, textAlign: TextAlign.center), 
            body: Text('Context', textDirection: TextDirection.ltr, style: TextStyle(color: Colors.black)), 
            footer: Text('Version ...', textDirection: TextDirection.ltr, textAlign: TextAlign.center)),
        );
        break;
      case 15:
        runApp(
          MaterialApp(
            home: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.blue,
                title: Text('Flutter note', textDirection: TextDirection.ltr),
              ),
              body: Text('context', textDirection: TextDirection.ltr),
              bottomNavigationBar: BottomAppBar(
                color: Colors.cyan,
                child: Text('Version ...', textDirection: TextDirection.ltr, textAlign: TextAlign.center),
              ),
            ),
          ) 
        );
        break;
      default:
    }
  }
}

class AppScaffold extends StatelessWidget {
  final Widget title;
  final Widget body;
  final Widget footer;

  const AppScaffold({super.key, required this.title, required this.body, required this.footer});

  @override
  Widget build(BuildContext context) {
    return Column(
       crossAxisAlignment: CrossAxisAlignment.stretch,
       children: [
         Container(
           color: Colors.blue,
           height: 100,
           child: Center(
             child: title, 
           ),
         ),
         Expanded(
           child: Container(
             color: Colors.white,
             child: body,
           ),
         ),
         Container(
           color: Colors.cyan,
           height: 80,
           child: Center(
             child: footer,
           ),
         ),
       ],
     );
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

