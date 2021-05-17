<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:numberpicker/numberpicker.dart';
import 'globals.dart' as globals;
import 'dart:math';
=======
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upcloud_tracker/Settings/get.dart';
import '../bottom_navigator.dart';
import 'globals.dart' as globals;
import 'globals1.dart' as globals1;
import 'dart:math';
import 'post.dart';
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2

class TextEditingControllerWorkaroud extends TextEditingController {
  TextEditingControllerWorkaroud({String text}) : super(text: text);

  void setTextAndPosition(String newText, {int caretPosition}) {
    int offset = caretPosition != null ? caretPosition : newText.length;
    value = value.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: offset),
        composing: TextRange.empty);
  }
}

double roundDouble(double value, int places) {
  double mod = pow(10.0, places);
  return ((value * mod).round().toDouble() / mod);
}
//import 'package:fitted_text_field_container/fitted_text_field_container.dart';

// ignore: must_be_immutable
class Input extends StatefulWidget {
  bool st = false;
  Input({this.st});
  @override
<<<<<<< HEAD
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
=======
  InputState createState() => InputState();
}

class InputState extends State<Input> {
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
  int _currentValue = 0;
  var _currentValue2 = 0;
  var _currentValue3 = 0;
  var _currentValue4 = 0;
  var _currentValue5 = 0;

  bool s1b = false;
  bool s2b = false;
  String sfinal;
  bool status1 = false;
  bool status2 = false;
  bool status3 = false;
  bool status4 = false;
  bool status5 = false;
<<<<<<< HEAD

=======
  
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
  String s1 = '5';
  String s2 = '160';
  String s4 = '10';

  final _heightController = TextEditingControllerWorkaroud(text: '');
  final _height3Controller = TextEditingControllerWorkaroud(text: '');
  final _weightController = TextEditingControllerWorkaroud(text: '');
  final _heightController21 = TextEditingControllerWorkaroud(text: '');
<<<<<<< HEAD
=======
  void initState() {
    super.initState();
    getStatus();
  }

