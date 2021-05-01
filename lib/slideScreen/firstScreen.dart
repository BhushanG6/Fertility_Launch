import 'dart:async';

import '../widgets/bottom_navbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'activityScreen.dart';
import '../globals.dart' as globals;

// Brown Part of the Month Screen.
class FirstScreen extends StatefulWidget {
  final int month;
  final int year;
  FirstScreen(this.month, this.year);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  bool value = false;

  void sheet() {
    showBottomSheet(
        // isDismissible: false,
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? Colors.white
            : Colors.black,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        )),
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.all(9),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0))),
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              children: [
                Text(
                  '   Activity',
                  style: TextStyle(
                    color: Color.fromRGBO(150, 68, 31, 1),
                    fontSize: 23,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      globals.onTappedSteps = !globals.onTappedSteps;
                      Navigator.pop(context);
                    });
                  },
                  child: globals.onTappedSteps
                      ? ListTile(
                          //contentPadding: EdgeInsets.fromLTRB(10, 8, 8, 8),
                          title: Text(
                            'Steps',
                            style: TextStyle(
                              //fontSize: 17,
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(150, 68, 31, 1),
                            ),
                          ),
                          trailing: Icon(
                            Icons.check,
                            color: Colors.black,
                          ),
                        )
                      : ListTile(
                          //contentPadding: EdgeInsets.fromLTRB(10, 8, 8, 8),
                          title: Text(
                            'Steps',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(150, 68, 31, 1),
                            ),
                          ),
                        ),
                ),
                Divider(
                  height: 0,
                  thickness: 2,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      globals.onTappedRunning = !globals.onTappedRunning;
                      Navigator.pop(context);
                    });
                  },
                  child: globals.onTappedRunning
                      ? ListTile(
                          //contentPadding: EdgeInsets.fromLTRB(10, 8, 8, 8),
                          title: Text(
                            'Running',
                            style: TextStyle(
                              //fontSize: 17,
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(150, 68, 31, 1),
                            ),
                          ),
                          trailing: Icon(
                            Icons.check,
                            color: Colors.black,
                          ),
                        )
                      : ListTile(
                          //contentPadding: EdgeInsets.fromLTRB(10, 8, 8, 8),
                          title: Text(
                            'Running',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(150, 68, 31, 1),
                            ),
                          ),
                        ),
                ),
                Divider(
                  height: 0,
                  thickness: 2,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      globals.onTappedSwimming = !globals.onTappedSwimming;
                      Navigator.pop(context);
                    });
                  },
                  child: globals.onTappedSwimming
                      ? ListTile(
                          //contentPadding: EdgeInsets.fromLTRB(10, 8, 8, 8),
                          title: Text(
                            'Swimming',
                            style: TextStyle(
                              //fontSize: 17,
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(150, 68, 31, 1),
                            ),
                          ),
                          trailing: Icon(
                            Icons.check,
                            color: Colors.black,
                          ),
                        )
                      : ListTile(
                          //contentPadding: EdgeInsets.fromLTRB(10, 8, 8, 8),
                          title: Text(
                            'Swimming',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(150, 68, 31, 1),
                            ),
                          ),
                        ),
                ),
                Divider(
                  height: 0,
                  thickness: 2,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      globals.onTappedYoga = !globals.onTappedYoga;
                      Navigator.pop(context);
                    });
                  },
                  child: globals.onTappedYoga
                      ? ListTile(
                          //contentPadding: EdgeInsets.fromLTRB(10, 8, 8, 8),
                          title: Text(
                            'Yoga',
                            style: TextStyle(
                              //fontSize: 17,
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(150, 68, 31, 1),
                            ),
                          ),
                          trailing: Icon(
                            Icons.check,
                            color: Colors.black,
                          ),
                        )
                      : ListTile(
                          //contentPadding: EdgeInsets.fromLTRB(10, 8, 8, 8),
                          title: Text(
                            'Yoga',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(150, 68, 31, 1),
                            ),
                          ),
                        ),
                ),
                Divider(
                  height: 0,
                  thickness: 2,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      globals.onTappedCycling = !globals.onTappedCycling;
                      Navigator.pop(context);
                    });
                  },
                  child: globals.onTappedCycling
                      ? ListTile(
                          //contentPadding: EdgeInsets.fromLTRB(10, 8, 8, 8),
                          title: Text(
                            'Cycling',
                            style: TextStyle(
                              //fontSize: 17,
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(150, 68, 31, 1),
                            ),
                          ),
                          trailing: Icon(
                            Icons.check,
                            color: Colors.black,
                          ),
                        )
                      : ListTile(
                          //contentPadding: EdgeInsets.fromLTRB(10, 8, 8, 8),
                          title: Text(
                            'Cycling',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(150, 68, 31, 1),
                            ),
                          ),
                        ),
                ),
                Divider(
                  height: 0,
                  thickness: 2,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      globals.onTappedGym = !globals.onTappedGym;
                      Navigator.pop(context);
                    });
                  },
                  child: globals.onTappedGym
                      ? ListTile(
                          //contentPadding: EdgeInsets.fromLTRB(10, 8, 8, 8),
                          title: Text(
                            'Gym',
                            style: TextStyle(
                              //fontSize: 17,
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(150, 68, 31, 1),
                            ),
                          ),
                          trailing: Icon(
                            Icons.check,
                            color: Colors.black,
                          ),
                        )
                      : ListTile(
                          //contentPadding: EdgeInsets.fromLTRB(10, 8, 8, 8),
                          title: Text(
                            'Gym',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(150, 68, 31, 1),
                            ),
                          ),
                        ),
                ),
                Divider(
                  height: 0,
                  thickness: 2,
                ),
              ],
            ),
          );
        });
  }

  final bool isActive = false;

  final int index = 0;

  var sc;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18.0),
          topRight: Radius.circular(18.0),
        ),
      ),
      child: Container(
        height: MediaQuery.of(context).size.height / 3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              //  topLeft: Radius.circular(24.0),
              //  topRight: Radius.circular(24.0),
              ),
        ),
        //change heres
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(138, 93, 54, 1),
              //Colors.brown,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
            ),
            child: ListView(
              controller: sc,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height * .15,
                        width: MediaQuery.of(context).size.width * .75,
                        child: Text(
                          "\n Hello Friend, How was today?\n Was there any sort of trouble\n you faced today with this....",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .25,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Transform.rotate(
                              angle: -3.14 / 2,
                              child: Transform.scale(
                                scale: 1,
                                child: CupertinoSwitch(
                                  activeColor: Color.fromRGBO(176, 17, 17, 1),
                                  trackColor: Color.fromRGBO(176, 17, 17, 1),
                                  // inactiveThumbColor: Colors.white,
                                  // inactiveTrackColor: Colors.white,
                                  //activeColor: Colors.white,
                                  // materialTapTargetSize
                                  //     MaterialTapTargetSize.padded,
                                  value: globals.lop[globals.pq] == null
                                      ? value
                                      : globals.lop[globals.pq],
                                  onChanged: (v) => setState(() {
                                    globals.lop[globals.pq] =
                                        !globals.lop[globals.pq];
                                    value = v;
                                    //                                   Timer(
                                    //   Duration(seconds: 2),
                                    //   ()  {

                                    //   },
                                    // );
                                  }),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            globals.lop[globals.pq] == false ||
                                    globals.lop[globals.pq] == null
                                ? Text(
                                    '\t\t\tLOG\n\tPeriod',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                  )
                                : Text(
                                    '\t\tCancel\n\tPeriod',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 17,
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        child: Container(
                          width: 40.0,
                          height: 40.0,
                          margin: EdgeInsets.symmetric(
                            horizontal: 2.0,
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/user1.jpg'),
                            ),
                          ),
                        ),
                      ),
                      new Positioned(
                        left: 30.0,
                        child: Container(
                          width: 40.0,
                          height: 40.0,
                          margin: EdgeInsets.symmetric(
                            horizontal: 2.0,
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/user0.jpg'),
                            ),
                          ),
                        ),
                      ),
                      new Positioned(
                        left: 60.0,
                        child: Container(
                          width: 40.0,
                          height: 40.0,
                          margin: EdgeInsets.symmetric(
                            horizontal: 2.0,
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/user1.jpg'),
                            ),
                          ),
                        ),
                      ),
                      new Positioned(
                        left: 90.0,
                        child: Container(
                          width: 40.0,
                          height: 40.0,
                          margin: EdgeInsets.symmetric(
                            horizontal: 2.0,
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/user0.jpg'),
                            ),
                          ),
                        ),
                      ),
                      new Positioned(
                        left: 120.0,
                        child: Container(
                          width: 40.0,
                          height: 40.0,
                          margin: EdgeInsets.symmetric(
                            horizontal: 2.0,
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/user1.jpg'),
                            ),
                          ),
                        ),
                      ),
                      new Positioned(
                        left: 150.0,
                        child: Container(
                          width: 40.0,
                          height: 40.0,
                          margin: EdgeInsets.symmetric(
                            horizontal: 2.0,
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/user0.jpg'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Center(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        globals.onTappedSteps
                            ? Column(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.only(
                                      left: 12.0,
                                      right: 12.0,
                                    ),
                                    child: Icon(
                                      Icons.directions_walk,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '\t252\nSteps',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              )
                            : SizedBox(
                                width: 0,
                              ),
                        globals.onTappedRunning
                            ? Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                      left: 12.0,
                                      right: 12.0,
                                    ),
                                    child: Icon(
                                      Icons.directions_run,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Run',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              )
                            : SizedBox(
                                width: 0,
                              ),
                        globals.onTappedSwimming
                            ? Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                      left: 12.0,
                                      right: 12.0,
                                    ),
                                    child: Icon(
                                      Icons.wallpaper,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Swim',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              )
                            : SizedBox(
                                width: 0,
                              ),
                        globals.onTappedYoga
                            ? Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                      left: 12.0,
                                      right: 12.0,
                                    ),
                                    child: Icon(
                                      Icons.accessibility_new,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Yoga',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              )
                            : SizedBox(
                                width: 0,
                              ),
                        globals.onTappedCycling
                            ? Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                      left: 12.0,
                                      right: 12.0,
                                    ),
                                    child: Icon(
                                      Icons.directions_bike,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Cycling',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              )
                            : SizedBox(
                                width: 0,
                              ),
                        globals.onTappedGym
                            ? Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                      left: 12.0,
                                      right: 12.0,
                                    ),
                                    child: Icon(
                                      Icons.donut_small,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Gym',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              )
                            : SizedBox(
                                width: 0,
                              ),
                        GestureDetector(
                          onTap: () {
                            sheet();
                            //here
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) =>
                            //           AddMore(widget.month, widget.year)),
                            // );
                          },
                          child: Container(
                            padding: const EdgeInsets.only(
                              left: 12.0,
                              right: 12.0,
                            ),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 10.0,
                      height: 10.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Container(
                      width: 10.0,
                      height: 10.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
