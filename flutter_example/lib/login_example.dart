import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class loginPractise {
  void executeExample(int i) {
    switch (i) {
      case 1:
        runApp(loginExample1());
        break;
      default:
    }
  }
}

class loginExample1 extends StatelessWidget {
  const loginExample1({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LoginPage());
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(onPressed: () {}),
      backgroundColor: Colors.red,
      drawer: Container(width: 400, height: 500, color: Colors.grey),
      body: Column(
        children: [
          Text(
            "Hello, welcome back",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
            //width: 500,
            //child: Text("this is text from test sizbox"),
          ),
          Text("Login to continue", style: TextStyle(color: Colors.white)),
          TextField(
            decoration: InputDecoration(
              hintText: "Username",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              filled: true,
              fillColor: Colors.white.withOpacity(0.5),
            ),
          ),
          SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              hintText: "Password",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              filled: true,
              fillColor: Colors.white.withOpacity(0.5),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton(
              onPressed: () {
                print("forget button");
              },
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              child: Text("Forget password"),
            ),
          ),
          SizedBox(
            width: 250,
            child: ElevatedButton(
              onPressed: () {
                print("login button");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.black,
              ),
              child: Text("Login"),
            ),
          ),
          SizedBox(height: 62),
          Text(
            "Or sign in with",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              backgroundColor: Colors.green,
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              print("google login button");
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/icons8-google-48.png',
                  width: 22,
                  height: 22,
                ),
                SizedBox(width: 8),
                Text("Login with google"),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              print("facebook login button");
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/icons8-facebook-48.png',
                  width: 22,
                  height: 22,
                ),
                SizedBox(width: 8),
                Text(
                  "Login with facebook",
                  style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 14,
                    backgroundColor: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Text(
                "Don't have account?",
                style: TextStyle(color: Colors.white),
              ),
              TextButton(
                onPressed: () {
                  print("no account button");
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.amberAccent,
                ),
                child: Text(
                  "Sign up",
                  style: TextStyle(decoration: TextDecoration.overline),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