  void getStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      globals1.install_status = (prefs.getBool('installStatus') ?? false);
      if (globals1.install_status == true) {

        sfinal = (prefs.getString('height') ?? '');
        s2 = (prefs.getString('weight') ?? '');

        _currentValue = (prefs.getInt('val') ?? 0);
        _currentValue2 = (prefs.getInt('val2') ?? 0);
        _currentValue3 = (prefs.getInt('val3') ?? 0);
        _currentValue4 = (prefs.getInt('val4') ?? 0);
        _currentValue5 = (prefs.getInt('val5') ?? 0);
        
       

      } else {
        setState(() {
        //getSettings();
        prefs.setBool('installStatus', true);
        getStatus();
        });
      
      }
    });
  }

  void setStatus() async {
    print(_currentValue);
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('height', sfinal);
    prefs.setString('weight', s2);


    prefs.setInt('val', _currentValue);
    prefs.setInt('val2', _currentValue2);
    prefs.setInt('val3', _currentValue3);
    prefs.setInt('val4', _currentValue4);
    prefs.setInt('val5', _currentValue5);

  }
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Center(
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
                    '  Inputs',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 39,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.arrow_upward_sharp,
                    size: 30,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 40,
                    width: 90,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
<<<<<<< HEAD
=======
                          width: 3,
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.black
                                  : Colors.white,
                        ),
                      ),
                    ),
                    child: !s1b
                        ? Transform.translate(
                            offset: Offset(0, -9),
                            child: Container(
                              margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                              width: 60,
                              height: 40,
                              child: Stack(
                                children: [
                                  Positioned(
                                    right: 1,
                                    top: 0,
                                    child: Row(
                                      children: [
                                        Container(
                                          alignment: Alignment.bottomCenter,
                                          //color: Colors.red,
                                          width: 28,
                                          // padding: EdgeInsets.only(
                                          //     bottom: MediaQuery.of(context).viewInsets.bottom),
                                          margin:
                                              EdgeInsets.fromLTRB(30, 0, 0, 0),
                                          child: Row(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.only(
                                                    left: 2, bottom: 2),
                                                width: 20,
                                                child: TextFormField(
<<<<<<< HEAD
=======
                                                  readOnly: true,
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
                                                  //style: TextStyle(fontSize: 17),
                                                  maxLength: 2,
                                                  maxLines: 1,
                                                  onChanged: (text) {
                                                    print(
                                                        "First text field: $text");
                                                    setState(() {
                                                      s4 = text;
                                                      // _height3Controller.value =
                                                      //     TextEditingValue(
                                                      //         text: s4,
                                                      //         selection: TextSelection(
                                                      //             baseOffset:
                                                      //                 s4.length,
                                                      //             extentOffset:
                                                      //                 s4.length));
                                                    });
                                                  },
                                                  controller: _height3Controller
                                                    ..text = s4
                                                    ..selection = TextSelection(
                                                        baseOffset: s4.length,
                                                        extentOffset:
                                                            s4.length),
                                                  scrollPadding:
                                                      EdgeInsets.all(0),
                                                  // textCapitalization:
                                                  //     TextCapitalization.words,
                                                  //style: widget.st2,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 17),
                                                ),
                                              ),
                                              Container(
                                                width: 8,
                                                height: 50,
                                                child: Text('\"',
                                                    style: TextStyle(
                                                      color: Theme.of(context)
                                                                  .brightness ==
                                                              Brightness.light
                                                          ? Colors.black
                                                          : Colors.white,
                                                    )),
                                              ),
                                            ],
                                          ),
                                        ),
                                        // Transform.translate(
                                        //   offset: Offset(0.4, 0.6),
                                        //   child: Container(
                                        //     width: 10,
                                        //     height: 50,
                                        //     child: Text('a', style: TextStyle(color: Colors.black)),
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    left: 1,
                                    top: 0,
                                    child: Container(
                                      //margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                      //color: Colors.blue,
                                      width: 30,
                                      // padding: EdgeInsets.only(
                                      //     bottom: MediaQuery.of(context).viewInsets.bottom),
                                      //margin: EdgeInsets.fromLTRB(0, 0, 0, 12),
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(
                                                left: 2, bottom: 2),
                                            width: 20,
                                            child: TextFormField(
<<<<<<< HEAD
=======
                                              readOnly: true,
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
                                              maxLength: 1,
                                              maxLines: 1,
                                              onChanged: (text) {
                                                setState(() {
                                                  s1 = text;
                                                  // _height3Controller.value =
                                                  //         TextEditingValue(
                                                  //             text: s4,
                                                  //             selection: TextSelection(
                                                  //                 baseOffset:
                                                  //                     s4.length,
                                                  //                 extentOffset:
                                                  //                     s4.length));
                                                });
                                                print(
                                                    "First text field: $text");
                                              },
                                              controller: _heightController
                                                ..text = s1
                                                ..selection = TextSelection(
                                                    baseOffset: s1.length,
                                                    extentOffset: s1.length),
                                              scrollPadding: EdgeInsets.all(0),
                                              textCapitalization:
                                                  TextCapitalization.words,
                                              //style: widget.st2,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 17.0),
                                              // decoration: InputDecoration(
                                              //   border: InputBorder.none,
                                              //   hintText: widget.subtitle,
                                              //   //hintStyle: TextStyle(),
                                              //   // floatingLabelBehavior: FloatingLabelBehavior.auto,
                                              //   fillColor: Colors.transparent,
                                              //   focusColor: Colors.transparent,
                                              //   hoverColor: Colors.transparent,
                                              // ),
                                            ),
                                          ),
                                          Container(
                                            width: 10,
                                            height: 50,
                                            child: Text('\'',
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                                .brightness ==
                                                            Brightness.light
                                                        ? Colors.black
                                                        : Colors.white)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Container(
                            margin: EdgeInsets.fromLTRB(15, 0, 15, 10),
                            width: 60,
                            height: 40,
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                //hintText: widget.subtitle,
                                //hintStyle: TextStyle(),
                                // floatingLabelBehavior: FloatingLabelBehavior.auto,
                                fillColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                              ),
                              //formatInput: false,
                              //maxLength: 1,
                              maxLines: 1,
                              onChanged: (text) {
                                setState(() {
                                  sfinal = text;
                                });
                                print("First text field: $text");
                              },
                              controller: _heightController21
                                ..text = sfinal
                                ..selection = TextSelection(
                                    baseOffset: sfinal.length,
                                    extentOffset: sfinal.length),
                              scrollPadding: EdgeInsets.all(0),
                              textCapitalization: TextCapitalization.words,
                              //style: widget.st2,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 17.0),
                              // decoration: InputDecoration(
                              //   border: InputBorder.none,
                              //   hintText: widget.subtitle,
                              //   //hintStyle: TextStyle(),
                              //   // floatingLabelBehavior: FloatingLabelBehavior.auto,
                              //   fillColor: Colors.transparent,
                              //   focusColor: Colors.transparent,
                              //   hoverColor: Colors.transparent,
                              // ),
                            ),
                          ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  !s1b
                      ? Container(
                          height: 22,
                          width: 22,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            border: Border(
                              bottom: BorderSide(
                                color: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? Colors.black
                                    : Colors.white,
                              ),
                              top: BorderSide(
                                color: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? Colors.black
                                    : Colors.white,
                              ),
                              left: BorderSide(
                                color: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? Colors.black
                                    : Colors.white,
                              ),
                              right: BorderSide(
                                color: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? Colors.black
                                    : Colors.white,
                              ),
                            ),
                          ),
                          child: Center(
                            child: Text('ft'),
                          ),
                        )
                      : InkWell(
                          child: Text('ft'),
                          onTap: () {
                            setState(() {
                              if (sfinal == null || sfinal == '') {
                                sfinal = '0';
                              }
                              double q1 = roundDouble(
                                  0.0328084 * double.parse(sfinal), 2);
                              double q2 = roundDouble(
                                  0.0328084 * double.parse(sfinal), 0);
                              double q3 = (q1 - q2);
                              //*roundDouble(0.0328084*double.parse(sfinal), 2);
                              double q4 = roundDouble(12 * q3, 0);
                              int y7 = q4.toInt();
                              int y6 = q2.toInt();
                              if (y7 < 0) {
                                String aq = y7.toString();
                                y7 = 10 - y7.abs();
                                //pow(10, (aq.length - 1)) - y7;
                                y6 = y6 - 1;
                              }
                              s1 = y6.toString();
                              s4 = y7.toString();
                              // double q4 = roundDouble(
                              //     0.0328084 * double.parse(sfinal), 2);
                              //s1 = q1.toString();
                              s1b = !s1b;
                            });
                          },
                        ),
                  Text('  /  '),
                  InkWell(
                    child: s1b
                        ? Container(
                            height: 22,
                            width: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              border: Border(
                                bottom: BorderSide(
                                  color: Theme.of(context).brightness ==
                                          Brightness.light
                                      ? Colors.black
                                      : Colors.white,
                                ),
                                top: BorderSide(
                                  color: Theme.of(context).brightness ==
                                          Brightness.light
                                      ? Colors.black
                                      : Colors.white,
                                ),
                                left: BorderSide(
                                  color: Theme.of(context).brightness ==
                                          Brightness.light
                                      ? Colors.black
                                      : Colors.white,
                                ),
                                right: BorderSide(
                                  color: Theme.of(context).brightness ==
                                          Brightness.light
                                      ? Colors.black
                                      : Colors.white,
                                ),
                              ),
                            ),
                            child: Center(
                              child: Text('cms'),
                            ),
                          )
                        : Text('cms'),
                    onTap: () {
                      setState(() {
                        if (s1 == null || s1 == '') {
                          s1 = '0';
                        }
                        if (s4 == null || s1 == '') {
                          s4 = '0';
                        }
                        double num1 = roundDouble(30.48 * double.parse(s1), 2);
                        double num2 = roundDouble(2.54 * double.parse(s4), 2);
                        double finaldub = num1 + num2;
                        double dub = roundDouble(finaldub, 2);
                        sfinal = dub.toString();
                        // sfinal = (30.48 * .toStringAsFixed(2)) +
                        //     (2.54 * double.parse(s4).toStringAsFixed(2));
                        s1b = !s1b;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 30,
                    width: 40,
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back,
                          size: 20,
                        ),
                        Icon(
                          Icons.arrow_forward,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 30,
                    width: 90,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
<<<<<<< HEAD
=======
                          width: 3,
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.black
                                  : Colors.white,
                        ),
                      ),
                    ),
                    child: Container(
                      width: 60,
                      margin: EdgeInsets.fromLTRB(25, 0, 15, 10),
                      child: Center(
<<<<<<< HEAD
                        child: TextFormField(
=======
                        child: TextField(
                          readOnly: true,
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            //hintText: widget.subtitle,
                            //hintStyle: TextStyle(),
                            // floatingLabelBehavior: FloatingLabelBehavior.auto,
                            fillColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                          ),
<<<<<<< HEAD
                          //textAlign: TextAlign.center,
=======
                          textAlign: TextAlign.center,
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
                          controller: _weightController
                            ..text = s2
                            ..selection = TextSelection(
                                baseOffset: s2.length, extentOffset: s2.length),
                          keyboardType: TextInputType.number,
                          onChanged: (text) {
                            setState(() {
                              s2 = text;
                            });

                            //_weightController..text = text;
                          },
                          //decoration: InputDecoration(labelText: '5\' 9\'\''),
                        ),
                        //Text('168'),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  s2b
                      ? Container(
                          height: 22,
                          width: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            border: Border(
                              bottom: BorderSide(
                                color: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? Colors.black
                                    : Colors.white,
                              ),
                              top: BorderSide(
                                color: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? Colors.black
                                    : Colors.white,
                              ),
                              left: BorderSide(
                                color: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? Colors.black
                                    : Colors.white,
                              ),
                              right: BorderSide(
                                color: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? Colors.black
                                    : Colors.white,
                              ),
                            ),
                          ),
                          child: Center(
                            child: Text(' kg '),
                          ),
                        )
                      : InkWell(
                          child: Text('kg'),
                          onTap: () {
                            setState(() {
                              s2 = (0.453592 * double.parse(s2))
                                  .toStringAsFixed(2);
                              s2b = !s2b;
                            });
                          }),
                  Text('  / '),
                  !s2b
                      ? Container(
                          height: 22,
                          width: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            border: Border(
                              bottom: BorderSide(
                                color: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? Colors.black
                                    : Colors.white,
                              ),
                              top: BorderSide(
                                color: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? Colors.black
                                    : Colors.white,
                              ),
                              left: BorderSide(
                                color: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? Colors.black
                                    : Colors.white,
                              ),
                              right: BorderSide(
                                color: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? Colors.black
                                    : Colors.white,
                              ),
                            ),
                          ),
                          child: Center(
                            child: Text(' lbs '),
                          ),
                        )
                      : InkWell(
                          child: Text('lbs'),
                          onTap: () {
                            setState(() {
                              double w2 = 2.20462 * double.parse(s2);
                              s2 = w2.toStringAsFixed(1);
                              s2b = !s2b;
                            });
                          }),
                  SizedBox(width: 15),
                ],
              ),
              SizedBox(height: 34),
              Container(
<<<<<<< HEAD
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
=======
                margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        globals.status
                            ? globals.player.play('sound.mp3')
                            : null;
                        setState(() {
<<<<<<< HEAD
                          status1 = !status1;
                          status2 = false;
                          status3 = false;
                          status4 = false;
                          status5 = false;
=======
                          status5 = !status5;
                          status2 = false;
                          status3 = false;
                          status4 = false;
                          status1 = false;
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
                        });
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
<<<<<<< HEAD
                        mainAxisAlignment: MainAxisAlignment.start,
=======
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
                        children: [
                          Row(
                            children: <Widget>[
                              RichText(
                                text: TextSpan(
<<<<<<< HEAD
                                    text: 'Cycle ',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context).brightness ==
                                              Brightness.light
                                          ? Colors.black
                                          : Colors.white,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'Length',
=======
                                    text: 'Sanitary ',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: _currentValue5 != 0
                                          ? FontWeight.w600
                                          : FontWeight.w400,
                                      color: Theme.of(context).brightness ==
                                              Brightness.light
                                          ? Colors.black
                                          : _currentValue5 > 0
                                              ? Color.fromRGBO(255, 98, 98, 1)
                                              : Colors.white,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'Used',
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).brightness ==
                                                        Brightness.light
                                                    ? Colors.black
<<<<<<< HEAD
                                                    : Color.fromRGBO(
                                                        189, 16, 224, 1),
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500),
=======
                                                    : Colors.white,
                                            fontSize: 18,
                                            fontWeight: _currentValue5 > 0
                                                ? FontWeight.w600
                                                : FontWeight.w400),
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
                                      )
                                    ]),
                              ),
                              Spacer(),
