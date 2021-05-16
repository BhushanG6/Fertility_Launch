import 'package:flutter/material.dart';

class BottomNavbar extends StatefulWidget {
  int currentIndex;
  BottomNavbar({this.currentIndex});
  @override
  _BottomNavbarState createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      //elevation: 20,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.blue,
      showUnselectedLabels: true,
      currentIndex: widget.currentIndex,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.star),
          label: 'Label',
//backgroundColor: Colors.red,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.brightness_1),
          label: 'Label',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.branding_watermark),
          label: 'Label',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.assistant,
          ),
          label: 'Label',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.account_circle,
          ),
          label: 'Label',
        ),
      ],
      onTap: (index) {
        setState(() {
          widget.currentIndex = index;
        });
      },
    );
  }
}
