import 'package:flutter/material.dart';
import 'package:projectpal/dashboard.dart';
import 'package:projectpal/signin.dart'; // Import the SignInPage

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/loginpage.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Padding(
                padding: EdgeInsets.only(top: 90), // Add padding from top
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.white30.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 2),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Email',
                            fillColor: Colors.grey,
                            border: InputBorder.none, // Remove bottom border line
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 2),
                        child: TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: InputBorder.none, // Remove bottom border line
                          ),
                        ),
                      ),
                      SizedBox(height: 10), // Add space between password field and login button
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Dashboard()),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.yellowAccent), // Change button color here
                        ),
                        child: Text('Login'),
                      ),
                      SizedBox(height: 10), // Add space between login button and sign-in text
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'New User? ',
                            style: TextStyle(color: Colors.black87),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => SignInPage()),
                              );
                            },
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                color: Colors.purple, // Change text color here
                                decoration: TextDecoration.none, // Remove underline effect
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
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
