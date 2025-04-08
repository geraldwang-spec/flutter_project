import 'package:flutter/material.dart';

class JoystickSelector extends StatefulWidget {
  final Function(Offset) onJoystickMove;
  final Function()? onJoystickRelease;
  // joystick max Radius
  final double maxRadius;
  // base size
  final double baseSize;
  // joystick size
  final double handleSize;
  // base color
  final Color baseColor;
  // joystick color (no move)
  final Color handleColor;
  // joystick color (move)
  final Color activeHandleColor;

  const JoystickSelector({
    super.key,
    required this.onJoystickMove,
    this.onJoystickRelease,
    this.maxRadius = 20,
    this.handleSize = 20,
    this.baseSize = 50,
    this.baseColor = Colors.grey,
    this.handleColor = Colors.white,
    this.activeHandleColor = Colors.blue,
  });
  @override
  State<JoystickSelector> createState() => _JoystickSelector();
}

class _JoystickSelector extends State<JoystickSelector> {
  double step = 5;
  Offset joystickPosition = Offset.zero;
  late Offset basePosition;
  bool isDragging = false;

  @override
  void initState() {
    super.initState();
    basePosition = Offset(widget.baseSize / 2, widget.baseSize / 2);
    joystickPosition = basePosition;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //behavior: HitTestBehavior.opaque,
      onPanStart: (datails) {
        isDragging = true;
      },

      onPanUpdate: (datails) {
        setState(() {
          Offset direction = datails.localPosition - basePosition;
          double distance = direction.distance;
          if (distance > widget.maxRadius) {
            direction = direction / distance * widget.maxRadius;
          }

          joystickPosition = basePosition + direction;

          print(
            "joystick dx={$joystickPosition.dx}, dy={$joystickPosition.dy}",
          );
          widget.onJoystickMove(
            Offset(
              direction.dx / widget.maxRadius,
              direction.dy / widget.maxRadius,
            ),
          );
        });
      },

      onPanEnd: (details) {
        setState(() {
          joystickPosition = basePosition;
          isDragging = false;
        });
      },
      child: Container(
        width: widget.baseSize,
        height: widget.baseSize,
        decoration: BoxDecoration(
          color: widget.baseColor,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              //Container(
              //  width: 40,
              //  height: 40,
              //  decoration: BoxDecoration(
              //    color: Colors.grey.withOpacity(0.5),
              //    shape: BoxShape.circle,
              //  ),
              //),
              Transform.translate(
                offset: Offset(
                  joystickPosition.dx - basePosition.dx,
                  joystickPosition.dy - basePosition.dy,
                ),
                child: Container(
                  width: widget.handleSize,
                  height: widget.handleSize,
                  decoration: BoxDecoration(
                    color:
                        isDragging
                            ? widget.activeHandleColor
                            : widget.handleColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
