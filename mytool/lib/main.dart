import 'package:flutter/material.dart';
import 'package:mytool/menu/mainMenu.dart';
import 'ui/joystick.dart';

void main() {
  runApp(const MyApp());
}

class MyCustomDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        width: 100,
        height: 100,
        color: Colors.white.withOpacity(0.3),
      ),
    );
  }
}

class MyCustomDialog1 extends StatefulWidget {
  const MyCustomDialog1({super.key});
  @override
  State<MyCustomDialog1> createState() => _MyCustomDialog1();
}

class _MyCustomDialog1 extends State<MyCustomDialog1> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        width: 100,
        height: 100,
        color: Colors.white.withOpacity(0.3),
        child: Text('QOO'),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Tool',
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      home: const MyHomePage(title: 'Flutter iDemo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  //State<MyHomePage> createState() => _MyHomePageState();
  //State<MyHomePage> createState() => _JoystickDemoState();
  State<MyHomePage> createState() => _testJoystickSelector();
}

class _testJoystickSelector extends State<MyHomePage> {
  double x = 0, y = 0;
  double step = 5;
  bool _showButton = true;

  void _showDialog() async {
    setState(() {
      _showButton = false;
    });

    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        //return MyCustomDialog1();
        return MainMenu();
      },
    );

    setState(() {
      _showButton = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      backgroundColor: Colors.black12,
      body: Stack(
        children: [
          Positioned(
            left: MediaQuery.of(context).size.width / 2 + x,
            top: MediaQuery.of(context).size.height / 2 + y,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomLeft,
            child:
                _showButton
                    ? ElevatedButton(
                      onPressed: () {
                        _showDialog();
                      },
                      //style: ElevatedButton.styleFrom(
                      //  shape: CircleBorder(
                      //    side: BorderSide(width: 5, color: Colors.grey),
                      //  ),
                      //),
                      child: Icon(Icons.menu_open),
                    )
                    : SizedBox.shrink(),
            //child: JoystickSelector(
            //  onJoystickMove: (Offset direction) {
            //    setState(() {
            //      x += direction.dx * step;
            //      y += direction.dy * step;
            //    });
            //  },
            //  maxRadius: 40,
            //  baseSize: 120,
            //  handleSize: 40,
            //  baseColor: Colors.grey.withOpacity(0.3),
            //  handleColor: Colors.white,
            //  activeHandleColor: Colors.blue,
            //),
          ),
        ],
      ),
    );
  }
}

class _JoystickDemoState extends State<MyHomePage> {
  double x = 0, y = 0;
  double step = 5;
  Offset joystickPosition = Offset.zero;
  late Offset basePosition;
  bool isDragging = false;

  @override
  void initState() {
    super.initState();
    basePosition = Offset(25, 25);
    joystickPosition = basePosition;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      backgroundColor: Colors.black12,
      body: Stack(
        children: [
          Positioned(
            left: MediaQuery.of(context).size.width / 2 + x,
            top: MediaQuery.of(context).size.height / 2 + y,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: GestureDetector(
                onPanStart: (datails) {
                  //basePosition = datails.localPosition;
                  //joystickPosition = basePosition;
                  isDragging = true;
                },

                onPanUpdate: (datails) {
                  setState(() {
                    //joystickPosition = datails.localPosition;

                    Offset direction = datails.localPosition - basePosition;
                    double distance = direction.distance;
                    if (distance > 20) {
                      direction = direction / distance * 20;
                    }

                    joystickPosition = basePosition + direction;

                    print(
                      "joystick dx={$joystickPosition.dx}, dy={$joystickPosition.dy}",
                    );
                    x += direction.dx / 2 * step;
                    y += direction.dy / 2 * step;
                  });
                },

                onPanEnd: (details) {
                  setState(() {
                    joystickPosition = basePosition;
                    isDragging = false;
                  });
                },

                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5),
                            shape: BoxShape.circle,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(
                            joystickPosition.dx - basePosition.dx,
                            joystickPosition.dy - basePosition.dy,
                          ),
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: isDragging ? Colors.blue : Colors.white,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        //Positioned(
                        //  left: joystickPosition.dx,
                        //  top: joystickPosition.dy,
                        //  child: Container(
                        //    width: 50,
                        //    height: 50,
                        //    decoration: BoxDecoration(
                        //      color: isDragging ? Colors.blue : Colors.white,
                        //      shape: BoxShape.circle,
                        //    ),
                        //  ),
                        //),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  double x = 0;
  double y = 0;
  final double step = 20;

  void move(String direction) {
    setState(() {
      if (direction == "up") y -= step;
      if (direction == "down") y += step;
      if (direction == "left") x -= step;
      if (direction == "right") x += step;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          Positioned(
            left: MediaQuery.of(context).size.width / 2 + x,
            top: MediaQuery.of(context).size.height / 2 + y,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(bottom: 50),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildDirectionButton(Icons.arrow_drop_up, () => move("up")),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildDirectionButton(
                        Icons.arrow_left,
                        () => move("left"),
                      ),
                      _buildDirectionButton(
                        Icons.arrow_right,
                        () => move("right"),
                      ),
                    ],
                  ),
                  _buildDirectionButton(
                    Icons.arrow_drop_down,
                    () => move("down"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDirectionButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.5),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 40),
      ),
    );
  }
}
