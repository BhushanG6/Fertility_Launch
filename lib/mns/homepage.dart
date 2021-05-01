import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
//import 'package:liquid_swipe/liquid_swipe.dart';
//import 'widgets/symptoms.dart';
import 'package:swipedetector/swipedetector.dart';
// import 'package:liquid_swipe/liquid_swipe.dart';
// import 'package:swipedetector/swipedetector.dart';
import 'models/globals.dart' as globals;
//import 'widgets/moods.dart';
import 'widgets/demo.dart';
import 'widgets/demo2.dart';
// import 'widgets/moods.dart';
// import 'widgets/swipe.dart';
//import 'widgets/symptoms.dart';

//bool st = false;
// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//           //primarySwatch: Colors.blue,
//           ),
//       home: MyHomePage(),
//     );
//   }
// }

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height.toString());
    print(MediaQuery.of(context).size.width.toString());
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.black
          : Colors.white,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
            margin: EdgeInsets.fromLTRB(10, 29, 30, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 25,
                  child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.black
                            : Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(
                          context,
                        );
                      }),
                ),
                InkWell(
                  child: Text(
                    'Symptoms',
                    style: !globals.st
                        ? TextStyle(
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.black
                                    : Colors.white,
                            fontSize: 28,
                            // fontFamily: ,
                            fontWeight: FontWeight.w600,
                          )
                        : TextStyle(
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.black
                                    : Colors.white,
                            fontSize: 20,
                            // fontFamily: ,
                            fontWeight: FontWeight.w200,
                          ),
                  ),
                  onTap: () {
                    setState(() {
                      globals.tap = false;
                      globals.st = false;
                      globals.moods = false;
                    });
                  },
                ),
                SizedBox(
                  width: 13,
                ),
                InkWell(
                  child: Text(
                    'Moods',
                    style: !globals.st
                        ? TextStyle(
                            fontSize: 20,
                            // fontFamily: ,
                            fontWeight: FontWeight.w200,
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.black
                                    : Colors.white,
                          )
                        : TextStyle(
                            fontSize: 28,
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.black
                                    : Colors.white,
                            // fontFamily: ,
                            fontWeight: FontWeight.w600,
                          ),
                  ),
                  onTap: () {
                    setState(() {
                      globals.tap = true;
                      globals.st = true;
                      globals.moods = true;
                    });
                  },
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    setState(() {
                      globals.st = false;
                      globals.moods = false;
                    });
                  },
                  child: !globals.st
                      ? Container(
                          width: 33,
                          height: 10,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.black
                                    : Colors.white,
                          ),
                        )
                      : Container(
                          width: 11,
                          height: 10,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.black54
                                    : Colors.white54,
                          ),
                        ),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      globals.st = !globals.st;
                      globals.moods = !globals.moods;
                      globals.tap = !globals.tap;
                    });
                  },
                  child: !globals.st
                      ? Container(
                          width: 11,
                          height: 10,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.black54
                                    : Colors.white54,
                          ),
                        )
                      : Container(
                          width: 33,
                          height: 10,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.black
                                    : Colors.white,
                          ),
                        ),
                ),
              ],
            ),
          ),
          globals.st == true
              ? SwipeDetector(
                  child: Demo2(),
                  onSwipeRight: () {
                    setState(() {
                      globals.st = false;
                      globals.moods = false;
                    });
                  },
                )
              : SwipeDetector(
                  child: Demo(),
                  onSwipeLeft: () {
                    setState(() {
                      globals.st = true;
                      globals.moods = true;
                    });
                  },
                ),
        ],
      ),
      
    );
  }
}
