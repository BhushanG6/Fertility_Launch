import '../widgets/custom_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:rounded_modal/rounded_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:numberpicker/numberpicker.dart';

import 'globals.dart' as globals;

class OverLayRem extends StatefulWidget {
  bool val1 = false;
  TimeOfDay period_start_now1 = TimeOfDay(hour: 10, minute: 10);
  int _currentValue1 = 9;
  final _titleController1 = TextEditingController();

  @override
  _OverLayRemState createState() => _OverLayRemState();
}

class _OverLayRemState extends State<OverLayRem> {
  DateTime _setDate = DateTime.now();
  Duration initialtimer = new Duration();
  int selectitem = 1;
  bool showdays = false;
  bool showtimer = false;
  @override
  Widget build(BuildContext context) {
    showRoundedModalBottomSheet(
        color: Theme.of(context).brightness == Brightness.light
            ? Colors.white
            : Colors.black,
        radius: 50,
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.75,
            margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
            padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
            child: Column(
              //mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Cancel',
                          style: TextStyle(color: Colors.blue),
                        )),
                    Spacer(),
                    FlatButton(
                        onPressed: () {
                          setState(() {
                            globals.start_time = widget.period_start_now1;
                            globals.start_day = widget._currentValue1;
                            globals.val1 = true;
                          });
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Done',
                          style: TextStyle(color: Colors.blue),
                        )),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Column(
                    children: [
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Remind me at',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400),
                          ),
                          Spacer(),
                          FlatButton(
                            onPressed: () {
                              setState(() {
                                showtimer = true;
                              });
                            },
                            //startPeriodTime1,
                            child: Text(
                              // widget.start_time != null
                              //     ? widget.start_time.format(context)
                              //     :
                              widget.period_start_now1.format(context),
                              //widget.start_time.format(context),
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                          showtimer
                              ? Container(
                                  height: 160,
                                  width: MediaQuery.of(context).size.width,
                                  child: CupertinoDatePicker(
                                    initialDateTime: DateTime.now(),
                                    onDateTimeChanged: (DateTime newdate) {
                                      widget.period_start_now1 =
                                          TimeOfDay.fromDateTime(newdate);
                                      // setState(() {
                                      // });
                                      print(newdate);
                                    },
                                    maximumDate: new DateTime(2020, 12, 30),
                                    minimumYear: 2010,
                                    maximumYear: 2020,
                                    minuteInterval: 1,
                                    mode: CupertinoDatePickerMode.time,
                                  ),
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
                                )
                              : SizedBox(),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'From when to start',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400),
                          ),
                          FlatButton(
                            onPressed: () {
                              setState(() {
                                showdays = true;
                              });
                            },
                            //startPeriodsDays1,
                            child: Text(
                              // widget.start_day != null
                              //     ? '${widget.start_day} days'
                              //     :
                              '${widget._currentValue1} days',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                      showdays
                          ? Container(
                              height: 160,
                              width: MediaQuery.of(context).size.width,
                              child: NumberPicker.integer(
                                  initialValue: widget._currentValue1,
                                  minValue: 0,
                                  maxValue: 30,
                                  onChanged: (newValue) => setState(() {
                                        widget._currentValue1 = newValue;
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
                            )
                          : SizedBox(),
                      SizedBox(
                        height: 18,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Cycles',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      TextField(
                        controller: widget._titleController1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}

// ignore: must_be_immutable
class Rem2 extends StatefulWidget {
  int start_day; //Period Start Day
  String str; //Cycles
  TimeOfDay start_time; //Period Start Time
  int end_day; //Period End Day
  String str_end; //Cycles
  TimeOfDay end_time; //Period End Time
  int ovul_day; //Period Ovul Day
  String str_ovul; //Cycles
  TimeOfDay ovul_time; //Period Ovul Time
  Rem2(
      {this.start_day,
      this.start_time,
      this.str,
      this.end_day,
      this.end_time,
      this.ovul_day,
      this.ovul_time,
      this.str_end,
      this.str_ovul});
  @override
  _Rem2State createState() => _Rem2State();
}

class _Rem2State extends State<Rem2> {
  // OverLayRem o1;

  bool val1 = false;
  bool val2 = false;
  bool val3 = false;
  TimeOfDay period_start_now1 = TimeOfDay(hour: 10, minute: 10);
  TimeOfDay period_start_now2 = TimeOfDay(hour: 10, minute: 10);
  TimeOfDay period_start_now3 = TimeOfDay(hour: 10, minute: 10);

  int _currentValue1 = 9;
  int _currentValue2 = 9;
  int _currentValue3 = 9;
  final _titleController1 = TextEditingController();
  final _titleController2 = TextEditingController();
  final _titleController3 = TextEditingController();

  bool conraception = false;
  bool pills = false;

  void check1() {
    conraception = !conraception;
  }

  void check2() {
    pills = !pills;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.navigate_before,
                  size: 30,
                ),
              ),
              Container(
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
              Text(
                '  Reminder',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Spacer(),
              FlatButton(
                  onPressed: () {},
                  child: Text(
                    'Done',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  )),
            ],
          ),
          Container(
            // margin: EdgeInsets.fromLTRB(20, 10, 20, 30),
            padding: EdgeInsets.all(10),
            child: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 47,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Cycles',
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Period start',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  globals.start_time != null &&
                                          globals.start_day != null
                                      ? globals.start_time.format(context) +
                                          ' - ' +
                                          globals.start_day.toString() +
                                          ' days'
                                      : '',
                                  style: TextStyle(color: Colors.red),
                                  textAlign: TextAlign.left,
                                ),
                                // Text(
                                //   widget.start_time != null &&
                                //           widget.start_day != null
                                //       ? widget.start_time.format(context) +
                                //           ' - ' +
                                //           widget.start_day.toString() +
                                //           ' days'
                                //       : '',
                                //   style: TextStyle(color: Colors.red),
                                //   textAlign: TextAlign.left,
                                // ),
                              ],
                            ),
                            Spacer(),
                            CustomCheckbox(
                                value: val1,
                                abcd:

                                    //startAddNewTransaction1
                                    () {
                                  OverLayRem();
                                }),
                          ],
                        ),
                        SizedBox(
                          height: 21,
                        ),
                        Row(
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Period end',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  widget.end_time != null &&
                                          widget.end_day != null
                                      ? widget.end_time.format(context) +
                                          ' - ' +
                                          widget.end_day.toString() +
                                          ' days'
                                      : '',
                                  style: TextStyle(color: Colors.red),
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                            Spacer(),
                            CustomCheckbox(
                                value: val2,
                                abcd:
                                    //startAddNewTransaction2
                                    () {}),
                          ],
                        ),
                        SizedBox(
                          height: 21,
                        ),
                        Row(
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Ovulation',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  widget.ovul_time != null &&
                                          widget.ovul_day != null
                                      ? widget.ovul_time.format(context) +
                                          ' - ' +
                                          widget.ovul_day.toString() +
                                          ' days'
                                      : '',
                                  style: TextStyle(color: Colors.red),
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                            Spacer(),
                            CustomCheckbox(
                                value: val3,
                                abcd: (
                                    //startAddNewTransaction3
                                    ) {}),
                          ],
                        ),
                        SizedBox(
                          height: 42,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Medication and Contraception',
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              'Contraception',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w600),
                            ),
                            Spacer(),
                            CustomCheckbox(value: conraception, abcd: check1),
                          ],
                        ),
                        SizedBox(
                          height: 27,
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              'Pills',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w600),
                            ),
                            Spacer(),
                            CustomCheckbox(value: pills, abcd: check2),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
