import 'package:flutter/material.dart';
import '../year/yearly_view.dart';

class Year extends StatefulWidget {
  static const routeName = '/year';
  @override
  _YearState createState() => _YearState();
}

class _YearState extends State<Year> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? Colors.white
          : Colors.black,
      body: YearlyView(
        minDate: DateTime(2020),
        maxDate: DateTime(2030),
        currentDate: DateTime.now(),
      ),
    );
  }
}
