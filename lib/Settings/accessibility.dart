import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:upcloud_tracker/Settings/godark.dart';
import 'globals.dart' as globals;
import 'health_kit_screen.dart';
import 'theme.dart';
import 'wearable.dart';

class Accessibility extends StatefulWidget {
  @override
  _AccessibilityState createState() => _AccessibilityState();
}

class _AccessibilityState extends State<Accessibility> {
  bool _valueS = false;
  bool p = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 34,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      globals.status ? globals.player.play('sound.mp3') : null;
                      Navigator.pop(
                        context,
                      );
                    },
                    child: Icon(
                      Icons.navigate_before,
                      size: 30,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      globals.status ? globals.player.play('sound.mp3') : null;
                      Navigator.pop(
                        context,
                      );
                    },
                    child: Container(
                      height: 33,
                      width: 33,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 2),
                            color: Colors.black,
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: Image(
                          height: 33,
                          width: 33,
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/user1.jpg'),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    '  Accessibility',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 39,
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(30, 0, 35, 0),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          //_valueS ? player.play('sound.mp3') : null;

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WearableScreen()),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 19,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Wearables",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              GestureDetector(
                                onTap: () {
                                  //_valueS ? player.play('sound.mp3') : null;

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => WearableScreen()),
                                  );
                                },
                                child: Icon(Icons.navigate_next),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          //_valueS ? player.play('sound.mp3') : null;

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HealthKitScreen()),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 19,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                Platform.isIOS ? "Health Kit" : "Fit Kit",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              GestureDetector(
                                onTap: () {
                                  //_valueS ? player.play('sound.mp3') : null;

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            HealthKitScreen()),
                                  );
                                },
                                child: Icon(Icons.navigate_next),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
              Container(
                margin: EdgeInsets.fromLTRB(30, 2, 26, 7),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Sound",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        Spacer(),
                        CupertinoSwitch(
                            value: _valueS,
                            activeColor: Colors.yellow[700],
                            onChanged: (value) {
                              setState(() {
                                _valueS = value;
                                globals.status = !globals.status;
                              });
                            }),
                        // Switch(
                        //     value: _valueS,
                        //     activeColor: Colors.yellow[700],
                        //     onChanged: (value) {
                        //       setState(() {
                        //         _valueS = value;
                        //         globals.status = !globals.status;
                        //       });
                        //     })
                      ],
                    ),
                    //SizedBox(height: 11),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 5, 9, 0),
                      child: InkWell(
                        onTap: () {
                          //_valueS ? player.play('sound.mp3') : null;

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => GoDark()),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 19,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Go Dark",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              GestureDetector(
                                onTap: () {
                                  //_valueS ? player.play('sound.mp3') : null;

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => GoDark()),
                                  );
                                },
                                child: Icon(Icons.navigate_next),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                    // Consumer<ThemeNotifier>(
                    //   builder: (context, notifier, child) => Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Text(
                    //         "Dark Mode",
                    //         style: TextStyle(
                    //                 fontSize: 18, fontWeight: FontWeight.w500),
                    //       ),
                    //       Switch(
                    //         activeColor: Colors.yellow[700],
                    //         onChanged: (val) {
                    //           p = !p;
                    //           notifier.toggleTheme();
                    //         },
                    //         value: p,
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
