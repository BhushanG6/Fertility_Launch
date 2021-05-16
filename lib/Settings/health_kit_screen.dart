import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:io' show Platform;
import 'globals.dart' as globals;

class HealthKitScreen extends StatefulWidget {
  @override
  _HealthKitScreenState createState() => _HealthKitScreenState();
}

bool _isSelected = false;
bool _valueSettings = false;

class _HealthKitScreenState extends State<HealthKitScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 34,
            ),
            Row(
              children: [
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
                SizedBox(
                  width: 10,
                ),
                Text(
                  Platform.isIOS ? "Health Kit" : "Fit Kit",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            //---- Check box----
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30, top: 66),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Connect to the Health App",
                    style: TextStyle(fontSize: 17),
                  ),
                  Transform.translate(
                    offset: Offset(0, -2),
                    child: GestureDetector(
                      onTap: () {
                        globals.status
                            ? globals.player.play('sound.mp3')
                            : null;
                        setState(() {
                          _isSelected = !_isSelected;
                        });
                      },
                      child: Container(
                        height: 25,
                        width: 40,
                        decoration: BoxDecoration(
                          //color: Colors.red,
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        child: Center(
                          child: _isSelected
                              ? Icon(
                                  Icons.check,
                                  color: Colors.yellow[700],
                                )
                              : null,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Egestas sed temp.',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30, left: 30, right: 140),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FaIcon(FontAwesomeIcons.solidHeart, color: Colors.red),
                  RichText(
                    text: TextSpan(
                      text: "Open",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                      children: [
                        TextSpan(
                          text: " Wearable",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        TextSpan(
                          text: " App",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30, left: 30, right: 128),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FaIcon(FontAwesomeIcons.heart, color: Colors.grey),
                  RichText(
                    text: TextSpan(
                      text: "Go to the",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                      children: [
                        TextSpan(
                          text: " Sources",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        TextSpan(
                          text: " tab",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30, left: 30, right: 88),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Select",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                      children: [
                        TextSpan(
                          text: " ME",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        TextSpan(
                          text: " in the list of apps",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 35, left: 15, right: 150),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Switch(
                      value: _valueSettings,
                      activeColor: Colors.yellow[700],
                      onChanged: (value) {
                        globals.status
                            ? globals.player.play('sound.mp3')
                            : null;
                        setState(() {
                          _valueSettings = value;
                        });
                      }),
                  Text(
                    "Turn on all settings",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
