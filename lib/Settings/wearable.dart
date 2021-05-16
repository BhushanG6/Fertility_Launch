import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'globals.dart' as globals;

class WearableScreen extends StatefulWidget {
  @override
  _WearableScreenState createState() => _WearableScreenState();
}

bool _isSelected = false;
bool _valueSettings = false;

class _WearableScreenState extends State<WearableScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  "Wearables",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30, top: 66),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Connect to external wearbales",
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
                        padding: EdgeInsets.only(bottom: 0),
                        decoration: BoxDecoration(
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
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
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
              padding: EdgeInsets.only(top: 35, left: 30, right: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.settings,
                    color: Colors.grey,
                  ),
                  Container(
                    width: 250,
                    child: RichText(
                      text: TextSpan(
                        text: "Pair to the wearable and ",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                        children: [
                          TextSpan(
                            text: "give access",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                          TextSpan(
                            text: " to the app in wearable",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                          TextSpan(
                            text: " settings",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                        ],
                      ),
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
