import 'package:flutter/material.dart';
import '../components/swipeable_card.dart';
import '../constants.dart';
import '../provider.dart/card_provider.dart';
import '../utilities.dart';

class SwitchButton extends StatefulWidget {
  @override
  _SwitchButtonState createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton>
    with SingleTickerProviderStateMixin {
  AlignmentGeometry alignment = Alignment.topCenter;
  AnimationController rotationController;
  bool on = false;

  @override
  void initState() {
    rotationController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    super.initState();
  }

  void switchOnOff() {
    setState(() {
      on = !on;
      if (on) {
        alignment = Alignment.bottomCenter;
        rotationController.forward();
      } else {
        alignment = Alignment.topCenter;
        rotationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            switchOnOff();
          },
          child: Container(
            width: 40,
            height: 80,
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20),
            ),
            child: AnimatedContainer(
              alignment: alignment,
              duration: kDuration,
              child: RotationTransition(
                turns:
                    Tween(begin: 0.75, end: 0.25).animate(rotationController),
                child: AnimatedContainer(
                  padding: EdgeInsets.all(4),
                  duration: kDuration,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: on ? Color(0xFFFD8383) : Colors.white),
                  child: Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
        Text(
          on ? "Cancel" : "Log",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        Text(
          "Period",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
