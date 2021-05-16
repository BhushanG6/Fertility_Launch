import '../widgets/custom_container.dart';

import '../widgets/custom_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:rounded_modal/rounded_modal.dart';
import 'package:flutter/cupertino.dart';
import 'globals.dart' as globals;

class Mode extends StatefulWidget {
  bool st = false;
  Mode({this.st});
  @override
  _ModeState createState() => _ModeState();
}

class _ModeState extends State<Mode> {
  bool rememberMe = false;
  bool rememberMe2 = false;
  int _currentValue = 9;
  bool preg = false;
  bool notpreg = false;
  bool nopreg = false;
  bool babyborn = false;

  void check1() {
    setState(() {
      notpreg = !notpreg;
    });
  }

  void check2() {
    setState(() {
      nopreg = !nopreg;
    });
  }

  void check3() {
    setState(() {
      babyborn = !babyborn;
    });
  }

  void startAddNewTransaction() {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(40),
        topRight: Radius.circular(40),
      )),
      isScrollControlled: true,
      isDismissible: false,
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? Colors.white
          : Colors.black,
      //radius: 50,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (BuildContext context, setState) {
          return GestureDetector(
            onTap: () {
              globals.status ? globals.player.play('sound.mp3') : null;
            },
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Container(
                height: widget.st == false && rememberMe2 == true
                    ? MediaQuery.of(context).size.height * 0.6
                    : MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        FlatButton(
                            onPressed: () {
                              globals.status
                                  ? globals.player.play('sound.mp3')
                                  : null;
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Cancel',
                              style: TextStyle(color: Colors.blue),
                            )),
                        Spacer(),
                        FlatButton(
                            onPressed: () {
                              globals.status
                                  ? globals.player.play('sound.mp3')
                                  : null;
                              setState(() {
                                widget.st = !widget.st;
                              });
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Save',
                              style: TextStyle(color: Colors.blue),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: Column(
                          children: [
                            widget.st == false && rememberMe2 == true
                                ? Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            'Current Month',
                                          ),
                                          Text(
                                            '$_currentValue month',
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 40),
                                      //Adding divider
                                      Row(children: <Widget>[
                                        Expanded(
                                          child: Container(
                                              child: Divider(
                                            thickness: 0.3,
                                            color:
                                                Theme.of(context).brightness ==
                                                        Brightness.light
                                                    ? Color.fromRGBO(0, 0, 0, 1)
                                                    : Colors.white38,
                                          )),
                                        ),
                                      ]),
                                    ],
                                  )
                                : SizedBox(),
                            widget.st == false && rememberMe2 == true
                                ? Container(
                                    height: 174,
                                    width: MediaQuery.of(context).size.width,
                                    child: NumberPicker.integer(
                                        selectedTextStyle: TextStyle(
                                            color:
                                                Color.fromRGBO(51, 51, 51, 1),
                                            fontSize: 23,
                                            fontWeight: FontWeight.w400),
                                        initialValue: _currentValue,
                                        minValue: 0,
                                        maxValue: 17,
                                        onChanged: (newValue) => setState(() {
                                              _currentValue = newValue;
                                            })),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          width: 0.3,
                                          color: Theme.of(context).brightness ==
                                                  Brightness.light
                                              ? Color.fromRGBO(0, 0, 0, 1)
                                              : Colors.white38,
                                        ),
                                      ),
                                    ),
                                  )
                                : SizedBox(
                                    child: Column(
                                      children: <Widget>[
                                        // SizedBox(
                                        //   height: 40,
                                        // ),
                                        Row(
                                          children: <Widget>[
                                            Text('Not Pregnant'),
                                            Spacer(),
                                            GestureDetector(
                                              child: CustCont(value: notpreg),
                                              onTap: () {
                                                setState(() {
                                                  notpreg = !notpreg;
                                                  if (notpreg == true) {
                                                    nopreg = false;
                                                    babyborn = false;
                                                    preg = false;
                                                  }
                                                  //widget.abcd();
                                                });
                                              },
                                            ),
                                            // CustomCheckbox(
                                            //     value: notpreg, abcd: check1),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 32,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Text('I\'m no longer pregant'),
                                            Spacer(),
                                            GestureDetector(
                                              child: CustCont(value: nopreg),
                                              onTap: () {
                                                setState(() {
                                                  nopreg = !nopreg;
                                                  if (nopreg == true) {
                                                    notpreg = false;
                                                    babyborn = false;
                                                    preg = false;
                                                  }
                                                  //widget.abcd();
                                                });
                                              },
                                            ),
                                            // CustomCheckbox(
                                            //     value: nopreg, abcd: check2),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 32,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Text('The baby is born'),
                                            Spacer(),
                                            GestureDetector(
                                              child: CustCont(value: babyborn),
                                              onTap: () {
                                                setState(() {
                                                  babyborn = !babyborn;
                                                  if (babyborn == true) {
                                                    notpreg = false;
                                                    preg = false;
                                                    nopreg = false;
                                                  }
                                                  //widget.abcd();
                                                });
                                              },
                                            ),
                                            // CustomCheckbox(
                                            //     value: babyborn, abcd: check3),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 32,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Text('I\'m pregnant'),
                                            Spacer(),
                                            GestureDetector(
                                              child: CustCont(value: preg),
                                              onTap: () {
                                                setState(() {
                                                  preg = !preg;
                                                  if (preg == true) {
                                                    notpreg = false;
                                                    babyborn = false;
                                                    nopreg = false;
                                                  }
                                                  //widget.abcd();
                                                });
                                              },
                                            ),
                                            // CustomCheckbox(
                                            //     value: babyborn, abcd: check3),
                                          ],
                                        ),
                                        SizedBox(height: 30),
                                        preg == true
                                            ? Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: <Widget>[
                                                      Text(
                                                        'Current Month',
                                                      ),
                                                      Text(
                                                        '$_currentValue month',
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 10),
                                                  Container(
                                                    height: 174,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    child: NumberPicker.integer(
                                                        selectedTextStyle:
                                                            TextStyle(
                                                                color: Color
                                                                    .fromRGBO(
                                                                        51,
                                                                        51,
                                                                        51,
                                                                        1),
                                                                fontSize: 23,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                        initialValue:
                                                            _currentValue,
                                                        minValue: 0,
                                                        maxValue: 17,
                                                        onChanged: (newValue) =>
                                                            setState(() {
                                                              _currentValue =
                                                                  newValue;
                                                            })),
                                                    decoration: BoxDecoration(
                                                      border: Border(
                                                        top: BorderSide(
                                                          width: 0.3,
                                                          color: Theme.of(context)
                                                                      .brightness ==
                                                                  Brightness
                                                                      .light
                                                              ? Color.fromRGBO(
                                                                  0, 0, 0, 1)
                                                              : Colors.white38,
                                                        ),
                                                        bottom: BorderSide(
                                                          width: 0.3,
                                                          color: Theme.of(context)
                                                                      .brightness ==
                                                                  Brightness
                                                                      .light
                                                              ? Color.fromRGBO(
                                                                  0, 0, 0, 1)
                                                              : Colors.white38,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              )
                                            : SizedBox(),
                                      ],
                                    ),
                                  ),
                          ],
                        )),
                  ],
                ),
              ),
            ),
            behavior: HitTestBehavior.opaque,
          );
        });
      },
    );
  }

  void _onRememberMeChanged() {
    setState(() {
      if (globals.sw == false) {
        globals.sw = true;
      } else if (globals.sw == true) {
        globals.sw = false;
      }
      // rememberMe = !rememberMe;
      // if (rememberMe) {
      //   globals.modestatus = true;
      // } else {
      //   globals.modestatus = false;
      // }
    });
    print(globals.modestatus.toString());
    // this.parent.setState(() {
    //   this.parent.st = !this.parent.st;
    // });
  }

  void _onRememberMeChanged_2() {
    if (rememberMe2 && widget.st) {
      startAddNewTransaction();
      rememberMe2 = !rememberMe2;
    } else {
      rememberMe2 = !rememberMe2;
      if (rememberMe2) {
        startAddNewTransaction();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: Column(
          children: <Widget>[
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
                  '  Modes',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        'Partner Mode',
                        style: TextStyle(fontSize: 22),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Transform.translate(
                        offset: Offset(0, -3),
                        child: CustomCheckbox2(
                            value: globals.sw, abcd: _onRememberMeChanged),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Text(
                        'aassas sjnsdjsd sjdnsjnds dsjdnsjnd sjdnsnd aassas sjnsdjsd sjdnsjnds dsjdnsjnd sjdnsndaassas sjnsdjsd sjdnsjnds dsjdnsjnd sjdnsnd'),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        'Pregnancy Mode',
                        style: TextStyle(fontSize: 22),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Transform.translate(
                        offset: Offset(0, -3),
                        child: CustomCheckbox(
                            value: rememberMe2, abcd: _onRememberMeChanged_2),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Text(
                        'aassas sjnsdjsd sjdnsjnds dsjdnsjnd sjdnsnd aassas sjnsdjsd sjdnsjnds dsjdnsjnd sjdnsndaassas sjnsdjsd sjdnsjnds dsjdnsjnd sjdnsnd'),
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
