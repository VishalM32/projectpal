import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:projectpal/projects.dart';
import 'meeting.dart'; // Import the newly created MeetingPage
import 'task.dart'; // Import the newly created TaskPage
import 'teams.dart'; // Import the newly created TeamPage
import 'profile.dart'; // Import the newly created ProfilePage

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabChange;

  const BottomNavBar({
    required this.selectedIndex,
    required this.onTabChange,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 45, right: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 16),
          child: GNav(
            tabs: [
              GButton(
                icon: Icons.home_filled,
                text: 'Home',
              ),
              GButton(
                icon: Icons.group,
                text: 'Teams',
              ),
              GButton(
                icon: Icons.notifications,
                text: 'Alerts',
              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
              ),
            ],
            selectedIndex: selectedIndex,
            onTabChange: (index) {
              // Check if the index corresponds to "Alerts" or "Teams" tabs
              if (index != 2 && index != 1) {
                // Invoke the callback only if the index is not "Alerts" or "Teams"
                onTabChange(index);
              }
            },
            color: Colors.lime.shade200,
            activeColor: Colors.white,
            padding: EdgeInsets.all(1),
            gap: 5,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          ),
        ),
      ),
    );
  }
}

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  TextEditingController _noteController = TextEditingController();
  List<String> _notes = [];
  bool _noteAdded = false;
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
        fit: StackFit.expand,
        children: [
        Image.asset(
        'assets/blrcode1.jpg',
        fit: BoxFit.cover,
    ),
    SafeArea(
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Padding(
    padding: const EdgeInsets.only(top: 45, left: 20),
    child: Text(
    'Hi,',
    style: TextStyle(
    color: Colors.black,
    fontSize: 24,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.2,
    shadows: [
    BoxShadow(color: Colors.black38, blurRadius: 3)
    ],
    ),
    ),
    ),
    Padding(
    padding: const EdgeInsets.only(left: 20, bottom: 27),
    child: Text(
    'First Name',
    style: TextStyle(
    color: Colors.black,
    fontSize: 24,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.2,
    shadows: [
    BoxShadow(color: Colors.black38, blurRadius: 3)
    ],
    ),
    ),
    ),
    Padding(
    padding: const EdgeInsets.only(
    left: 15, bottom: 20, right: 200),
    child: GestureDetector(
    onTap: () {
    _showNoteDialog(context);
    },
    child: Container(
    padding: EdgeInsets.symmetric(
    vertical: 10, horizontal: 20),
    decoration: BoxDecoration(
    color: Colors.black.withOpacity(0.8),
    borderRadius: BorderRadius.circular(30),
    ),
    child: Row(
    children: [
    Icon(
    Icons.note_add,
    color: Colors.yellow,
    ),
    SizedBox(width: 5),
    Text(
    'Add Note',
    style: TextStyle(color: Colors.grey[100]),
    ),
    ],
    ),
    ),
    ),
    ),
    Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: _notes
        .map(
    (note) =>
    Padding(
    padding: const EdgeInsets.only(left: 20, bottom: 5),
    child: Text(
    note,
    style: TextStyle(
    color: Colors.black,
    fontSize: 16,
    ),
    ),
    ),
    )
        .toList(),
    ),
    ],
    ),
    ),
    Align(
    alignment: Alignment.center,
    child: Padding(
    padding: const EdgeInsets.only(bottom: 220, top: 1),
    child: Container(
    height: 95, // Adjust height as needed
    child: ListView(
    scrollDirection: Axis.horizontal,
    children: [
    SizedBox(width: 3),
    // Add initial padding
    GestureDetector(
    onTap: () {
    _onNavItemTapped(0);
    },
    child: _buildTeamCard('Teams', Colors.black45),
    ),
    GestureDetector(
    onTap: () {
    _onNavItemTapped(1);
    },
    child: _buildTeamCard('Meeting', Colors.black45),
    ),
    GestureDetector(
    onTap: () {
    _onNavItemTapped(2);
    },
    child: _buildTeamCard('Task', Colors.black45),
    ),
    ],
    ),
    ),
    ),
    ),
    // Text "Project/Task" in center
    Padding(
    padding: EdgeInsets.only(bottom: 60, right: 155),
    // Adjust bottom padding as needed
    child: Center(
    child: Text(
    'Project/Task',
    style: TextStyle(
    color: Colors.black,
    fontSize: 22,
    fontWeight: FontWeight.w700,
    shadows: [
    Shadow(
    blurRadius: 2,
    color: Colors.black12,
    offset: Offset(0.5, 0),
    ),
    ],
    ),
    ),
    ),
    ),
    // New ListView below "Project/Task" text
    Positioned(
    top: 360,
    // Adjust top position as needed
    left: 30,
    // Adjust left position as needed
    right: 30,
    // Adjust right position as needed
    bottom: 20,
    // Adjust bottom position as needed
    child: ListView(
    children: [
    _buildProjectBox('Project: App'),
    _buildProjectBox('Project: Web Dev'),
    _buildProjectBox('Project: AI/ML'),
    _buildProjectBox('Project: DSA'),
    ],
    ),
    ),
    ],
    ),
    floatingActionButton: BottomNavBar(
    selectedIndex: _selectedIndex,
      onTabChange: _onNavItemTapped,
    ),
    );
  }

  void _onNavItemTapped(int index) {
    setState(() {
      // Only navigate if the selected index is different from the current index
      if (_selectedIndex != index) {
        _selectedIndex = index;
        switch (index) {
          case 0: // Teams tab index
            _navigateWithTransition(context, TeamPage());
            break;
          case 1: // Meeting tab index
            _navigateWithTransition(context, MeetingPage());
            break;
          case 2: // Task tab index
            _navigateWithTransition(context, TaskPage());
            break;
          case 3: // Profile tab index
            _navigateWithTransition(context, ProfilePage());
            break;
        }
      }
    });
  }

  void _navigateWithTransition(BuildContext context, Widget page) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 500),
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.ease;
          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);
          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      ),
    );
  }

  void _showNoteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Add Note"),
          content: TextField(
            controller: _noteController,
            decoration: InputDecoration(hintText: "Enter your note here"),
          ),
          actions: <Widget>[
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Add"),
              onPressed: () {
                setState(() {
                  _notes.add(_noteController.text);
                  _noteController.clear();
                });
                Navigator.of(context).pop();
              },
            ),
            if (_notes.isNotEmpty) // Show remove button if notes exist
              TextButton(
                child: Text("Remove"),
                onPressed: () {
                  setState(() {
                    _notes.clear();
                  });
                  Navigator.of(context).pop();
                },
              ),
          ],
        );
      },
    );
  }

  Widget _buildTeamCard(String text, Color color) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2, vertical: 24),
      padding: EdgeInsets.all(1),
      height: 120,
      width: 130,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(90),
        color: Colors.black54,
      ),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildProjectBox(String projectName) {
    return GestureDetector(
      onTap: () {
        _navigateToProjectPage(projectName, context);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.all(17),
        decoration: BoxDecoration(
          color: Colors.yellow[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          projectName,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  void _navigateToProjectPage(String projectName, BuildContext context) {
    switch (projectName) {
      case 'Project: App':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AppPage()),
        );
        break;
      case 'Project: Web Dev':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => WebDevPage()),
        );
        break;
      case 'Project: AI/ML':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AiMlPage()),
        );
        break;
      case 'Project: DSA':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DsaPage()),
        );
        break;
      default:
      // Handle default case
        break;
    }
  }
}
