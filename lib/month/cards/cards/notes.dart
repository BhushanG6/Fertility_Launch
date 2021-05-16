import 'package:flutter/material.dart';
import '../components/swipeable_card.dart';
import '../constants.dart';
import '../provider.dart/card_provider.dart';
import '../utilities.dart';

class NotesCards extends StatefulWidget {
  @override
  _NotesCardsState createState() => _NotesCardsState();
}

class _NotesCardsState extends State<NotesCards> {
  final color = Color(0xFFFF0A0A);
  final index = 3;
  FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SwipableCard(
      index: index,
      borderColor: color,
      topHeight: height / 3,
      title: "Notes",
      child: Container(
        color: Colors.transparent,
        child: TextField(
          focusNode: focusNode,
          decoration: InputDecoration(),
          maxLines: 100,
          onSubmitted: (value) {
            focusNode.unfocus();
          },
        ),
      ),
    );
  }
}
