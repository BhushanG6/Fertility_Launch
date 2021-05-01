// // import 'package:liquid_swipe/Helpers/Helpers.dart';
// // import 'package:liquid_swipe/liquid_swipe.dart';
// import 'package:flutter/material.dart';
// import '../widgets/moods.dart';
// import '../widgets/symptoms.dart';
// import '../models/globals.dart' as globals;

// // ignore: must_be_immutable
// class Swipe extends StatefulWidget {
//   int p;
//   Swipe({this.p});
//   @override
//   _SwipeState createState() => _SwipeState();
// }

// class _SwipeState extends State<Swipe> {
//   int x;
//   @override
//   Widget build(BuildContext context) {
//     // if (widget.p == 0) {
//     //   x = 0;
//     //   setState(() {
//     //     globals.moods = false;
//     //     globals.st = false;
//     //   });
//     // } else if (widget.p == 1) {
//     //   x = 1;
//     //   setState(() {
//     //     globals.moods = true;
//     //     globals.st = true;
//     //   });
//     // }
//     print(globals.moods);
//     print(globals.st);
//     return LiquidSwipe(
//       initialPage: widget.p,
//       enableLoop: false,
//       fullTransitionValue: 300,
//       enableSlideIcon: false,
//       waveType: WaveType.liquidReveal,
//       positionSlideIcon: 0.5,
//       pages: [Container(child: Symptoms()), Container(child: Moods())],
//       onPageChangeCallback: (x) {
//         setState(() {
//           globals.st = !globals.st;
//           globals.moods = !globals.moods;

//         });
//       },
//     );
//   }
// }
