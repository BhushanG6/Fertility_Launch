import 'package:flutter/material.dart';
import '../components/swipeable_card.dart';
import '../constants.dart';
import '../provider.dart/card_provider.dart';
import '../utilities.dart';

class TestsCard extends StatefulWidget {
  @override
  _TestsCardState createState() => _TestsCardState();
}

class _TestsCardState extends State<TestsCard> {
  final color = Color(0xFFFF0A0A);
  final index = 2;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      child: SwipableCard(
        index: index,
        borderColor: color,
        title: "Tests",
        topHeight: height / 3,
        child: Container(),
      ),
    );
  }
}
