import 'package:flutter/material.dart';
import '../components/swipeable_card.dart';

class VaginalDischarge extends StatefulWidget {
  @override
  _VaginalDischargeState createState() => _VaginalDischargeState();
}

class _VaginalDischargeState extends State<VaginalDischarge> {
  final color = Color(0xFFFF0A0A);
  final index = 1;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Container(
      child: SwipableCard(
        index: index,
        borderColor: color,
        topHeight: height / 3,
        title: "Vaginal Discharge",
        child: Container(),
      ),
    );
  }
}