<<<<<<< HEAD
                              RichText(
                                text: TextSpan(
                                    text: _currentValue > 0
                                        ? _currentValue.toString()
                                        : '-',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Theme.of(context).brightness ==
                                              Brightness.light
                                          ? Color.fromRGBO(126, 71, 36, 1)
                                          : Color.fromRGBO(189, 16, 224, 1),
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: ' days',
                                        style: TextStyle(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.light
                                              ? Color.fromRGBO(126, 71, 36, 1)
                                              : Colors.white,
                                          fontSize: 15,
                                        ),
                                      )
                                    ]),
=======
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: RichText(
                                  text: TextSpan(
                                      text: _currentValue5 > 0
                                          ? _currentValue5.toString()
                                          : '-',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                        color: Theme.of(context).brightness ==
                                                Brightness.light
                                            ? Colors.black
                                            : _currentValue5 > 0
                                                ? Color.fromRGBO(255, 98, 98, 1)
                                                : Colors.white,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: ' Pads',
                                          style: TextStyle(
                                            color:
                                                Theme.of(context).brightness ==
                                                        Brightness.light
                                                    ? Colors.black
                                                    : Colors.white,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        )
                                      ]),
                                ),
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
<<<<<<< HEAD
                            'Most menstural lasts from 3 to 5 days.Most menstural lasts from 3 to 5 days.',
                            style: TextStyle(
                                fontSize: 13.5, fontWeight: FontWeight.w300),
