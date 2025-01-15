import 'dart:isolate';

import 'package:flutter/material.dart';

class DartExample {
  void executeExample(int i) {
    switch (i) {
      case 0:
        Animal a = Animal();
        a.display();
        break;
      case 1:
        Bicycle bicycle = Bicycle();
        bicycle.color = 'Red';
        bicycle.size = 26;
        bicycle.currentSpeed = 0;
        bicycle.changeGear(5);
        bicycle.display();
        break;
      case 2:
        Rectangle rectangle = Rectangle();
        rectangle.length = 10;
        rectangle.breadth = 4;
        print("Area of rectangle is ${rectangle.area()}");
        break;
      case 3:
        Student student = Student('John', 20, 1);
        print("name: ${student.name}");
        print("Age: ${student.age}");
        print("Roll Number ${student.rollNumber}");
        break;
      case 4:
        Chair chair = Chair(name: "Chair1", color: "Red");
        chair.display();
        break;
      case 5:
        TestQOO oo = TestQOO();
        oo.TestFor();
        break;
    }
  }
}

class TestQOO {
  void TestFor() {
    runTask();
  }

  void runTask() async {
    int i = 0;
    for (i = 0; i < 10; i++) {
      await Future.delayed(Duration(seconds: 2));
      print("Count = $i");
    }
  }
}

class Chair {
  String? name;
  String? color;

  Chair({this.name, this.color});
  // Chair({this.name = "chair", this.color = "white"}); // with default values

  void display() {
    print("name: ${this.name}");
    print("Age: ${this.color}");
  }
}

class Student {
  String? name;
  int? age;
  int? rollNumber;

  Student(String name, int age, int rollNumber) {
    print('Constructor called');
    this.name = name;
    this.age = age;
    this.rollNumber = rollNumber;
  }
}

class Rectangle {
  double? length;
  double? breadth;

  double area() {
    return length! * breadth!;
  }
}

class Bicycle {
  String? color;
  int? size;
  int? currentSpeed;

  void changeGear(int newValue) {
    currentSpeed = newValue;
  }

  void display() {
    print("color: $color");
    print("size: $size");
    print("current speedr $currentSpeed");
  }
}

class Animal {
  String? name;
  int? numberOfLegs;
  int? lifeSpan;

  void display() {
    print('Animal name: $name.');
    print('Number of Legs: $numberOfLegs.');
    print('Life Span: $lifeSpan.');
  }
}
