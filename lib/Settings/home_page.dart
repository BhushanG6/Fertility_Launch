import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upcloud_tracker/Settings/Home.dart';
import 'package:upcloud_tracker/Settings/calls_and_messages_service.dart';
import 'package:upcloud_tracker/Settings/get.dart';
import 'package:upcloud_tracker/Settings/globals1.dart';
import 'package:upcloud_tracker/Settings/service_locator.dart';

import '../bottom_navigator.dart';
import './about_screen.dart';
import './health_kit_screen.dart';
import './mode.dart';
import './remainder.dart';
import './secureme.dart';
import './theme.dart';
import './wearable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './input.dart';
import 'accessibility.dart';
import 'globals.dart' as globals;
import 'dart:io' show Platform;
import 'package:audioplayers/audio_cache.dart';
import 'post.dart';

class SettingsHomePage extends StatefulWidget {
  @override
  _SettingsHomePageState createState() => _SettingsHomePageState();
}

class _SettingsHomePageState extends State<SettingsHomePage> {
  bool p = false;
  bool qw = false;
  final CallsAndMessagesService _service = locator<CallsAndMessagesService>();
  final String email='bhushangajare6@gmail.com';
  FutureOr onGoBack(dynamic value) {
    setState(() {
      qw = globals.sw;
      //globals.modestatus;
    });
  }