=======
                            'Most menstural lasts from 3 to 5 days.',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w300),
                          ),
                          SizedBox(
                            height: 13,
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
                          ),
                        ],
                      ),
                    ),
<<<<<<< HEAD
                    //
                    SizedBox(
                      height: 13,
                    ),
=======
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
                    Row(children: <Widget>[
                      Expanded(
                        child: Container(
                            child: Divider(
<<<<<<< HEAD
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.black12
=======
                          thickness: 0.6,
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.black
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
                                  : Colors.white38,
                        )),
                      ),
                    ]),
<<<<<<< HEAD
                    //
                    status1
                        ? Container(
                            height: 160,
                            width: MediaQuery.of(context).size.width,
                            child: NumberPicker.integer(
                                selectedTextStyle: TextStyle(
                                    color: Theme.of(context).brightness ==
                                            Brightness.light
                                        ? Color.fromRGBO(51, 51, 51, 1)
                                        : Color.fromRGBO(189, 16, 224, 1),
                                    //Color.fromRGBO(51, 51, 51, 1),
                                    fontSize: 23,
                                    fontWeight: FontWeight.w400),
                                initialValue: _currentValue,
                                minValue: 0,
                                maxValue: 30,
                                onChanged: (newValue) => setState(() {
                                      _currentValue = newValue;
                                    })),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Theme.of(context).brightness ==
                                          Brightness.light
                                      ? Colors.black12
                                      : Colors.white38,
                                ),
                              ),
                            ),
=======
                    status5
                        ? Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context)
                                        .viewInsets
                                        .bottom),
                                height: 150,
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 55,
                                      child: NumberPicker.integer(
                                          selectedTextStyle: TextStyle(
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.light
                                                  ? Color.fromRGBO(
                                                      51, 51, 51, 1)
                                                  : Color.fromRGBO(
                                                      255, 98, 98, 1),
                                              //,
                                              fontSize: 23,
                                              fontWeight: FontWeight.w400),
                                          initialValue: _currentValue5,
                                          minValue: 0,
                                          maxValue: 30,
                                          onChanged: (newValue) => setState(() {
                                                _currentValue5 = newValue;
                                                setStatus();
                                              })),
                                    ),
                                    Text('Pads',
                                        style: TextStyle(
                                            fontSize: 23,
                                            fontWeight: FontWeight.w300))
                                  ],
                                ),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      width: 0.6,
                                      color: Theme.of(context).brightness ==
                                              Brightness.light
                                          ? Colors.black
                                          : Colors.white38,
                                    ),
                                  ),
                                ),
                              ),
                            ],
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
                          )
                        : SizedBox(),
                    SizedBox(
                      height: 40,
                    ),
                    GestureDetector(
                      onTap: () {
                        globals.status
                            ? globals.player.play('sound.mp3')
                            : null;
                        setState(() {
<<<<<<< HEAD
                          status2 = !status2;
                          status1 = false;
=======
                          status1 = !status1;
                          status2 = false;
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
                          status3 = false;
                          status4 = false;
                          status5 = false;
                        });
                      },
                      child: Column(
<<<<<<< HEAD
=======
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
                        children: [
                          Row(
                            children: <Widget>[
                              RichText(
                                text: TextSpan(
<<<<<<< HEAD
                                    text: 'Period ',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context).brightness ==
                                              Brightness.light
                                          ? Colors.black
                                          : Colors.white,
=======
                                    text: 'Cycle ',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: _currentValue > 0
                                          ? FontWeight.w600
                                          : FontWeight.w400,
                                      color: Theme.of(context).brightness ==
                                              Brightness.light
                                          ? Colors.black
                                          : _currentValue > 0
                                              ? Color.fromRGBO(250, 0, 255, 1)
                                              : Colors.white,
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'Length',
                                        style: TextStyle(
<<<<<<< HEAD
                                            color: Theme.of(context)
                                                        .brightness ==
                                                    Brightness.light
                                                ? Colors.black
                                                : Color.fromRGBO(208, 2, 27, 1),
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500),
=======
                                            color:
                                                Theme.of(context).brightness ==
                                                        Brightness.light
                                                    ? Colors.black
                                                    : Colors.white,
                                            fontSize: 18,
                                            fontWeight: _currentValue > 0
                                                ? FontWeight.w600
                                                : FontWeight.w400),
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
                                      )
                                    ]),
                              ),
                              Spacer(),
<<<<<<< HEAD
                              RichText(
                                text: TextSpan(
                                    text: _currentValue2 > 0
                                        ? _currentValue2.toString()
                                        : '5',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Theme.of(context).brightness ==
                                              Brightness.light
                                          ? Color.fromRGBO(126, 71, 36, 1)
                                          : Color.fromRGBO(208, 2, 27, 1),
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: ' days',
                                        style: TextStyle(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.light
                                              ? Color.fromRGBO(126, 71, 36, 1)
                                              : Colors.white,
                                          fontSize: 15,
                                        ),
                                      )
                                    ]),
