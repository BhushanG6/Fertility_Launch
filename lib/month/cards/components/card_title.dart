import 'package:flutter/material.dart';

import '../constants.dart';

class CardTitle extends StatelessWidget {
  final title;
  final fontWeight;
  CardTitle(this.title, this.fontWeight);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: AnimatedDefaultTextStyle(
      duration: kDuration,
      style: TextStyle(
        fontSize: 22,
        color: Colors.black,
        fontWeight: this.fontWeight,
      ),
      child: Text(
        this.title,
      ),
    ));
  }
}
