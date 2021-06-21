import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../bottom_navigator.dart';
import 'globals.dart' as globals;
import 'health_kit_screen.dart';
import 'theme.dart';
import 'wearable.dart';

class GoDark extends StatefulWidget {
  @override
  _GoDarkState createState() => _GoDarkState();
}

class _GoDarkState extends State<GoDark> {
  bool _valueS = false;
  bool _valueS1 = false;
  bool _valueS2 = false;
  bool p = false;

  @override
  void initState() {
    super.initState();
    _valueS = !globals.dm;
  }

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
                    '  GoDark',
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
                  margin: EdgeInsets.fromLTRB(30, 0, 27, 0),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 18),
                        child: Consumer<ThemeNotifier>(
                          builder: (context, notifier, child) => Row(
                            children: [
                              Text(
                                "Daylight",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              Spacer(),
                              CupertinoSwitch(
                                  value: _valueS,
                                  activeColor: Colors.yellow[700],
                                  onChanged: (value) {
                                    setState(() {
                                      if (_valueS == true) {
                                        notifier.toggleTheme();
                                        globals.dm = !globals.dm;
                                        _valueS = !_valueS;
                                      } else if (_valueS == false) {
                                        notifier.toggleTheme();
                                        globals.dm = !globals.dm;
                                        _valueS = !_valueS;
                                      }
                                      // _valueS = value;
                                      // globals.status = !globals.status;
                                      /*
                                       notifier.toggleTheme();
                                      _valueS = !globals.dm;
                                      */
                                    });
                                  }),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 18),
                        child: Row(
                          children: [
                            Text(
                              "Day Night",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            Spacer(),
                            CupertinoSwitch(
                                value: _valueS1,
                                activeColor: Colors.yellow[700],
                                onChanged: (value) {
                                  setState(() {
                                    _valueS1 = value;
                                    globals.status = !globals.status;
                                  });
                                }),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 18),
                        child: Consumer<ThemeNotifier>(
                          builder: (context, notifier, child) => Row(
                            children: [
                              Text(
                                "Dark",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              Spacer(),
                              CupertinoSwitch(
                                  value: globals.dm,
                                  activeColor: Colors.yellow[700],
                                  onChanged: (value) {
                                    globals.dm = !globals.dm;
                                    notifier.toggleTheme();
                                    _valueS = !globals.dm;
                                    // setState(() {
                                    //  p = !p;
                                    //   globals.status = !globals.status;
                                    // }
                                    // );
                                  }),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        )),
        bottomNavigationBar: BottomNavbar(),
      ),
    );
  }
}