  void getAllSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if ((prefs.getBool('installStatus1') ?? false) == false)
    {
      getSettings();
      getSanitary();
      getPeriodAlert();
      getPeriodEnd();
      getOvulation();
      getPills();
      getContraception();
    }
  }

  void initState() {
    super.initState();
    getAllSettings();
  }

  bool get fe {
    return globals.modestatus;
  }

  final player = AudioCache();
  bool _valueS = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Settings",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      onTap: () {
  //                        Navigator.push(
  //   context,
  //   MaterialPageRoute(builder: (context) => Home()),
  // );
                        postSetting();
                        print('periodendupdate  is $sanitaryupdate');
                        if (sanitaryupdate == true) postPads();
                        if (periodalertupdate == true) postPeriodAlert();
                        if(periodendupdate==true) postPeriodEnd();
                        if (ovulationupdate == true) postOvulation();
                        if (pillsupdate == true) postPills();
                        if (contraceptionupdate == true) postContraception();
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Done",
                        style: TextStyle(
                          color: Color.fromRGBO(234, 93, 237, 1),
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Container(
                  height: 180,
                  width: double.infinity,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 60,
                        top: 40,
                        child: Container(
                          height: 90,
                          width: 20,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.keyboard_arrow_up,
                                size: 20,
                                //color: Colors.black,
                              ),
                              Container(
                                height: 70.0,
                                width: 1.1,
                                color: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? Colors.black
                                    : Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Positioned(
                      //   right: MediaQuery.of(context).size.width * 0.12,
                      //   top: MediaQuery.of(context).size.height * 0.18,
                      //   // right: 45,
                      //   // top: 115,
                      //   child: Container(
                      //     height: 30,
                      //     width: 70,
                      //     child: Row(
                      //       children: [
                      //         Icon(
                      //           Icons.arrow_back_ios,
                      //           size: 10,
                      //           //                color: Theme.of(context).brightness == Brightness.light
                      //           // ? Colors.black
                      //           // : Colors.white,
                      //         ),
                      //         Container(
                      //           height: 1.0,
                      //           width: 40.0,
                      //           color: Theme.of(context).brightness ==
                      //                   Brightness.light
                      //               ? Colors.black
                      //               : Colors.white,
                      //         ),
                      //         Icon(
                      //           Icons.arrow_forward_ios,
                      //           size: 10,
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      Positioned(
                        top: 60,
                        left: 30,
                        child: Text(
                          "5'3''",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Positioned(
                        right: MediaQuery.of(context).size.width * 0.14,
                        top: MediaQuery.of(context).size.height * 0.10,
                        child: Container(
                          height: 69,
                          child: Column(
                            children: [
                              Text(
                                "20 years",
                                style: TextStyle(fontSize: 18),
                              ),
                              Container(
                                height: 30,
                                width: 70,
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.arrow_back_ios,
                                      size: 10,
                                      //                color: Theme.of(context).brightness == Brightness.light
                                      // ? Colors.black
                                      // : Colors.white,
                                    ),
                                    Container(
                                      height: 1.0,
                                      width: 40.0,
                                      color: Theme.of(context).brightness ==
                                              Brightness.light
                                          ? Colors.black
                                          : Colors.white,
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      size: 10,
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                "57 kgs",
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Positioned(
                      //   right: MediaQuery.of(context).size.width * 0.17,
                      //   top: MediaQuery.of(context).size.height * 0.21,
                      //   // right: 65,
                      //   // top: 135,
                      //   child: Text(
                      //     "57 kgs",
                      //     style: TextStyle(fontSize: 15),
                      //   ),
                      // ),
                      Positioned(
                        top: 10,
                        left: MediaQuery.of(context).size.width * 0.25,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(60),
                          child: Image(
                            image: AssetImage('assets/images/user1.jpg'),
                            height: 140,
                            width: 140,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      //globals.modestatus ? CustomImage() : SizedBox(),
                      qw
                          ? Positioned(
                              left: 190,
                              child: Container(
                                //color: Colors.transparent,
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  //color: Colors.transparent,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: 4,
                                    color: Theme.of(context).brightness ==
                                            Brightness.light
                                        ? Colors.grey[200]
                                        : Colors.black,
                                  ),
                                ),
                                child: ClipOval(
                                  child: Image(
                                    //color:
                                    //fe ? null :
                                    //Colors.transparent,
                                    height: 50,
                                    width: 50,
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage('assets/images/user0.jpg'),
                                  ),
                                ),
                              ),
                            )
                          : SizedBox(),
                      //ada(globals.partner_status),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(30, 0, 35, 0),
                child: Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        _valueS ? player.play('sound.mp3') : null;
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Input()),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 17,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Input",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            GestureDetector(
                              onTap: () {
                                _valueS ? player.play('sound.mp3') : null;
                                //_audioCache.play('sound.mp3');
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Input()),
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
                        _valueS ? player.play('sound.mp3') : null;

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RemainderAgain()),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 17,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Reminder",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            GestureDetector(
                              onTap: () {
                                _valueS ? player.play('sound.mp3') : null;

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RemainderAgain(),
                                    settings: RouteSettings(name: 'Reminder'),
                                  ),
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
                        _valueS ? player.play('sound.mp3') : null;

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Mode(
                                    st: false,
                                    //st2: globals.partner_status,
                                  )),
                        ).then(onGoBack);
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 17,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Mode",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            GestureDetector(
                              onTap: () {
                                _valueS ? player.play('sound.mp3') : null;

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Mode(
                                            st: globals.sw,
                                          )),
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
                        _valueS ? player.play('sound.mp3') : null;

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Secureme(),
                            settings: RouteSettings(name: 'Secure'),
                          ),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 17,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Secure Me",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            GestureDetector(
                              onTap: () {
                                _valueS ? player.play('sound.mp3') : null;

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Secureme()),
                                );
                              },
                              child: Icon(Icons.navigate_next),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //Accessbilty
                    InkWell(
                      onTap: () {
                        _valueS ? player.play('sound.mp3') : null;

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Accessibility(),
                            settings: RouteSettings(name: 'Accessibility'),
                          ),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 17,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Accessibility",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            GestureDetector(
                              onTap: () {
                                _valueS ? player.play('sound.mp3') : null;

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Accessibility()),
                                );
                              },
                              child: Icon(Icons.navigate_next),
                            ),
                          ],
                        ),
                      ),
                    ),
                    /*
                    InkWell(
                      onTap: () {
                        _valueS ? player.play('sound.mp3') : null;

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WearableScreen()),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 17,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Wearables",
                              style: TextStyle(fontSize: 17),
                            ),
                            GestureDetector(
                              onTap: () {
                                _valueS ? player.play('sound.mp3') : null;

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
                        _valueS ? player.play('sound.mp3') : null;

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HealthKitScreen()),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 17,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              Platform.isIOS ? "Health Kit" : "Fit Kit",
                              style: TextStyle(fontSize: 17),
                            ),
                            GestureDetector(
                              onTap: () {
                                _valueS ? player.play('sound.mp3') : null;

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HealthKitScreen()),
                                );
                              },
                              child: Icon(Icons.navigate_next),
                            ),
                          ],
                        ),
                      ),
                    ),
                    */
                  ],
                ),
              ),
              /*
              Container(
                margin: EdgeInsets.fromLTRB(30, 5, 26, 7),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Sound",
                          style: TextStyle(fontSize: 17),
                        ),
                        Spacer(),
                        Switch(
                            value: _valueS,
                            activeColor: Colors.yellow[700],
                            onChanged: (value) {
                              setState(() {
                                _valueS = value;
                                globals.status = !globals.status;
                              });
                            })
                      ],
                    ),
                    SizedBox(height: 11),
                    Consumer<ThemeNotifier>(
                      builder: (context, notifier, child) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Dark Mode",
                            style: TextStyle(fontSize: 17),
                          ),
                          Switch(
                            activeColor: Colors.yellow[700],
                            onChanged: (val) {
                              p = !p;
                              notifier.toggleTheme();
                            },
                            value: p,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              */
              InkWell(
                onTap: () {
                  _valueS ? player.play('sound.mp3') : null;
                  _service.sendEmail(email);
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => HealthKitScreen()),
                  // );
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 17, horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Contact Support",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  _valueS ? player.play('sound.mp3') : null;

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutScreen()),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 17, horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _valueS ? player.play('sound.mp3') : null;

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AboutScreen()),
                          );
                        },
                        child: Text(
                          "About",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavbar(),
      ),
    );
  }
}
