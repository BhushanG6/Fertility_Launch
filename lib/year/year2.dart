import 'package:flutter/material.dart';
import '../year/changed_year_view.dart';
// ignore: unused_import
import '../year/yearly_missed.dart';
import '../year/year1212.dart' as hp;

class Year2 extends StatefulWidget {
  static const routeName = '/year2';
  @override
  _Year2State createState() => _Year2State();
}

class _Year2State extends State<Year2> {
  void abcd(DateTime d1, DateTime d2) {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? Colors.white
          : Colors.black,
      body: YearlyMissed(
        minDate: DateTime(2020),
        maxDate: DateTime(2030),
        onRangeSelected: abcd,
        // currentDate: DateTime.now(),
      ),
    );
  }
}
