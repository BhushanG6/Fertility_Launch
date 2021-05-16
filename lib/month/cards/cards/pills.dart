import 'package:flutter/material.dart';
import '../components/swipeable_card.dart';
import '../constants.dart';
import '../provider.dart/card_provider.dart';
import '../utilities.dart';

class PillsCard extends StatefulWidget {
  @override
  _PillsCardState createState() => _PillsCardState();
}

class _PillsCardState extends State<PillsCard> {
  final color = Color(0xFFFF0A0A);
  final index = 4;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      child: SwipableCard(
        index: index,
        borderColor: color,
        topHeight: height / 1.56,
        title: "Pills",
        child: Row(
          children: [
            pillButton("Taken"),
            pillButton("Double"),
            pillButton("Mixed"),
            pillButton("Late"),
          ],
        ),
      ),
    );
  }

  Widget pillButton(String text) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(8),
        child: GestureDetector(
          onTap: () {},
          child: Column(
            children: [
              Container(
                height: 80,
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(100)),
              ),
              SizedBox(
                height: 7,
              ),
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'SF Pro Text',
                    fontSize: 13,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal,
                    height: 1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
