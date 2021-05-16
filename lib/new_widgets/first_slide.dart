import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class FirstSlide extends StatefulWidget {
  @override
  _FirstSlideState createState() => _FirstSlideState();
}

class _FirstSlideState extends State<FirstSlide> {
  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      color: Colors.red,
      minHeight: 200,
      panel: Center(
        child: Text("This is the sliding Widget"),
      ),
    );
  }
}