=======
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: RichText(
                                  text: TextSpan(
                                      text: _currentValue > 0
                                          ? _currentValue.toString()
                                          : '-',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                        color: Theme.of(context).brightness ==
                                                Brightness.light
                                            ? Colors.black
                                            : _currentValue > 0
                                                ? Color.fromRGBO(250, 0, 255, 1)
                                                : Colors.white,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: ' Days',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            color:
                                                Theme.of(context).brightness ==
                                                        Brightness.light
                                                    ? Colors.black
                                                    : Colors.white,
                                            fontSize: 17,
                                          ),
                                        )
                                      ]),
                                ),
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
<<<<<<< HEAD
                            'Most menstural lasts from 3 to 5 days.Most menstural lasts from 3 to 5 days.',
                            style: TextStyle(
                                fontSize: 13.5, fontWeight: FontWeight.w300),
=======
                            'Most menstural lasts from 3 to 5 days.',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w300),
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
                          ),
                        ],
                      ),
                    ),
<<<<<<< HEAD
=======
                    //
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
                    SizedBox(
                      height: 13,
                    ),
                    Row(children: <Widget>[
                      Expanded(
                        child: Container(
<<<<<<< HEAD
                            child: Divider(
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.black12
                                  : Colors.white38,
                        )),
                      ),
                    ]),
                    status2
                        ? Container(
                            height: 160,
                            width: MediaQuery.of(context).size.width,
                            child: NumberPicker.integer(
                                selectedTextStyle: TextStyle(
                                    color: Theme.of(context).brightness ==
                                            Brightness.light
                                        ? Color.fromRGBO(51, 51, 51, 1)
                                        : Color.fromRGBO(208, 2, 27, 1),
                                    //Color.fromRGBO(51, 51, 51, 1),
                                    fontSize: 23,
                                    fontWeight: FontWeight.w400),
                                initialValue: _currentValue2,
                                minValue: 0,
                                maxValue: 30,
                                onChanged: (newValue) => setState(() {
                                      _currentValue2 = newValue;
                                    })),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Theme.of(context).brightness ==
                                          Brightness.light
                                      ? Colors.black12
=======
                            //padding: EdgeInsets.only(left:30),
                            width: 345,
                            child: Divider(
                              thickness: 0.6,
                              color: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? Colors.black
                                  : Colors.white38,
                            )),
                      ),
                    ]),
                    //
                    status1
                        ? Container(
                            height: 150,
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 55,
                                  child: NumberPicker.integer(
                                      selectedTextStyle: TextStyle(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.light
                                              ? Color.fromRGBO(51, 51, 51, 1)
                                              : Color.fromRGBO(189, 16, 224, 1),
                                          //Color.fromRGBO(51, 51, 51, 1),
                                          fontSize: 23,
                                          fontWeight: FontWeight.w400),
                                      initialValue: _currentValue,
                                      minValue: 0,
                                      maxValue: 30,
                                      onChanged: (newValue) => setState(() {
                                            _currentValue = newValue;
                                            setStatus();
                                          })),
                                ),
                                Text('Days',
                                    style: TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.w300))
                              ],
                            ),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  width: 0.6,
                                  color: Theme.of(context).brightness ==
                                          Brightness.light
                                      ? Colors.black
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
                                      : Colors.white38,
                                ),
                              ),
                            ),
                          )
                        : SizedBox(),
                    SizedBox(
                      height: 40,
                    ),
                    GestureDetector(
                      onTap: () {
                        globals.status
                            ? globals.player.play('sound.mp3')
                            : null;
                        setState(() {
<<<<<<< HEAD
                          status3 = !status3;
                          status2 = false;
                          status1 = false;
=======
                          status2 = !status2;
                          status1 = false;
                          status3 = false;
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
                          status4 = false;
                          status5 = false;
                        });
                      },
                      child: Column(
<<<<<<< HEAD
=======
                        crossAxisAlignment: CrossAxisAlignment.start,
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
                        children: [
                          Row(
                            children: <Widget>[
                              RichText(
                                text: TextSpan(
<<<<<<< HEAD
                                    text: 'Ovulation ',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context).brightness ==
                                              Brightness.light
                                          ? Colors.black
                                          : Colors.white,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'Day',
=======
                                    text: 'Period ',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: _currentValue2 > 0
                                          ? FontWeight.w600
                                          : FontWeight.w400,
                                      color: Theme.of(context).brightness ==
                                              Brightness.light
                                          ? Colors.black
                                          : _currentValue2 > 0
                                              ? Color.fromRGBO(208, 2, 27, 1)
                                              : Colors.white,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'Length',
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).brightness ==
                                                        Brightness.light
                                                    ? Colors.black
<<<<<<< HEAD
                                                    : Color.fromRGBO(
                                                        80, 227, 194, 1),
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500),
=======
                                                    : Colors.white,
                                            fontSize: 18,
                                            fontWeight: _currentValue2 > 0
                                                ? FontWeight.w600
                                                : FontWeight.w400),
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
                                      )
                                    ]),
                              ),
                              Spacer(),
