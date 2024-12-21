import 'package:flutter/material.dart';

class AppBarTest{
  void executeExample(){
    //runApp(AppbarExample());
    runApp(AppBarExample2());
  }
}

// https://www.geeksforgeeks.org/flutter-appbar-widget/?ref=next_article
class AppbarExample extends StatelessWidget {
  const AppbarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppBar Test',      
      home: Scaffold(
        appBar: AppBar(
          title: const Text('AppBar Test'),
          backgroundColor: Colors.pink,
        ),
        body: const Center(
          child: Text('GeeksforGeeks',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AppBarExample2 extends StatelessWidget {
  const AppBarExample2({super.key});

  @override
  Widget build (BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("GeeksforGeeks"),
          titleSpacing: 00.0,
          centerTitle: true,
          toolbarHeight: 60.2,
          toolbarOpacity: 1.0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25),
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.greenAccent[400],
        ),
        body: const Center(
          child: Text(
            'GeeksforGeeks',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
