import 'package:flutter/material.dart';
import 'package:polygon_clipper/polygon_clipper.dart';
import 'package:flare_flutter/flare_actor.dart';

class Rect extends StatefulWidget {
  @override
  _RectState createState() => _RectState();
}

class _RectState extends State<Rect> {
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, 0),
      child: Transform.scale(
        scale: 1.05,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Container(
            height: 56,
            width: 56,
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
