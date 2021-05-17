<<<<<<< HEAD
=======
import 'dart:ui';

import '../bottom_navigator.dart';
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
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
<<<<<<< HEAD

=======
  bool temp = false;
  String preg_month = 'No';
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
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

<<<<<<< HEAD
  void startAddNewTransaction() {
    showModalBottomSheet(
=======
  Widget custom_checkbox(bool value, Function abcd) {
    return Transform.translate(
      offset: Offset(0, -8),
      child: GestureDetector(
        onTap: () {
          setState(() {
            value = !value;
            abcd();
          });
        },
        child: Container(
          height: 30,
          width: 40,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 3,
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.black
                    : value
                        ? Colors.white
                        : Color.fromRGBO(158, 158, 158, 1),
              ),
            ),
          ),
          child: Center(
            child: value
                ? Icon(
                    Icons.check,
                    color: Colors.yellow[700],
                  )
                : null,
          ),
        ),
      ),
    );
  }

  void setStatus(String para, Function setstate1) {
    setState(() {
      if (para == 'other') {
        rememberMe2 = false;
        preg_month = 'No';
      } else
        rememberMe2 = true;
    });
  }

  void setStatus1(int month) {
    setState(() {
      preg_month = month.toString();
    });
  }

  showAlertDialog(String para) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Continue"),
      onPressed: () {
        if (para == 'partner_mode') {
          setState(() {
            globals.sw = false;
          });
          //para='Partner Mode';
        }
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Alert"),
      content: Text("Are you sure tou want to remove $para ?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void startAddNewTransaction() {
    showModalBottomSheet(
      clipBehavior: Clip.none,
      barrierColor: Color.fromRGBO(73, 73, 73, 0.4),
      elevation: 0,
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(40),
        topRight: Radius.circular(40),
      )),
<<<<<<< HEAD
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
=======
      isScrollControlled: false,
      isDismissible: false,
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? Colors.transparent//Colors.white.withOpacity(0.6)
          : Colors.transparent,//Colors.black,
      //radius: 50,
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: StatefulBuilder(builder: (BuildContext context, setState1) {
            return GestureDetector(
              onTap: () {
                globals.status ? globals.player.play('sound.mp3') : null;
              },
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                     decoration: BoxDecoration(
                        gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Theme.of(context).brightness == Brightness.dark
                            ? Color.fromRGBO(0, 0, 0, 0.6)
                            : Color.fromRGBO(255, 255, 255, 0.6),
                        Theme.of(context).brightness == Brightness.dark
                            ? Color.fromRGBO(33, 33, 33, 0)
                            : Color.fromRGBO(255, 255, 255, 0.8),
                      ],
                    )),
                    height:
                        widget.st == false && rememberMe2 == true ? 496 : 496,
                    width: MediaQuery.of(context).size.width,
                    // margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    // padding: EdgeInsets.fromLTRB(30,30,30,30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          flex: 0,
                          child: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(12, 15, 5, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
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
                                      style: TextStyle(
                                          color: Color.fromRGBO(
                                              46, 154, 215, 1),
                                          fontSize: 17),
                                    )),
                                Spacer(),
                                FlatButton(
                                    onPressed: () {
                                      globals.status
                                          ? globals.player.play('sound.mp3')
                                          : null;
                                      setState1(() {
                                        widget.st = !widget.st;
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'Save',
                                      style: TextStyle(
                                          color: Color.fromRGBO(
                                              46, 154, 215, 1),
                                          fontSize: 17),
                                    )),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Expanded(
                          child: ScrollConfiguration(
                            behavior: new ScrollBehavior()
                              ..buildViewportChrome(
                                  context, null, AxisDirection.down),
                            child: SingleChildScrollView(
                              child: Container(
                                  padding:
                                      EdgeInsets.fromLTRB(30, 0, 30, 20),
                                  child: Column(
                                    children: [
                                      widget.st == false &&
                                              rememberMe2 == true
                                          ? Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                    Text(
                                                      'Current Month',
                                                      style: TextStyle(
                                                          fontSize: 18),
                                                    ),
                                                    Text(
                                                      '$_currentValue month',
                                                      style: TextStyle(
                                                          fontSize: 18),
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
                                                      color: Theme.of(context)
                                                                  .brightness ==
                                                              Brightness
                                                                  .light
                                                          ? Color.fromRGBO(
                                                              0, 0, 0, 1)
                                                          : Colors.white38,
                                                    )),
                                                  ),
                                                ]),
                                              ],
                                            )
                                          : SizedBox(),
                                      widget.st == false &&
                                              rememberMe2 == true
                                          ? Container(
                                              height: 150,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .center,
                                                children: [
                                                  Container(
                                                    width: 55,
                                                    child: NumberPicker
                                                        .integer(
                                                            selectedTextStyle: TextStyle(
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
                                                                color: Color
                                                                    .fromRGBO(
                                                                        51,
                                                                        51,
                                                                        51,
                                                                        1),
<<<<<<< HEAD
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
=======
                                                                fontSize:
                                                                    23,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                            initialValue:
                                                                _currentValue,
                                                            minValue: 0,
                                                            maxValue: 11,
                                                            onChanged:
                                                                (newValue) =>
                                                                    setState1(
                                                                        () {
                                                                      _currentValue =
                                                                          newValue;
                                                                      setStatus1(
                                                                          newValue);
                                                                    })),
                                                  ),
                                                  Text(
                                                    'Months',
                                                    style: TextStyle(
                                                        fontSize: 23,
                                                        fontWeight:
                                                            FontWeight
                                                                .w300),
                                                  ),
                                                ],
                                              ),
                                              decoration: BoxDecoration(
                                                border: Border(
                                                  bottom: BorderSide(
                                                    width: 0.3,
                                                    color: Theme.of(context)
                                                                .brightness ==
                                                            Brightness.light
                                                        ? Color.fromRGBO(
                                                            0, 0, 0, 1)
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
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                top: 18),
                                                        child: Text(
                                                          'Not Pregnant',
                                                          style: notpreg
                                                              ? TextStyle(
                                                                  fontSize:
                                                                      18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600)
                                                              : TextStyle(
                                                                  color: Theme.of(context).brightness !=
                                                                          Brightness
                                                                              .light
                                                                      ? Color.fromRGBO(
                                                                          158,
                                                                          158,
                                                                          158,
                                                                          1)
                                                                      : null,
                                                                  fontSize:
                                                                      18),
                                                        ),
                                                      ),
                                                      Spacer(),
                                                      GestureDetector(
                                                        child: Stack(
                                                            alignment:
                                                                Alignment
                                                                    .center,
                                                            children: [
                                                              CustCont(
                                                                  value:
                                                                      notpreg),
                                                              Padding(
                                                                padding: const EdgeInsets
                                                                        .only(
                                                                    top:
                                                                        28),
                                                                child:
                                                                    Container(
                                                                  width: 47,
                                                                  child:
                                                                      new Divider(
                                                                    thickness:
                                                                        3,
                                                                    color: Theme.of(context).brightness !=
                                                                            Brightness.light
                                                                        ? notpreg
                                                                            ? Colors.white
                                                                            : Color.fromRGBO(158, 158, 158, 1)
                                                                        : Colors.black,
                                                                  ),
                                                                ),
                                                              )
                                                            ]),
                                                        onTap: () {
                                                          setState1(() {
                                                            setStatus(
                                                                'other',
                                                                setState1);
                                                            notpreg =
                                                                !notpreg;
                                                            if (notpreg ==
                                                                true) {
                                                              nopreg =
                                                                  false;
                                                              babyborn =
                                                                  false;
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
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                top: 18),
                                                        child: Text(
                                                          'I\'m no longer pregant',
                                                          style: nopreg
                                                              ? TextStyle(
                                                                  fontSize:
                                                                      18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600)
                                                              : TextStyle(
                                                                  fontSize:
                                                                      18,
                                                                  color: Theme.of(context).brightness !=
                                                                          Brightness
                                                                              .light
                                                                      ? Color.fromRGBO(
                                                                          158,
                                                                          158,
                                                                          158,
                                                                          1)
                                                                      : null),
                                                        ),
                                                      ),
                                                      Spacer(),
                                                      GestureDetector(
                                                        child: Stack(
                                                            alignment:
                                                                Alignment
                                                                    .center,
                                                            children: [
                                                              CustCont(
                                                                  value:
                                                                      nopreg),
                                                              Padding(
                                                                padding: const EdgeInsets
                                                                        .only(
                                                                    top:
                                                                        28),
                                                                child:
                                                                    Container(
                                                                  width: 47,
                                                                  child:
                                                                      new Divider(
                                                                    thickness:
                                                                        3,
                                                                    color: Theme.of(context).brightness !=
                                                                            Brightness.light
                                                                        ? nopreg
                                                                            ? Colors.white
                                                                            : Color.fromRGBO(158, 158, 158, 1)
                                                                        : Colors.black,
                                                                  ),
                                                                ),
                                                              )
                                                            ]),
                                                        onTap: () {
                                                          setState1(() {
                                                            setStatus(
                                                                'other',
                                                                setState1);
                                                            nopreg =
                                                                !nopreg;
                                                            if (nopreg ==
                                                                true) {
                                                              notpreg =
                                                                  false;
                                                              babyborn =
                                                                  false;
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
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                top: 18),
                                                        child: Text(
                                                          'The baby is born',
                                                          style: babyborn
                                                              ? TextStyle(
                                                                  fontSize:
                                                                      18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600)
                                                              : TextStyle(
                                                                  fontSize:
                                                                      18,
                                                                  color: Theme.of(context).brightness !=
                                                                          Brightness
                                                                              .light
                                                                      ? Color.fromRGBO(
                                                                          158,
                                                                          158,
                                                                          158,
                                                                          1)
                                                                      : null),
                                                        ),
                                                      ),
                                                      Spacer(),
                                                      GestureDetector(
                                                        child: Stack(
                                                            alignment:
                                                                Alignment
                                                                    .center,
                                                            children: [
                                                              CustCont(
                                                                  value:
                                                                      babyborn),
                                                              Padding(
                                                                padding: const EdgeInsets
                                                                        .only(
                                                                    top:
                                                                        28),
                                                                child:
                                                                    Container(
                                                                  width: 47,
                                                                  child:
                                                                      new Divider(
                                                                    thickness:
                                                                        3,
                                                                    color: Theme.of(context).brightness !=
                                                                            Brightness.light
                                                                        ? babyborn
                                                                            ? Colors.white
                                                                            : Color.fromRGBO(158, 158, 158, 1)
                                                                        : Colors.black,
                                                                  ),
                                                                ),
                                                              )
                                                            ]),
                                                        onTap: () {
                                                          setState1(() {
                                                            setStatus(
                                                                'other',
                                                                setState1);
                                                            babyborn =
                                                                !babyborn;
                                                            if (babyborn ==
                                                                true) {
                                                              notpreg =
                                                                  false;
                                                              preg = false;
                                                              nopreg =
                                                                  false;
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
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                top: 18),
                                                        child: Text(
                                                          'I\'m pregnant',
                                                          style: preg
                                                              ? TextStyle(
                                                                  fontSize:
                                                                      18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600)
                                                              : TextStyle(
                                                                  fontSize:
                                                                      18,
                                                                  color: Theme.of(context).brightness !=
                                                                          Brightness
                                                                              .light
                                                                      ? Color.fromRGBO(
                                                                          158,
                                                                          158,
                                                                          158,
                                                                          1)
                                                                      : null),
                                                        ),
                                                      ),
                                                      Spacer(),
                                                      GestureDetector(
                                                        child: Stack(
                                                            alignment:
                                                                Alignment
                                                                    .center,
                                                            children: [
                                                              CustCont(
                                                                  value:
                                                                      preg),
                                                              Padding(
                                                                padding: const EdgeInsets
                                                                        .only(
                                                                    top:
                                                                        28),
                                                                child:
                                                                    Container(
                                                                  width: 47,
                                                                  child:
                                                                      new Divider(
                                                                    thickness:
                                                                        3,
                                                                    color: Theme.of(context).brightness !=
                                                                            Brightness.light
                                                                        ? preg
                                                                            ? Colors.white
                                                                            : Color.fromRGBO(158, 158, 158, 1)
                                                                        : Colors.black,
                                                                  ),
                                                                ),
                                                              )
                                                            ]),
                                                        onTap: () {
                                                          setState1(() {
                                                            setStatus(
                                                                'settrue',
                                                                setState1);

                                                            preg = true;
                                                            if (preg ==
                                                                true) {
                                                              notpreg =
                                                                  false;
                                                              babyborn =
                                                                  false;
                                                              nopreg =
                                                                  false;
                                                            }
                                                            //widget.abcd();
                                                          });
                                                          Navigator.pop(
                                                              context);
                                                          _onRememberMeChanged_2();
                                                        },
                                                      ),
                                                      // CustomCheckbox(
                                                      //     value: babyborn, abcd: check3),
                                                    ],
                                                  ),
                                                  SizedBox(height: 30),
                                                  preg == true // preg == true
                                                      ? Column(
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: <
                                                                  Widget>[
                                                                Text(
                                                                  'Current Month',
                                                                ),
                                                                Text(
                                                                  '$_currentValue month',
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                                height: 10),
                                                            Container(
                                                              height: 150,
                                                              width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width,
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Container(
                                                                    width:
                                                                        55,
                                                                    child: NumberPicker.integer(
                                                                        selectedTextStyle: TextStyle(color: Color.fromRGBO(51, 51, 51, 1), fontSize: 23, fontWeight: FontWeight.w400),
                                                                        initialValue: _currentValue,
                                                                        minValue: 0,
                                                                        maxValue: 11,
                                                                        onChanged: (newValue) => setState1(() {
                                                                              _currentValue = newValue;
                                                                              setStatus1(newValue);
                                                                            })),
                                                                  ),
                                                                  Text(
                                                                    'Months',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            23,
                                                                        fontWeight:
                                                                            FontWeight.w300),
                                                                  ),
                                                                ],
                                                              ),
                                                              decoration:
                                                                  BoxDecoration(
                                                                border:
                                                                    Border(
                                                                  top:
                                                                      BorderSide(
                                                                    width:
                                                                        0.3,
                                                                    color: Theme.of(context).brightness == Brightness.light
                                                                        ? Color.fromRGBO(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            1)
                                                                        : Colors.white38,
                                                                  ),
                                                                  bottom:
                                                                      BorderSide(
                                                                    width:
                                                                        0.3,
                                                                    color: Theme.of(context).brightness == Brightness.light
                                                                        ? Color.fromRGBO(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            1)
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
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              behavior: HitTestBehavior.opaque,
            );
          }),
        );
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
      },
    );
  }

  void _onRememberMeChanged() {
    setState(() {
      if (globals.sw == false) {
        globals.sw = true;
      } else if (globals.sw == true) {
<<<<<<< HEAD
        globals.sw = false;
=======
        showAlertDialog('partner_mode');
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
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
<<<<<<< HEAD
      rememberMe2 = !rememberMe2;
    } else {
      rememberMe2 = !rememberMe2;
      if (rememberMe2) {
        startAddNewTransaction();
      }
=======
      // rememberMe2 = !rememberMe2;
    } else {
      startAddNewTransaction();
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
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
<<<<<<< HEAD
                        style: TextStyle(fontSize: 22),
=======
                        style: globals.sw
                            ? TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w600)
                            : TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context).brightness !=
                                        Brightness.light
                                    ? Color.fromRGBO(158, 158, 158, 1)
                                    : null),
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Transform.translate(
                        offset: Offset(0, -3),
<<<<<<< HEAD
                        child: CustomCheckbox2(
                            value: globals.sw, abcd: _onRememberMeChanged),
=======
                        child:
                            custom_checkbox(globals.sw, _onRememberMeChanged),
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Text(
<<<<<<< HEAD
                        'aassas sjnsdjsd sjdnsjnds dsjdnsjnd sjdnsnd aassas sjnsdjsd sjdnsjnds dsjdnsjnd sjdnsndaassas sjnsdjsd sjdnsjnds dsjdnsjnd sjdnsnd'),
=======
                        'aassas sjnsdjsd sjdnsjnds dsjdnsjnd sjdnsnd aassas sjnsdjsd sjdnsjnds dsjdnsjnd sjdnsndaassas sjnsdjsd sjdnsjnds dsjdnsjnd sjdnsnd',style: TextStyle(color:Theme.of(context).brightness ==
                                            Brightness.light?Colors.black:Color.fromRGBO(158,158,158,1)),),
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
<<<<<<< HEAD
                      Text(
                        'Pregnancy Mode',
                        style: TextStyle(fontSize: 22),
=======
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Pregnancy Mode',
                            style: rememberMe2
                                ? TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w600)
                                : TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w400,
                                    color: Theme.of(context).brightness !=
                                            Brightness.light
                                        ? Color.fromRGBO(158, 158, 158, 1)
                                        : null),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              '$preg_month Months',
                              style: TextStyle(
                                  color: Color.fromRGBO(245, 166, 35, 1)),
                            ),
                          ),
                        ],
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Transform.translate(
                        offset: Offset(0, -3),
<<<<<<< HEAD
                        child: CustomCheckbox(
                            value: rememberMe2, abcd: _onRememberMeChanged_2),
=======
                        child: custom_checkbox(
                            rememberMe2, _onRememberMeChanged_2),
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Text(
<<<<<<< HEAD
                        'aassas sjnsdjsd sjdnsjnds dsjdnsjnd sjdnsnd aassas sjnsdjsd sjdnsjnds dsjdnsjnd sjdnsndaassas sjnsdjsd sjdnsjnds dsjdnsjnd sjdnsnd'),
=======
                        'aassas sjnsdjsd sjdnsjnds dsjdnsjnd sjdnsnd aassas sjnsdjsd sjdnsjnds dsjdnsjnd sjdnsndaassas sjnsdjsd sjdnsjnds dsjdnsjnd sjdnsnd',style: TextStyle(color:Theme.of(context).brightness ==
                                            Brightness.light?Colors.black:Color.fromRGBO(158,158,158,1)),),
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
                  ),
                ],
              ),
            ),
          ],
        )),
<<<<<<< HEAD
=======
        bottomNavigationBar: BottomNavbar(),
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
      ),
    );
  }
}
