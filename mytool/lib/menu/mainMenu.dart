import 'package:flutter/material.dart';
import 'package:mytool/ui/joystick.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});
  @override
  State<MainMenu> createState() => _MainMenu();
}

class _MainMenu extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey.withOpacity(0.3),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => Navigator.of(context).pop(),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => Navigator.of(context).pop(),
            child: Padding(
              padding: EdgeInsets.only(left: 30, bottom: 50),
              child: JoystickSelector(
                onJoystickMove: (Offset direction) {},
                maxRadius: 40,
                handleSize: 61,
                baseSize: 120,
                baseColor: Colors.grey.withOpacity(0.3),
                handleColor: Colors.white,
                activeHandleColor: Colors.blue,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