<<<<<<< HEAD
                              RichText(
                                text: TextSpan(
                                    text: _currentValue3 > 0
                                        ? _currentValue3.toString()
                                        : '5',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Theme.of(context).brightness ==
                                              Brightness.light
                                          ? Color.fromRGBO(126, 71, 36, 1)
                                          : Color.fromRGBO(80, 227, 194, 1),
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: ' days',
                                        style: TextStyle(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.light
                                              ? Color.fromRGBO(126, 71, 36, 1)
                                              : Colors.white,
                                          fontSize: 15,
                                        ),
                                      )
                                    ]),
=======
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: RichText(
                                  text: TextSpan(
                                      text: _currentValue2 > 0
                                          ? _currentValue2.toString()
                                          : '-',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17,
                                        color: Theme.of(context).brightness ==
                                                Brightness.light
                                            ? Colors.black
                                            : _currentValue2 > 0
                                                ? Color.fromRGBO(208, 2, 27, 1)
                                                : Colors.white,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: ' Days',
                                          style: TextStyle(
                                            color:
                                                Theme.of(context).brightness ==
                                                        Brightness.light
                                                    ? Colors.black
                                                    : Colors.white,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        )
                                      ]),
                                ),
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
<<<<<<< HEAD
                            'Most menstural lasts from 3 to 5 days.Most menstural lasts from 3 to 5 days.',
                            style: TextStyle(
                                fontSize: 13.5, fontWeight: FontWeight.w300),
=======
                            'Most menstural lasts from 3 to 5 days.',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w300),
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    Row(children: <Widget>[
                      Expanded(
                        child: Container(
                            child: Divider(
<<<<<<< HEAD
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.black12
=======
                          thickness: 0.6,
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.black
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
                                  : Colors.white38,
                        )),
                      ),
                    ]),
<<<<<<< HEAD
                    status3
                        ? Container(
                            height: 160,
                            width: MediaQuery.of(context).size.width,
                            child: NumberPicker.integer(
                                selectedTextStyle: TextStyle(
                                    color: Theme.of(context).brightness ==
                                            Brightness.light
                                        ? Color.fromRGBO(51, 51, 51, 1)
                                        : Color.fromRGBO(80, 227, 194, 1),
                                    //Color.fromRGBO(51, 51, 51, 1),
                                    fontSize: 23,
                                    fontWeight: FontWeight.w400),
                                initialValue: _currentValue3,
                                minValue: 0,
                                maxValue: 30,
                                onChanged: (newValue) => setState(() {
                                      _currentValue3 = newValue;
                                    })),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Theme.of(context).brightness ==
                                          Brightness.light
                                      ? Colors.black12
=======
                    status2
                        ? Container(
                            height: 150,
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 55,
                                  child: NumberPicker.integer(
                                      selectedTextStyle: TextStyle(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.light
                                              ? Color.fromRGBO(51, 51, 51, 1)
                                              : Color.fromRGBO(208, 2, 27, 1),
                                          //Color.fromRGBO(51, 51, 51, 1),
                                          fontSize: 23,
                                          fontWeight: FontWeight.w400),
                                      initialValue: _currentValue2,
                                      minValue: 0,
                                      maxValue: 30,
                                      onChanged: (newValue) => setState(() {
                                            _currentValue2 = newValue;
                                            setStatus();
                                          })),
                                ),
                                Text('Days',
                                    style: TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.w300))
                              ],
                            ),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  width: 0.6,
                                  color: Theme.of(context).brightness ==
                                          Brightness.light
                                      ? Colors.black
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
                                      : Colors.white38,
                                ),
                              ),
                            ),
                          )
                        : SizedBox(),
                    SizedBox(
                      height: 40,
                    ),
                    GestureDetector(
                      onTap: () {
                        globals.status
                            ? globals.player.play('sound.mp3')
                            : null;
                        setState(() {
<<<<<<< HEAD
                          status4 = !status4;
                          status2 = false;
                          status3 = false;
                          status1 = false;
=======
                          status3 = !status3;
                          status2 = false;
                          status1 = false;
                          status4 = false;
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
                          status5 = false;
                        });
                      },
                      child: Column(
<<<<<<< HEAD
=======
                        crossAxisAlignment: CrossAxisAlignment.start,
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
                        children: [
                          Row(
                            children: <Widget>[
                              RichText(
                                text: TextSpan(
<<<<<<< HEAD
                                    text: 'PMS ',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context).brightness ==
                                              Brightness.light
                                          ? Colors.black
                                          : Colors.white,
=======
                                    text: 'Ovulation ',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: _currentValue3 > 0
                                          ? FontWeight.w600
                                          : FontWeight.w400,
                                      color: Theme.of(context).brightness ==
                                              Brightness.light
                                          ? Colors.black
                                          : _currentValue3 > 0
                                              ? Color.fromRGBO(80, 227, 194, 1)
                                              : Colors.white,
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'Length',
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).brightness ==
                                                        Brightness.light
                                                    ? Colors.black
<<<<<<< HEAD
                                                    : Color.fromRGBO(
                                                        245, 166, 35, 1),
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500),
=======
                                                    : Colors.white,
                                            fontSize: 18,
                                            fontWeight: _currentValue3 > 0
                                                ? FontWeight.w600
                                                : FontWeight.w400),
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
                                      )
                                    ]),
                              ),
                              Spacer(),
