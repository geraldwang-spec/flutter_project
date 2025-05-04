import 'package:flutter/material.dart';
import 'package:flutter_example/styles/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: Text('5 minuteflutter', style: TextStyle(color: AppColors.font)),
        centerTitle: true,
        actions: [
          Icon(Icons.location_on_outlined, color: Colors.white),
          Icon(Icons.home_mini_outlined),
        ],
      ),
      body: Container(),
    );
  }
}
