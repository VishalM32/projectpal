import 'package:flutter/material.dart';
import 'package:projectpal/dashboard.dart';
///import 'bottom_nav_bar.dart';
// Import the Dashboard screen
//import 'package:projectpal/widgets/bottom_nav_bar.dart';
 // Import your BottomNavBar widget

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 60.0,
                backgroundImage: AssetImage('assets/profile_photo.jpg'),
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'First Name: John',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              'Last Name: Doe',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              'Email: john.doe@example.com',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              'GitHub: github.com/johndoe',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              'LinkedIn: linkedin.com/in/johndoe',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      bottomNavigationBar:Container(
        width: MediaQuery.of(context).size.width*10,
        padding: const EdgeInsets.only(bottom: 15, left: 0, right: 40), // Adjust padding as needed
        child: BottomNavBar(
          selectedIndex: 3, // Set the selected index to 3 (Profile tab)
          onTabChange: (index) {
            if (index == 0) {
              // Navigate to Dashboard when Home tab is clicked
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Dashboard()),
                    (route) => false,
              );
            }
          },
        ),
      ),
    );
  }
}
