import 'package:flutter/material.dart';

class NavigationTest {
  void executeExample(int number) {
    switch (number) {
      case 1:
        runApp(navigationExample());
        break;
      default:
    }
  }
}

class navigationExample extends StatelessWidget {
  const navigationExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'NavigationTest', home: NavigationExample1());
  }
}

class NavigationExample1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NavigationExample1();
}

class _NavigationExample1 extends State<NavigationExample1> {
  int currentIndex = 0;
  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text('Navigation Example1')),
      backgroundColor: Colors.white10,
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: size.width,
              height: 80,
              //color: Colors.white,
              child: Stack(
                children: [
                  CustomPaint(
                    size: Size(size.width, 80),
                    painter: BNBCustomPainter(),
                  ),
                  //Positioned(
                  //  bottom: 20,
                  //  left: size.width / 2 - 30,
                  //  child: FloatingActionButton(
                  //    backgroundColor: Colors.orange,
                  //    shape: CircleBorder(),
                  //    elevation: 0.1,
                  //    onPressed: () {
                  //      ScaffoldMessenger.of(context)
                  //          .showSnackBar(SnackBar(content: Text("Test")));
                  //    },
                  //  ),
                  //),
                  Center(
                    heightFactor: 0.6,
                    child: FloatingActionButton(
                      backgroundColor: Colors.orange,
                      shape: CircleBorder(),
                      elevation: 0.1,
                      onPressed: () {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text("TEST")));
                      },
                      child: Icon(Icons.home),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 80,
                    //color: Colors.transparent,
                    padding: EdgeInsets.symmetric(horizontal: 17.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {
                            setBottomBarIndex(0);
                          },
                          icon: Icon(
                            Icons.shape_line_outlined,
                            color:
                                currentIndex == 0
                                    ? Colors.orange
                                    : Colors.grey.shade400,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setBottomBarIndex(1);
                          },
                          icon: Icon(
                            Icons.restaurant_menu_sharp,
                            color:
                                currentIndex == 1
                                    ? Colors.orange
                                    : Colors.grey.shade400,
                          ),
                        ),
                        Container(width: size.width * 0.2),
                        IconButton(
                          onPressed: () {
                            setBottomBarIndex(2);
                          },
                          icon: Icon(
                            Icons.bookmark,
                            color:
                                currentIndex == 2
                                    ? Colors.orange
                                    : Colors.grey.shade400,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setBottomBarIndex(3);
                          },
                          icon: Icon(
                            Icons.notification_add,
                            color:
                                currentIndex == 3
                                    ? Colors.orange
                                    : Colors.grey.shade400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint =
        Paint()
          ..color = Colors.white
          ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 20);
    path.quadraticBezierTo(size.width * 0.2, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.4, 0, size.width * 0.4, 20);
    path.arcToPoint(
      Offset(size.width * 0.6, 20),
      radius: Radius.circular(10.0),
      clockwise: false,
    );
    path.quadraticBezierTo(size.width * 0.6, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.8, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    path.close();
    path.lineTo(0, 20);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    //throw UnimplementedError();
    return false;
  }
}
