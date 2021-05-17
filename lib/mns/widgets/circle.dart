import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:polygon_clipper/polygon_clipper.dart';
import 'package:flare_flutter/flare_actor.dart';

class Circle extends StatefulWidget {
  @override
  _CircleState createState() => _CircleState();
}

class _CircleState extends State<Circle> {
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, -6),
      child: Transform.scale(
        scale: 1.05,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.center,
                colors: [
                  Colors.white38,
                  Colors.grey,
                ],
              ),
            ),
            child: FlareActor("assets/images/guilty.flr",
                alignment: Alignment.center,
                fit: BoxFit.cover,
                animation: "idle"),
          ),
          // boxShadows: [
          //   PolygonBoxShadow(color: Colors.black, elevation: 5.0),
          // ],
          // sides: 9,
          // borderRadius: 5.0,
        ),
      ),
    );
  }
}
