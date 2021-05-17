import 'package:flutter/material.dart';
import 'package:polygon_clipper/polygon_clipper.dart';
import 'package:flare_flutter/flare_actor.dart';

class Nanogon extends StatefulWidget {
  @override
  _NanogonState createState() => _NanogonState();
}

class _NanogonState extends State<Nanogon> {
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, -10),
      child: Transform.scale(
        scale: 0.96,
        child: ClipPolygon(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                // begin: Alignment.topLeft,
                // end: Alignment.bottomRight,
                begin: Alignment.topCenter,
                end: Alignment.center,
                colors: [
                  Colors.white38,
                  Colors.grey,
                  // Colors.blue[200],
                  // Colors.blue[800],
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
          sides: 9,
          borderRadius: 5.0,
        ),
      ),
    );
  }
}
