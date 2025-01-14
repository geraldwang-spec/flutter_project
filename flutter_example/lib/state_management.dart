import 'package:flutter/material.dart';
import 'dart:math' as math;

class StateManagementExample {
  void executeExample(int i) {
    switch (i) {
      case 1:
        runApp(StateExample());
        break;
      case 2:
        runApp(ColorChangeExample());
        break;
      case 3:
        runApp(CallbackExample());
        break;
      case 4:
        runApp(ListenableExample());
        break;
    }
  }
}

// listenable Example
class ListenableExample extends StatelessWidget {
  const ListenableExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Listenable Example',
      home: ListenColor(),
    );
  }
}

class ListenColor extends StatefulWidget {
  const ListenColor({super.key});

  @override
  State<StatefulWidget> createState() => _ListenColor();
}

class _ListenColor extends State<ListenColor> {
  final ValueNotifier<Color> _colorNotifier = ValueNotifier<Color>(Colors.blue);

  void _changeColor() {
    _colorNotifier.value =
        _colorNotifier.value == Colors.blue ? Colors.green : Colors.blue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listenable Example'),
      ),
      body: Center(
        child: ValueListenableBuilder<Color>(
          valueListenable: _colorNotifier,
          builder: (context, color, child) {
            return Container(
              width: 200,
              height: 200,
              color: color,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeColor,
        child: const Icon(Icons.color_lens),
      ),
    );
  }
}

// Callback Example
class CallbackExample extends StatelessWidget {
  const CallbackExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ColorManagerDemo(),
    );
  }
}

class ColorManagerDemo extends StatefulWidget {
  const ColorManagerDemo({super.key});

  @override
  State<StatefulWidget> createState() => _ColorManagerDemo();
}

class _ColorManagerDemo extends State<ColorManagerDemo> {
  Color _currentColor = Colors.blue;

  void _onColorChanged(Color newColor) {
    setState(() {
      _currentColor = newColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Callback Example'),
      ),
      body: Column(
        children: [
          ColorDisplay(color: _currentColor),
          ColorControls(
            currentColor: _currentColor,
            onColorChanged: _onColorChanged,
          ),
        ],
      ),
    );
  }
}

class ColorDisplay extends StatelessWidget {
  final Color color;

  const ColorDisplay({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Container(
          width: 200,
          height: 200,
          color: color,
        ),
      ),
    );
  }
}

class ColorControls extends StatelessWidget {
  final currentColor;
  final Function(Color) onColorChanged;

  const ColorControls(
      {super.key, required this.currentColor, required this.onColorChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _ColorButton(
                color: Colors.red,
                isSelected: currentColor == Colors.red,
                // onTap: onColorChanged(Colors.red)),
              ),
              _ColorButton(
                color: Colors.blue,
                isSelected: currentColor == Colors.blue,
                // onTap: onColorChanged(Colors.blue)),
              ),
              _ColorButton(
                color: Colors.green,
                isSelected: currentColor == Colors.green,
                // onTap: onColorChanged(Colors.green)),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              final color = Color(
                      (DateTime.now().millisecondsSinceEpoch % 0xffffff)
                          .toInt())
                  .withOpacity(1.0);
              onColorChanged(color);
            },
            child: Text('Random Color'),
          )
        ],
      ),
    );
  }
}

class _ColorButton extends StatelessWidget {
  final Color color;
  final bool isSelected;
  // final VoidCallback onTap;

  // const _ColorButton(
  //     {required this.color, required this.isSelected, required this.onTap});
  const _ColorButton({required this.color, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(
            color: isSelected ? Colors.black : Colors.transparent,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}

// InheritedWidget Example
//
class ColorState extends InheritedWidget {
  final Color color;
  final Function(Color) changeColor;

  const ColorState({
    super.key,
    required this.color,
    required this.changeColor,
    required super.child,
  });

  static ColorState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ColorState>()!;
  }

  @override
  bool updateShouldNotify(ColorState oldWidget) {
    return color != oldWidget.color;
  }
}

class ColorStateWidget extends StatefulWidget {
  final Widget child;

  const ColorStateWidget({super.key, required this.child});

  @override
  State<StatefulWidget> createState() => _ColorStateWidgetState();
}

class _ColorStateWidgetState extends State<ColorStateWidget> {
  Color _color = Colors.blue;

  void _changeColor(Color newColor) {
    setState(() {
      _color = newColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ColorState(
      color: _color,
      changeColor: _changeColor,
      child: widget.child,
    );
  }
}

class ColorChangingWidget extends StatelessWidget {
  const ColorChangingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 200,
            height: 200,
            color: ColorState.of(context).color,
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              ColorState.of(context).changeColor(
                Color((math.Random().nextDouble() * 0xffffff).toInt())
                    .withOpacity(1.0),
              );
            },
            child: const Text('change color'),
          )
        ],
      ),
    );
  }
}

class ColorChangeExample extends StatelessWidget {
  const ColorChangeExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ColorStateWidget(
        child: Scaffold(
          body: ColorChangingWidget(),
        ),
      ),
    );
  }
}

class MyCounter2 extends StatelessWidget {
  final int count;
  const MyCounter2({super.key, required this.count});
  @override
  Widget build(BuildContext context) {
    return Text('$count');
  }
}

class MyCounter extends StatefulWidget {
  const MyCounter({super.key});

  @override
  State<StatefulWidget> createState() => _MyCounterState();
}

class _MyCounterState extends State<MyCounter> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Count $count'),
        TextButton(
          onPressed: () {
            setState(() {
              count++;
            });
          },
          child: Text('Increment'),
        ),
        MyCounter2(
          count: count,
        ),
        MyCounter2(
          count: count,
        ),
        TextButton(
          onPressed: () {
            setState(() {
              count++;
            });
          },
          child: Text('Increment'),
        ),
        ColorChangingWidget(),
      ],
    );
  }
}

class StateExample extends StatelessWidget {
  const StateExample({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MyCounter(),
      ),
    );
  }
}
