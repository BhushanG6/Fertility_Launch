import 'package:flutter/material.dart';
import 'package:upcloud_tracker/main.dart';

class BottomNavbar extends StatefulWidget {
  @override
  _BottomNavbarState createState() => _BottomNavbarState();
}

int currentIndex = 0;

class _BottomNavbarState extends State<BottomNavbar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor:Theme.of(context).brightness==Brightness.light?Colors.white:Colors.black12,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.blue,
      showUnselectedLabels: true,
      currentIndex: currentIndex,
      items: [
        BottomNavigationBarItem(
          backgroundColor: Colors.white,
          icon: Icon(Icons.star),
          label: 'Me Profile',
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.white,
          icon: Icon(Icons.brightness_1),
          label: 'Settings',
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.white,
          icon: Icon(Icons.branding_watermark),
          label: 'Main App',
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.white,
          icon: Icon(
            Icons.assistant,
          ),
          label: 'M & S',
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.white,
          icon: Icon(
            Icons.account_circle,
          ),
          label: 'Report',
        ),
      ],
      onTap: (index) {
        setState(() {
          currentIndex = index;
          print(currentIndex);
          if (currentIndex == 1)
            Navigator.pushAndRemoveUntil<dynamic>(
        context,
        MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => MyApp(),
        ),
        (route) => true,//if you want to disable back feature set to false
);
        });
      },
    );
  }
}