<<<<<<< HEAD
                              RichText(
                                text: TextSpan(
                                    text: _currentValue4 > 0
                                        ? _currentValue4.toString()
                                        : '5',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Theme.of(context).brightness ==
                                              Brightness.light
                                          ? Color.fromRGBO(126, 71, 36, 1)
                                          : Color.fromRGBO(245, 166, 35, 1),
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: ' days',
                                        style: TextStyle(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.light
                                              ? Color.fromRGBO(126, 71, 36, 1)
                                              : Colors.white,
                                          fontSize: 15,
                                        ),
                                      )
                                    ]),
=======
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: RichText(
                                  text: TextSpan(
                                      text: _currentValue3 > 0
                                          ? _currentValue3.toString()
                                          : '-',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                        color: Theme.of(context).brightness ==
                                                Brightness.light
                                            ? Colors.black
                                            : _currentValue3 > 0
                                                ? Color.fromRGBO(
                                                    80, 227, 194, 1)
                                                : Colors.white,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: ' Days',
                                          style: TextStyle(
                                            color:
                                                Theme.of(context).brightness ==
                                                        Brightness.light
                                                    ? Colors.black
                                                    : Colors.white,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        )
                                      ]),
                                ),
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
<<<<<<< HEAD
                            'Most menstural lasts from 3 to 5 days.Most menstural lasts from 3 to 5 days.',
                            style: TextStyle(
                                fontSize: 13.5, fontWeight: FontWeight.w300),
                          ),
                          SizedBox(
                            height: 13,
=======
                            'Most menstural lasts from 3 to 5 days.',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w300),
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
                          ),
                        ],
                      ),
                    ),
<<<<<<< HEAD
=======
                    SizedBox(
                      height: 13,
                    ),
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
                    Row(children: <Widget>[
                      Expanded(
                        child: Container(
                            child: Divider(
<<<<<<< HEAD
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.black12
=======
                          thickness: 0.6,
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.black
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
                                  : Colors.white38,
                        )),
                      ),
                    ]),
<<<<<<< HEAD
                    status4
                        ? Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context)
                                        .viewInsets
                                        .bottom),
                                height: 160,
                                width: MediaQuery.of(context).size.width,
                                child: NumberPicker.integer(
                                    selectedTextStyle: TextStyle(
                                        color: Theme.of(context).brightness ==
                                                Brightness.light
                                            ? Color.fromRGBO(51, 51, 51, 1)
                                            : Color.fromRGBO(245, 166, 35, 1),
                                        //,
                                        fontSize: 23,
                                        fontWeight: FontWeight.w400),
                                    initialValue: _currentValue4,
                                    minValue: 0,
                                    maxValue: 30,
                                    onChanged: (newValue) => setState(() {
                                          _currentValue4 = newValue;
                                        })),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Theme.of(context).brightness ==
                                              Brightness.light
                                          ? Colors.black12
                                          : Colors.white38,
                                    ),
                                  ),
                                ),
                              ),
                            ],
=======
                    status3
                        ? Container(
                            height: 150,
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 55,
                                  child: NumberPicker.integer(
                                      selectedTextStyle: TextStyle(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.light
                                              ? Color.fromRGBO(51, 51, 51, 1)
                                              : Color.fromRGBO(80, 227, 194, 1),
                                          //Color.fromRGBO(51, 51, 51, 1),
                                          fontSize: 23,
                                          fontWeight: FontWeight.w400),
                                      initialValue: _currentValue3,
                                      minValue: 0,
                                      maxValue: 30,
                                      onChanged: (newValue) => setState(() {
                                            _currentValue3 = newValue;
                                            setStatus();
                                          })),
                                ),
                                Text('Days',
                                    style: TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.w300))
                              ],
                            ),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  width: 0.6,
                                  color: Theme.of(context).brightness ==
                                          Brightness.light
                                      ? Colors.black
                                      : Colors.white38,
                                ),
                              ),
                            ),
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
                          )
                        : SizedBox(),
                    SizedBox(
                      height: 40,
                    ),
<<<<<<< HEAD
                    ////////////////
