import 'package:flutter/material.dart';
import 'package:flutter_example/styles/app_colors.dart';
import 'package:flutter_example/styles/app_text.dart';

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
      body: ListView(children: mockUsersFromServer()),
    );
  }

  Widget _userItem(int i) {
    return Row(
      children: [
        Image.asset('images/caterpillar.png', width: 40, height: 40),
        SizedBox(width: 16),
        Text(
          'Sarah Fernadez $i',
          //style: TextStyle(color: Colors.white, backgroundColor: Colors.grey),
          style: AppText.subtitle3,
        ),
      ],
    );
  }

  List<Widget> mockUsersFromServer() {
    List<Widget> users = [];
    for (var i = 0; i < 1000; i++) {
      users.add(_userItem(i));
    }
    return users;
  }
}
