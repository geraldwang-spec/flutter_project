import 'package:flutter/material.dart';
import 'package:flutter_example/loginEx/pages/home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);
    return Scaffold(
      appBar: AppBar(),
      //floatingActionButton: FloatingActionButton(onPressed: () {}),
      backgroundColor: Colors.red,
      drawer: Container(width: 400, height: 500, color: Colors.grey),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              children: [
                Spacer(),
                Text(
                  "Hello, welcome back",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    //fontFamily: 'Urbanist',
                  ),
                ),
                SizedBox(
                  height: 20,
                  //width: 500,
                  //child: Text("this is text from test sizbox"),
                ),
                Text(
                  "Login to continue",
                  style: TextStyle(color: Colors.white),
                ),
                Spacer(),
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
                SizedBox(height: 32),
                SizedBox(
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () {
                      // navigator way1
                      //Navigator.of(context).push(
                      //  MaterialPageRoute(
                      //    builder: (context) {
                      //      return HomePage();
                      //    },
                      //  ),
                      //);
                      // navigator way2
                      //Navigator.of(context).pushNamed('/home');
                      // navigator way3
                      Navigator.of(context).pushReplacementNamed('/home');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.black,
                    ),
                    child: Text("Login"),
                  ),
                ),
                //SizedBox(height: 62),
                Spacer(),
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
                SizedBox(height: 10),
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
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