=======
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
                    GestureDetector(
                      onTap: () {
                        globals.status
                            ? globals.player.play('sound.mp3')
                            : null;
                        setState(() {
<<<<<<< HEAD
                          status5 = !status5;
                          status2 = false;
                          status3 = false;
                          status4 = false;
                          status1 = false;
                        });
                      },
                      child: Column(
=======
                          status4 = !status4;
                          status2 = false;
                          status3 = false;
                          status1 = false;
                          status5 = false;
                        });
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
                        children: [
                          Row(
                            children: <Widget>[
                              RichText(
                                text: TextSpan(
<<<<<<< HEAD
                                    text: 'Sanitary ',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context).brightness ==
                                              Brightness.light
                                          ? Colors.black
                                          : Colors.white,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'Used',
=======
                                    text: 'PMS ',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: _currentValue4 > 0
                                          ? FontWeight.w600
                                          : FontWeight.w400,
                                      color: Theme.of(context).brightness ==
                                              Brightness.light
                                          ? Colors.black
                                          : _currentValue4 > 0
                                              ? Color.fromRGBO(245, 166, 35, 1)
                                              : Colors.white,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'Length',
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).brightness ==
                                                        Brightness.light
                                                    ? Colors.black
<<<<<<< HEAD
                                                    : Color.fromRGBO(
                                                        245, 166, 35, 1),
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500),
=======
                                                    : Colors.white,
                                            fontSize: 18,
                                            fontWeight: _currentValue4 > 0
                                                ? FontWeight.w600
                                                : FontWeight.w400),
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
                                      )
                                    ]),
                              ),
                              Spacer(),
<<<<<<< HEAD
                              RichText(
                                text: TextSpan(
                                    text: _currentValue5 > 0
                                        ? _currentValue5.toString()
                                        : '5',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Theme.of(context).brightness ==
                                              Brightness.light
                                          ? Color.fromRGBO(126, 71, 36, 1)
                                          : Color.fromRGBO(245, 166, 35, 1),
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: ' Pads',
                                        style: TextStyle(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.light
                                              ? Color.fromRGBO(126, 71, 36, 1)
                                              : Colors.white,
                                          fontSize: 15,
                                        ),
                                      )
                                    ]),
=======
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: RichText(
                                  text: TextSpan(
                                      text: _currentValue4 > 0
                                          ? _currentValue4.toString()
                                          : '-',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                        color: Theme.of(context).brightness ==
                                                Brightness.light
                                            ? Colors.black
                                            : _currentValue4 > 0
                                                ? Color.fromRGBO(
                                                    245, 166, 35, 1)
                                                : Colors.white,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: ' Days',
                                          style: TextStyle(
                                            color:
                                                Theme.of(context).brightness ==
                                                        Brightness.light
                                                    ? Colors.black
                                                    : Colors.white,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        )
                                      ]),
                                ),
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
<<<<<<< HEAD
                            'Most menstural lasts from 3 to 5 days.Most menstural lasts from 3 to 5 days.',
                            style: TextStyle(
                                fontSize: 13.5, fontWeight: FontWeight.w300),
=======
                            'Most menstural lasts from 3 to 5 days.',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w300),
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
                          ),
                          SizedBox(
                            height: 13,
                          ),
                        ],
                      ),
                    ),
                    Row(children: <Widget>[
                      Expanded(
                        child: Container(
                            child: Divider(
<<<<<<< HEAD
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.black12
=======
                          thickness: 0.6,
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.black
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
                                  : Colors.white38,
                        )),
                      ),
                    ]),
<<<<<<< HEAD
                    status5
=======
                    status4
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
                        ? Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context)
                                        .viewInsets
                                        .bottom),
<<<<<<< HEAD
                                height: 160,
                                width: MediaQuery.of(context).size.width,
                                child: NumberPicker.integer(
                                    selectedTextStyle: TextStyle(
                                        color: Theme.of(context).brightness ==
                                                Brightness.light
                                            ? Color.fromRGBO(51, 51, 51, 1)
                                            : Color.fromRGBO(245, 166, 35, 1),
                                        //,
                                        fontSize: 23,
                                        fontWeight: FontWeight.w400),
                                    initialValue: _currentValue5,
                                    minValue: 0,
                                    maxValue: 30,
                                    onChanged: (newValue) => setState(() {
                                          _currentValue5 = newValue;
                                        })),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Theme.of(context).brightness ==
                                              Brightness.light
                                          ? Colors.black12
=======
                                height: 150,
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 55,
                                      child: NumberPicker.integer(
                                          selectedTextStyle: TextStyle(
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.light
                                                  ? Color.fromRGBO(
                                                      51, 51, 51, 1)
                                                  : Color.fromRGBO(
                                                      245, 166, 35, 1),
                                              //,
                                              fontSize: 23,
                                              fontWeight: FontWeight.w400),
                                          initialValue: _currentValue4,
                                          minValue: 0,
                                          maxValue: 30,
                                          onChanged: (newValue) => setState(() {
                                                _currentValue4 = newValue;
                                                setStatus();
                                              })),
                                    ),
                                    Text('Days',
                                        style: TextStyle(
                                            fontSize: 23,
                                            fontWeight: FontWeight.w300))
                                  ],
                                ),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      width: 0.6,
                                      color: Theme.of(context).brightness ==
                                              Brightness.light
                                          ? Colors.black
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
                                          : Colors.white38,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : SizedBox(),
<<<<<<< HEAD
=======

                    ////////////////
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
                  ],
                ),
              ),
            ],
          )),
        ),
<<<<<<< HEAD
=======
        bottomNavigationBar: BottomNavbar(),
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
      ),
    );
  }
}
