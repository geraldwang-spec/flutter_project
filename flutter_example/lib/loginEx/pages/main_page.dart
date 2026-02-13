import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bottom Navigation Container')),
      body: Center(child: Text('Center Text')),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assert/svg/icons8-home.svg'),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assert/svg/favorite.svg',
              width: 24,
              height: 24,
            ),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assert/svg/add.svg', width: 24, height: 24),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assert/svg/message.svg',
              width: 24,
              height: 24,
            ),
            label: 'message',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assert/svg/user.svg',
              width: 24,
              height: 24,
            ),
            label: 'user',
          ),
        ],
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        backgroundColor: Colors.orange,
      ),
    );
  }
}
