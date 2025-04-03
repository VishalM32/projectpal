import 'package:flutter/material.dart';

class TeamPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/blrbg2.jpg', // Add background image
            fit: BoxFit.cover,
          ),
          Center(
            child: Text(
              'ashirwad wala code team ka',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
