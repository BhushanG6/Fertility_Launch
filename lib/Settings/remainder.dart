import 'dart:ui';

import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rounded_modal/rounded_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upcloud_tracker/Settings/get.dart';
import 'package:upcloud_tracker/Settings/sharedPrefs.dart';
import 'package:upcloud_tracker/year/year.dart';
import '../bottom_navigator.dart';
import 'Notification/notificationHelper.dart';
import 'globals.dart' as globals;
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'globals1.dart' as globals1;
import 'customizedNotification.dart';

class RemainderAgain extends StatefulWidget {
  int start_day;
  
  String str;
  TimeOfDay start_time;
  int end_day;
  String str_end;
  TimeOfDay end_time;
  int ovul_day;
  String str_ovul;
  TimeOfDay ovul_time;
  RemainderAgain(
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
  RemainderAgainState createState() => RemainderAgainState();
}

class RemainderAgainState extends State<RemainderAgain> {
  @override
  final _titleController_alert = TextEditingController();
  
  // added variables

  // offset
  int period_offset = 0;
  int period_end_offset = 19;
  int ovulation_offset = 20;
  int pills_offset = 40;

  DateTime period_day =
      DateTime.now().add(Duration(days: 10)); // assumes period happens in 10 days from current day
  DateTime ovulaiton_day =
      DateTime.now().add(Duration(days: 5)); //assumes ovulation happens in 5 days from current day

  bool from_datepicker=false;
  String frompillsdate ='';
  
  DateTime from_datepill;
  DateTime till_datepill;  
   

  // added varables ends 

  bool pad = false;
  bool period_alert = false;
  bool period_alertval = false;
  int pill_interval = 0;
  bool tampons = false;
  bool cloth = false;
  //////////////////
  bool val1 = false;
  bool val2 = false;
  bool val3 = false;
  bool val_pads = false;
  bool alert = false;
  var period_start_now1 = TimeOfDay(hour: 10, minute: 10);
  var period_start_now2 = TimeOfDay(hour: 0, minute: 0);
  var period_start_now3 = TimeOfDay(hour: 0, minute: 0);
  int diffdate = 0;

  int _currentValue1 = 9;
  int _currentValue2 = 0;
  int _currentValue3 = 0;
  String from = '';
  final pillname = TextEditingController();
  final pills_ovul = TextEditingController();
  final _titleController1 = TextEditingController();
  final _titleController2 = TextEditingController();
  final _titleController3 = TextEditingController();
  var pillsdate = '';
  bool conraception = false;
  bool pills = false;

  var selectedsanitary = 'Nothing';

  String no_stages = '';

  bool d11 = false;
  bool d12 = false;
  bool d13 = false;
  bool d14 = false;
  bool d15 = false;
  bool d16 = false;
  bool d21 = false;
  bool d22 = false;
  bool d23 = false;
  bool d24 = false;
  bool d25 = false;
  bool d26 = false;
  bool d31 = false;
  bool d32 = false;
  bool d33 = false;
  bool d34 = false;
  bool d35 = false;
  bool d36 = false;
//pills interval
  bool d1 = false;
  bool d2 = false;
  bool d3 = false;
  bool d4 = false;
  bool d5 = false;
  bool d6 = false;
  void initState() {
    super.initState();
    getStatus();
    getpillsStatus();
  }

  getpillsStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    d1 = (prefs.getBool('p1') ?? false);
    d2 = (prefs.getBool('p2') ?? false);
    d3 = (prefs.getBool('p3') ?? false);
    d4 = (prefs.getBool('p4') ?? false);
    d5 = (prefs.getBool('p5') ?? false);
    d6 = (prefs.getBool('p6') ?? false);
  }

  void getStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      //sanitary used
      globals1.install_status1 = (prefs.getBool('installStatus1') ?? false);
      if (globals1.install_status1 == true) {
        selectedsanitary = (prefs.getString('select_sanitary') ?? "Nothing");

        pad = (prefs.getBool('pad') ?? false);
        tampons = (prefs.getBool('tampons') ?? false);
        cloth = (prefs.getBool('cloth') ?? false);

        if (pad || tampons || cloth)
          val_pads = true;
        else
          val_pads = false;

        globals1.d11 = d11 = (prefs.getBool('once1') ?? false);
        globals1.d12 = d12 = (prefs.getBool('twice1') ?? false);
        globals1.d13 = d13 = (prefs.getBool('thrice1') ?? false);
        globals1.d14 = d14 = (prefs.getBool('4times1') ?? false);
        globals1.d15 = d15 = (prefs.getBool('5hours1') ?? false);
        globals1.d16 = d16 = (prefs.getBool('2hours1') ?? false);
        globals1.d21 = d21 = (prefs.getBool('once2') ?? false);
        globals1.d22 = d22 = (prefs.getBool('twice2') ?? false);
        globals1.d23 = d23 = (prefs.getBool('thrice2') ?? false);
        globals1.d24 = d24 = (prefs.getBool('4times2') ?? false);
        globals1.d25 = d25 = (prefs.getBool('5hours2') ?? false);
        globals1.d26 = d26 = (prefs.getBool('2hours2') ?? false);
        globals1.d31 = d31 = (prefs.getBool('once3') ?? false);
        globals1.d32 = d32 = (prefs.getBool('twice3') ?? false);
        globals1.d33 = d33 = (prefs.getBool('thrice3') ?? false);
        globals1.d34 = d34 = (prefs.getBool('4times3') ?? false);
        globals1.d35 = d35 = (prefs.getBool('5hours3') ?? false);
        globals1.d36 = d36 = (prefs.getBool('2hours3') ?? false);
        //Period alert
        period_start_now2 = TimeOfDay(
            hour: int.parse((prefs.getString('remindmeat')).substring(0, 2)),
            minute: int.parse((prefs.getString('remindmeat')).substring(3, 5)));
        print(globals1.remindmeat);
        globals1.alert = alert = (prefs.getBool('periodalert') ?? false);
        globals1.fromwhentostart =
            _currentValue2 = (prefs.getInt('fromwhentost') ?? 0);
        globals1.remindermessage =
            _titleController2.text = (prefs.getString('remindermessage') ?? '');

        //periodend
        globals1.reminderEnd = _titleController_alert.text =
            (prefs.getString('reminderend') ?? '');

        globals1.periodend =
            period_alertval = (prefs.getBool('periodendbool') ?? false);

        //ovulation
        period_start_now3 = TimeOfDay(
            hour: int.parse((prefs.getString('remindmeatovu')).substring(0, 2)),
            minute:
                int.parse((prefs.getString('remindmeatovu')).substring(3, 5)));
        // period_start_now3=(prefs.get('remindmeatovu'));
        globals1.ovulation = val3 = (prefs.getBool('ovulation') ?? false);
        globals1.fromwhentostartovu =
            _currentValue3 = (prefs.getInt('fromwhentostovu') ?? 0);
        globals1.remindermessageovu = _titleController3.text =
            (prefs.getString('remindermessageovu') ?? '');

        //pills
        globals1.pills = pills = (prefs.getBool('pills') ?? false);
        from = (prefs.getString('from') ?? '');
        //from=from.substring(8,9)+'/'+from.substring(5,7)+'/'+from.substring(0,4);

        globals1.till = pillsdate = (prefs.getString('till') ?? '');
        diffdate = DateTime(
                int.parse(pillsdate.substring(6, 10)),
                int.parse(pillsdate.substring(3, 5)),
                int.parse(pillsdate.substring(0, 2)))
            .difference(DateTime.now())
            .inDays;

        //pillsdate=pillsdate.substring(8,10)+'/'+pillsdate.substring(5,7)+'/'+pillsdate.substring(0,4);
        globals1.numberofpills =
            pill_interval = (prefs.getInt('numberofpills') ?? 0);
        globals1.nameofpill =
            pillname.text = (prefs.getString('nameofpills') ?? '');
        globals1.remindermessagepills =
            pills_ovul.text = (prefs.getString('remindermessagepills') ?? '');

        //contraception
        globals1.contraception =
            conraception = (prefs.getBool('contraception') ?? false);
      } else {
        //setStatus();
        prefs.setBool('installStatus1', true);
        getStatus();
      }
    });
  }

  void setStatus() async {
    final prefs = await SharedPreferences.getInstance();

    if (pad == true) {
      d21 = false;
      d22 = false;
      d23 = false;
      d24 = false;
      d25 = false;
      d26 = false;
      d31 = false;
      d32 = false;
      d33 = false;
      d34 = false;
      d35 = false;
      d36 = false;
    }
    if (tampons == true) {
      d11 = false;
      d12 = false;
      d13 = false;
      d14 = false;
      d15 = false;
      d16 = false;
      d31 = false;
      d32 = false;
      d33 = false;
      d34 = false;
      d35 = false;
      d36 = false;
    }
    if (cloth == true) {
      d11 = false;
      d12 = false;
      d13 = false;
      d14 = false;
      d15 = false;
      d16 = false;
      d21 = false;
      d22 = false;
      d23 = false;
      d24 = false;
      d25 = false;
      d26 = false;
    }
    //sanitary used
    if (pad || tampons || cloth)
      prefs.setString('select_sanitary', selectedsanitary);

    prefs.setBool('val_pad', val_pads);
    prefs.setBool('pad', pad);
    prefs.setBool('tampons', tampons);
    prefs.setBool('cloth', cloth);

    prefs.setBool('once1', d11);
    prefs.setBool('twice1', d12);
    prefs.setBool('thrice1', d13);
    prefs.setBool('4times1', d14);
    prefs.setBool('5hours1', d15);
    prefs.setBool('2hours1', d16);
    prefs.setBool('once2', d21);
    prefs.setBool('twice2', d22);
    prefs.setBool('thrice2', d23);
    prefs.setBool('4times2', d24);
    prefs.setBool('5hours2', d25);
    prefs.setBool('2hours2', d26);
    prefs.setBool('once3', d31);
    prefs.setBool('twice3', d32);
    prefs.setBool('thrice3', d33);
    prefs.setBool('4times3', d34);
    prefs.setBool('5hours3', d35);
    prefs.setBool('2hours3', d36);
    //period alert
    prefs.setString(
        'remindmeat',
        period_start_now2.toString().substring(10, 13) +
            period_start_now2.toString().substring(13, 15));

    prefs.setInt('fromwhentost', _currentValue2);
    prefs.setBool('periodalert', alert);
    prefs.setString('remindermessage', _titleController2.text);

    //periodend
    prefs.setBool('periodendbool', period_alertval);
    prefs.setString('reminderend', _titleController_alert.text);

    //ovulation

    prefs.setString(
        'remindmeatovu',
        period_start_now3.toString().substring(10, 13) +
            period_start_now3.toString().substring(13, 15));
    print(period_start_now3.minute);
    prefs.setInt('fromwhentostovu', _currentValue3);
    prefs.setBool('ovulation', val3);
    prefs.setString('remindermessageovu', _titleController3.text);

    //pills
    prefs.setBool('pills', pills);
    prefs.setString(
        'from',
        '${DateTime.now().day}' +
            '/' +
            '${DateTime.now().month}' +
            '/' +
            '${DateTime.now().year}');
    prefs.setString('till', pillsdate);
    prefs.setInt('numberofpills', pill_interval);
    prefs.setString('nameofpills', pillname.text);
    prefs.setString('remindermessagepills', pills_ovul.text);

//contraception

    prefs.setBool('contraception', conraception);
  }

  showAlertDialog(String para, Function setState2) {
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
        setState2(() {
          val_pads = false;
          selectedsanitary = 'Nothing';
          if (para == 'pad')
            pad = !pad;
          else if (para == 'tampons')
            tampons = !tampons;
          else
            cloth = !cloth;
        });
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

  Widget datetime() {
    return CupertinoDatePicker(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? Colors.white
          : Colors.black,
      initialDateTime: DateTime.now(),
      onDateTimeChanged: (DateTime newdate) {
        setState(() {
          period_start_now1 = TimeOfDay.fromDateTime(newdate);
        });
        print(newdate);
      },
      maximumDate: new DateTime(2020, 12, 30),
      minimumYear: 2010,
      maximumYear: 2020,
      minuteInterval: 1,
      mode: CupertinoDatePickerMode.time,
    );
  }

  Widget datetime2() {
    return CupertinoDatePicker(
      initialDateTime: DateTime.now(),
      onDateTimeChanged: (DateTime newdate) {
        period_start_now2 = TimeOfDay.fromDateTime(newdate);
        print(newdate);
      },
      maximumDate: new DateTime(2020, 12, 30),
      minimumYear: 2010,
      maximumYear: 2020,
      minuteInterval: 1,
      mode: CupertinoDatePickerMode.time,
    );
  }

  Widget datetime3() {
    return CupertinoDatePicker(
      initialDateTime: DateTime.now(),
      onDateTimeChanged: (DateTime newdate) {
        period_start_now3 = TimeOfDay.fromDateTime(newdate);
        print(newdate);
      },
      maximumDate: new DateTime(2020, 12, 30),
      minimumYear: 2010,
      maximumYear: 2020,
      minuteInterval: 1,
      mode: CupertinoDatePickerMode.time,
    );
  }

  DateTime _setDate = DateTime.now();
  Duration initialtimer = new Duration();
  int selectitem = 1;

  Widget time() {
    return CupertinoTimerPicker(
      mode: CupertinoTimerPickerMode.hms,
      minuteInterval: 1,
      secondInterval: 1,
      initialTimerDuration: initialtimer,
      onTimerDurationChanged: (Duration changedtimer) {
        setState(() {
          initialtimer = changedtimer;
          widget.start_time = period_start_now1;
        });
      },
    );
  }

  void startPeriodsDays1() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.black12
                      : Colors.white38,
                ),
              ),
            ),
            height: 195,
            //MediaQuery.of(context).copyWith().size.height / 3.5,
            child: NumberPicker.integer(
                selectedTextStyle: TextStyle(
                    color: Color.fromRGBO(51, 51, 51, 1),
                    fontSize: 23,
                    fontWeight: FontWeight.w400),
                highlightSelectedValue: true,
                initialValue: _currentValue1,
                minValue: 0,
                maxValue: 17,
                onChanged: (newVal) {
                  _currentValue1 = newVal;
                }),
          );
        });
  }

  void startPeriodsDays2() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.black12
                      : Colors.white38,
                ),
              ),
            ),
            height: MediaQuery.of(context).copyWith().size.height / 3,
            child: NumberPicker.integer(
                selectedTextStyle: TextStyle(
                    color: Color.fromRGBO(51, 51, 51, 1),
                    fontSize: 23,
                    fontWeight: FontWeight.w400),
                initialValue: _currentValue2,
                minValue: 0,
                maxValue: 17,
                onChanged: (newVal) => setState(() => _currentValue2 = newVal)),
          );
        });
  }

  void startPeriodsDays3() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: MediaQuery.of(context).copyWith().size.height / 3,
            child: NumberPicker.integer(
                selectedTextStyle: TextStyle(
                    color: Color.fromRGBO(51, 51, 51, 1),
                    fontSize: 23,
                    fontWeight: FontWeight.w400),
                initialValue: _currentValue3,
                minValue: 0,
                maxValue: 17,
                onChanged: (newVal) => setState(() => _currentValue3 = newVal)),
          );
        });
  }

  void startPeriodTime1() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: MediaQuery.of(context).copyWith().size.height / 3,
            child: datetime(),
          );
        });
  }

  void startPeriodTime2() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: MediaQuery.of(context).copyWith().size.height / 3,
            child: datetime2(),
          );
        });
  }

  void startPeriodTime3() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: MediaQuery.of(context).copyWith().size.height / 3,
            child: datetime3(),
          );
        });
  }

  //////////////////
  void sanitary() {
    showModalBottomSheet(
        barrierColor: Color.fromRGBO(73, 73, 73, 0.4),
        elevation: 10,
        clipBehavior: Clip.none,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        )),
        isScrollControlled: true,
        isDismissible: false,
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? Colors
                .transparent //Colors.white.withOpacity(0.4)//Color.fromRGBO(213, 213, 213, 0.4)
            : Colors.transparent,
        //radius: 50,
        context: context,
        builder: (BuildContext context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: StatefulBuilder(
                //stream: null,
                builder: (context, setState2) {
              return Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                //padding: const EdgeInsets.all(8.0),
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
                      height: 496,
                      //margin: EdgeInsets.fromLTRB(36, 0, 30, 0),
                      padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(
                                        color: Color.fromRGBO(46, 154, 215, 1),
                                        fontSize: 17),
                                  )),
                              Spacer(),
                              GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      setStatus();
                                      globals1.sanitaryupdate = true;
                                      // widget.start_time = period_start_now1;
                                      // widget.start_day = _currentValue1;
                                      // val1 = true;
                                      // a11 = false;
                                      // a12 = false;
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'Save',
                                    style: TextStyle(
                                        color: Color.fromRGBO(46, 154, 215, 1),
                                        fontSize: 17),
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 36,
                          ),
                          GestureDetector(
                            onTap: () {
                              if (pad == false) {
                                inside_sanitary1("pad", setState2);
                              } else {
                                showAlertDialog("pad", setState2);
                              }
                              cloth = false;
                              tampons = false;
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(
                                    'Pads',
                                    style: pad
                                        ? TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18)
                                        : TextStyle(
                                            fontSize: 18,
                                            color:
                                                Theme.of(context).brightness !=
                                                        Brightness.light
                                                    ? Color.fromRGBO(
                                                        158, 158, 158, 1)
                                                    : null),
                                  ),
                                ),
                                Spacer(),
                                custom_checkbox(pad, () {
                                  setState2(() {
                                    if (pad == false) {
                                      inside_sanitary1("pad", setState2);
                                    } else {
                                      showAlertDialog("pad", setState2);
                                    }
                                    cloth = false;
                                    tampons = false;
                                  });
                                })
                              ],
                            ),
                          ),
                          SizedBox(height: 57),
                          GestureDetector(
                            onTap: () {
                              if (tampons == false)
                                inside_sanitary2("tampons", setState2);
                              else
                                showAlertDialog("tampons", setState2);

                              cloth = false;
                              pad = false;
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(
                                    'Tampons',
                                    style: tampons
                                        ? TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18)
                                        : TextStyle(
                                            fontSize: 18,
                                            color:
                                                Theme.of(context).brightness !=
                                                        Brightness.light
                                                    ? Color.fromRGBO(
                                                        158, 158, 158, 1)
                                                    : null),
                                  ),
                                ),
                                Spacer(),
                                custom_checkbox(tampons, () {
                                  setState2(() {
                                    //tampons = !tampons;
                                    if (tampons == false)
                                      inside_sanitary2("tampons", setState2);
                                    else
                                      showAlertDialog("tampons", setState2);

                                    cloth = false;
                                    pad = false;
                                  });
                                })
                              ],
                            ),
                          ),
                          SizedBox(height: 57),
                          GestureDetector(
                            onTap: () {
                              if (cloth == false)
                                inside_sanitary3("cloth", setState2);
                              else
                                showAlertDialog("cloth", setState2);

                              pad = false;
                              tampons = false;
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(
                                    'Cloth',
                                    style: cloth
                                        ? TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18)
                                        : TextStyle(
                                            fontSize: 18,
                                            color:
                                                Theme.of(context).brightness !=
                                                        Brightness.light
                                                    ? Color.fromRGBO(
                                                        158, 158, 158, 1)
                                                    : null),
                                  ),
                                ),
                                Spacer(),
                                custom_checkbox(cloth, () {
                                  setState2(() {
                                    if (cloth == false)
                                      inside_sanitary3("cloth", setState2);
                                    else
                                      showAlertDialog("cloth", setState2);

                                    pad = false;
                                    tampons = false;

                                    // cloth = !cloth;
                                  });
                                })
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
          );
        });
  }

  ///////////////
  void period_alert2() {
    bool del = false;
    showModalBottomSheet(
        barrierColor: Color.fromRGBO(73, 73, 73, 0.4),
        elevation: 0,
        clipBehavior: Clip.none,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        )),
        isScrollControlled: false,
        isDismissible: false,
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? Colors.transparent //Colors.white.withOpacity(0.6)
            : Colors.transparent, //Colors.black,
        //radius: 50,
        context: context,
        builder: (BuildContext context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: StatefulBuilder(
                //stream: null,
                builder: (context, setState2) {
              return ClipRRect(
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
                    height: 496,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.7,
                      margin: EdgeInsets.fromLTRB(36, 0, 30, 0),
                      //padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            flex: 0,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: Row(
                                //crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  GestureDetector(
                                      onTap: () {
                                        setState2(() {
                                          del = !del;
                                        });
                                        //Navigator.pop(context);
                                      },
                                      child: Text(
                                        'Edit',
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(46, 154, 215, 1),
                                            fontSize: 17),
                                      )),
                                  Spacer(),
                                  GestureDetector(
                                      onTap: () async {
                                       
                                  if (period_alertval) {
                                           // shows 
                                       DateTime targetDay = DateTime(
                                            period_day.year,
                                            period_day.month,
                                            period_day.day,
                                            22,
                                            0);

                                        String remmsg = _titleController_alert.text ==
                                                ''
                                            ? "Your Period Cycle has come to an end!!"
                                            : _titleController_alert.text
                                                .trim();


                                          await NotificationHelper()
                                              .show_Notification_Over_An_Interval(
                                                  messagetitle:
                                                      'Period End Alert',
                                                  messagebody: remmsg,
                                                  numberofdaysprior: 0,
                                                  targetday: targetDay,
                                                  offset: period_end_offset);
                                        }

                                        print(period_alertval);
                                        setState(() {
                                          // period_alert = true;
                                        });
                                        setStatus();
                                        globals1.periodendupdate = true;
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        'Done',
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(46, 154, 215, 1),
                                            fontSize: 17),
                                      )),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          Expanded(
                            child: ScrollConfiguration(
                              behavior: new ScrollBehavior()
                                ..buildViewportChrome(
                                    context, null, AxisDirection.down),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Period End',
                                            style: period_alertval
                                                ? TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w600,
                                                  )
                                                : TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w400,
                                                    color: Theme.of(context)
                                                                .brightness !=
                                                            Brightness.light
                                                        ? Color.fromRGBO(
                                                            158, 158, 158, 1)
                                                        : null)),
                                        Spacer(),
                                        CupertinoSwitch(
                                            value: period_alertval,
                                            activeColor: Colors.yellow[700],
                                            onChanged: (value) {
                                              setState2(() {
                                                period_alertval = value;
                                              });
                                            }),
                                      ],
                                    ),
                                    SizedBox(height: 15),
                                    Text(
                                        'This shall be reminded by the end of the day.',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w300,
                                        )),
                                    SizedBox(height: 87),
                                    Text('Reminder Message'),
                                    SizedBox(height: 22),
                                    TextFormField(
                                      style: TextStyle(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.light
                                              ? Colors.black
                                              : Colors.white,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500),
                                      decoration: InputDecoration(
                                        // border: InputBorder(borderSide: ),
                                        hintText:
                                            'Your Period Cycle has come to an end!!',
                                        fillColor:
                                            Theme.of(context).brightness ==
                                                    Brightness.light
                                                ? Colors.black
                                                : Colors.white,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                      ),
                                      controller: _titleController_alert,
                                    ),
                                    SizedBox(height: 50),
                                    if (del == true)
                                      GestureDetector(
                                          onTap: () async {
                                            print('deleting notification');
                                            await NotificationHelper()
                                                .cancell_Notification_Interval(
                                                    0, period_end_offset);
                                            // setState(() {
                                            //   showAlertDialog1(
                                            //       'period_end', setState);
                                            // });

                                            Navigator.pop(context);
                                          },
                                          child: Center(
                                              child: Text(
                                            'Delete this reminder',
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 17),
                                          )))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
          );
        });
  }

  /////////////
  void pills_inside(Function setState2) {
    int count = 0;

    setPillsStatus() async {
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool('p1', d1);
      prefs.setBool('p2', d2);
      prefs.setBool('p3', d3);
      prefs.setBool('p4', d4);
      prefs.setBool('p5', d5);
      prefs.setBool('p6', d6);
      prefs.setInt('count', count);
    }

    setpillsCount() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      pill_interval = (prefs.getInt('count') ?? 0);
    }

    showModalBottomSheet(
        barrierColor: Colors.transparent,
        clipBehavior: Clip.none,
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        )),
        isScrollControlled: true,
        isDismissible: false,
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? Colors.transparent //Colors.white.withOpacity(0.6)
            : Colors.transparent, //Colors.black,
        //radius: 50,
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
              //stream: null,
              builder: (context, setState5) {
            return ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
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
                  height: 496,
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    //padding: const EdgeInsets.all(8.0),
                    child: Container(
                      // height: MediaQuery.of(context).size.height * 0.75,
                      // margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            flex: 0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    InkWell(
                                        onTap: () {
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
                                    InkWell(
                                        onTap: () {
                                          if (d1 == true) count++;
                                          if (d2 == true) count++;
                                          if (d3 == true) count++;
                                          if (d4 == true) count++;
                                          if (d5 == true) count++;
                                          if (d6 == true) count++;

                                          setPillsStatus();

                                          setState2(() {
                                            setpillsCount();
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
                                SizedBox(
                                  height: 20,
                                ),
                                Text('Pill Intervals',
                                    style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.w600)),
                                SizedBox(height: 3),
                                Text(
                                    'Multiple select and shall be reminded accordingly ',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400)),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Expanded(
                            flex: 1,
                            child: ScrollConfiguration(
                              behavior: new ScrollBehavior()
                                ..buildViewportChrome(
                                    context, null, AxisDirection.down),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState5(() {
                                          d1 = !d1;
                                          //if (d1 == true) count++;
                                        });
                                      },
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 12),
                                            child: Text('Before breackfast',
                                                style: d1
                                                    ? TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w600)
                                                    : TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Theme.of(context)
                                                                    .brightness !=
                                                                Brightness.light
                                                            ? Color.fromRGBO(
                                                                158,
                                                                158,
                                                                158,
                                                                1)
                                                            : null)),
                                          ),
                                          Spacer(),
                                          custom_checkbox3(d1, () {
                                            setState5(() {
                                              d1 = !d1;
                                              // if (d1 == true) count++;
                                            });
                                          }),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 39),
                                    GestureDetector(
                                      onTap: () {
                                        setState5(() {
                                          d2 = !d2;
                                          //if (d2 == true) count++;
                                        });
                                      },
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 12),
                                            child: Text('After breackfast',
                                                style: d2
                                                    ? TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w600)
                                                    : TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Theme.of(context)
                                                                    .brightness !=
                                                                Brightness.light
                                                            ? Color.fromRGBO(
                                                                158,
                                                                158,
                                                                158,
                                                                1)
                                                            : null)),
                                          ),
                                          Spacer(),
                                          custom_checkbox3(d2, () {
                                            setState5(() {
                                              d2 = !d2;
                                              //if (d2 == true) count++;
                                            });
                                          }),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 39),
                                    GestureDetector(
                                      onTap: () {
                                        setState5(() {
                                          d3 = !d3;
                                          // if (d3 == true) count++;
                                        });
                                      },
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 12),
                                            child: Text('Before lunch',
                                                style: d3
                                                    ? TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w600)
                                                    : TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Theme.of(context)
                                                                    .brightness !=
                                                                Brightness.light
                                                            ? Color.fromRGBO(
                                                                158,
                                                                158,
                                                                158,
                                                                1)
                                                            : null)),
                                          ),
                                          Spacer(),
                                          custom_checkbox3(d3, () {
                                            setState5(() {
                                              d3 = !d3;
                                              // if (d3 == true) count++;
                                            });
                                          }),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 39),
                                    GestureDetector(
                                      onTap: () {
                                        setState5(() {
                                          d4 = !d4;
                                          //if (d4 == true) count++;
                                        });
                                      },
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 12),
                                                child: Text('After lunch',
                                                    style: d4
                                                        ? TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w600)
                                                        : TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Theme.of(context)
                                                                        .brightness !=
                                                                    Brightness
                                                                        .light
                                                                ? Color
                                                                    .fromRGBO(
                                                                        158,
                                                                        158,
                                                                        158,
                                                                        1)
                                                                : null)),
                                              ),
                                              SizedBox(height: 5),
                                            ],
                                          ),
                                          Spacer(),
                                          custom_checkbox3(d4, () {
                                            setState5(() {
                                              d4 = !d4;
                                              //if (d4 == true) count++;
                                            });
                                          }),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 39),
                                    GestureDetector(
                                      onTap: () {
                                        setState5(() {
                                          d5 = !d5;
                                          //if (d5 == true) count++;
                                        });
                                      },
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 12),
                                                child: Text('Before dinner',
                                                    style: d5
                                                        ? TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w600)
                                                        : TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Theme.of(context)
                                                                        .brightness !=
                                                                    Brightness
                                                                        .light
                                                                ? Color
                                                                    .fromRGBO(
                                                                        158,
                                                                        158,
                                                                        158,
                                                                        1)
                                                                : null)),
                                              ),
                                              SizedBox(height: 5),
                                            ],
                                          ),
                                          Spacer(),
                                          custom_checkbox3(d5, () {
                                            setState5(() {
                                              d5 = !d5;
                                              // if (d5 == true) count++;
                                            });
                                          }),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 39),
                                    GestureDetector(
                                      onTap: () {
                                        setState5(() {
                                          d6 = !d6;
                                          //if (d6 == true) count++;
                                        });
                                      },
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 12),
                                                child: Text('After dinner',
                                                    style: d6
                                                        ? TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w600)
                                                        : TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Theme.of(context)
                                                                        .brightness !=
                                                                    Brightness
                                                                        .light
                                                                ? Color
                                                                    .fromRGBO(
                                                                        158,
                                                                        158,
                                                                        158,
                                                                        1)
                                                                : null)),
                                              ),
                                            ],
                                          ),
                                          Spacer(),
                                          custom_checkbox3(d6, () {
                                            setState5(() {
                                              d6 = !d6;
                                              //  if (d6 == true) count++;
                                            });
                                          }),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    /////////////////
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          });
        });
  }

  /////////////
  void pills_dialog() {
    // bool a11 = false;
    bool a12 = false;
    bool b12 = false;
    bool del = false;
    String no_pills = '';
    bool boolpill = false;
    void showdeleteBottom() {
      showModalBottomSheet(
          elevation: 0,
          barrierColor: Colors.transparent,
          clipBehavior: Clip.hardEdge,
          backgroundColor: Colors.transparent,
          context: context,
          builder: (BuildContext context) {
            return ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.light
                          ? Color.fromRGBO(158, 158, 158, 0.1)
                          : Color.fromRGBO(255, 255, 255, 0.1)),
                  child: del
                      ? GestureDetector(
                          onTap: () async {
                            print('deleting remainder');
                            await NotificationHelper()
                                .cancell_Notification_Interval(
                                    diffdate, pills_offset);
                                
                            // setState(() {
                            //   showAlertDialog1('pills', setState);
                            // });
                            Navigator.pop(context);
                          },
                          child: Center(
                              child: Text(
                            'Delete this reminder',
                            style: TextStyle(color: Colors.red, fontSize: 17),
                          )))
                      : null,
                ),
              ),
            );
          });
    }

    showModalBottomSheet(
        clipBehavior: Clip.none,
        barrierColor: Color.fromRGBO(73, 73, 73, 0.4),
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        )),
        isScrollControlled: false,
        isDismissible: false,
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? Colors.transparent //Colors.white.withOpacity(0.6)
            : Colors.transparent, //Colors.black,
        //radius: 50,
        context: context,
        builder: (BuildContext context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: StatefulBuilder(
                //stream: null,
                builder: (context, setState2) {
              return ClipRRect(
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
                    height: 496,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.75,
                      // margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            flex: 0,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  InkWell(
                                      onTap: () {
                                        setState2(() {
                                          del = !del;
                                        });
                                        if (del == true) showdeleteBottom();
                                        //Navigator.pop(context);
                                      },
                                      child: Text(
                                        'Edit',
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(46, 154, 215, 1),
                                            fontSize: 17),
                                      )),
                                  Spacer(),
                                  InkWell(
                                      onTap: ()  async  {
                                        if(diffdate > 0  && pill_interval >0){
                                          String message = pills_ovul.text == ''?'Remember to take pills':pills_ovul.text.trim();
                                          //setting notification to morning 9 am on start day
                                          DateTime morningDate = DateTime(till_datepill.year,
                                          till_datepill.month,till_datepill.day,9,0);   
                                         
                                         String name_pill = pillname.text == ''?'Glass Buster':pillname.text.trim();   
                                         
                                          await NotificationHelper().show_Notification_Over_An_Interval(
                                            messagetitle: 'Pills $name_pill $pill_interval times a day',
                                            messagebody: message,
                                            offset: pills_offset,
                                            targetday: morningDate,
                                            numberofdaysprior: diffdate,
                                          );
                                        }
                                        setState(() {
                                          if (pills == false) pills = !pills;

                                          // widget.start_time = period_start_now1;
                                          // widget.start_day = _currentValue1;
                                          // val1 = true;
                                          // a11 = false;
                                          // a12 = false;
                                        });
                                        setStatus();
                                        globals1.pillsupdate = true;
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        'Done',
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(46, 154, 215, 1),
                                            fontSize: 17),
                                      )),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          Expanded(
                            child: ScrollConfiguration(
                              behavior: new ScrollBehavior()
                                ..buildViewportChrome(
                                    context, null, AxisDirection.down),
                              child: SingleChildScrollView(
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [

                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('From',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                              SizedBox(height: 3),
                                              Text(
                                                  '$diffdate days of medication',
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          26, 147, 111, 1),
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                            ],
                                          ),
                                          Spacer(),


                                          Container(
                                            padding: EdgeInsets.only(bottom: 5),
                                            width: 113,
                                            height: 30,
                                            child: FlatButton(
                                              onPressed: () {
                                                setState2(() {
                                                  from_datepicker = !from_datepicker;
                                                  // a12 = false;
                                                });

                                                //startPeriodTime1();
                                              },
                                              child: Column(
                                                children: [
                                                  Text(frompillsdate,
                                                      overflow:
                                                          TextOverflow.clip,
                                                      style: TextStyle(
                                                          color: Theme.of(context)
                                                                      .brightness !=
                                                                  Brightness
                                                                      .light
                                                              ? diffdate == 0
                                                                  ? Color
                                                                      .fromRGBO(
                                                                          158,
                                                                          158,
                                                                          158,
                                                                          1)
                                                                  : Colors.white
                                                              : Colors.black,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w500)),
                                                  //Divider(thickness:3,color:Colors.black),
                                                ],
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    bottom: BorderSide(
                                                        width: 3,
                                                        color: Theme.of(context)
                                                                    .brightness !=
                                                                Brightness.light
                                                            ? diffdate == 0
                                                                ? Color
                                                                    .fromRGBO(
                                                                        158,
                                                                        158,
                                                                        158,
                                                                        1)
                                                                : Colors.white
                                                            : Colors.black))),
                                          ),



                                        ],
                                      ),
                                      SizedBox(height: 15),
                                      from_datepicker?       
                                            Container(
                                              //padding: EdgeInsets.only(top:10),
                                              decoration: BoxDecoration(
                                                border: Border(
                                                  top: BorderSide(
                                                    color: Theme.of(context)
                                                                .brightness ==
                                                            Brightness.light
                                                        ? Colors.black12
                                                        : Colors.white38,
                                                  ),
                                                  bottom: BorderSide(
                                                    color: Theme.of(context)
                                                                .brightness ==
                                                            Brightness.light
                                                        ? Colors.black12
                                                        : Colors.white38,
                                                  ),
                                                ),
                                              ),
                                              height: 180,
                                              // MediaQuery.of(context)
                                              //         .copyWith()
                                              //         .size
                                              //         .height /
                                              //     6,

                                              child: CupertinoTheme(
                                                data: CupertinoThemeData(
                                                  textTheme:
                                                      CupertinoTextThemeData(
                                                    dateTimePickerTextStyle:
                                                        TextStyle(
                                                      fontSize: 22,
                                                      color: Theme.of(context)
                                                                  .brightness ==
                                                              Brightness.light
                                                          ? Colors.black
                                                          : Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                child: CupertinoDatePicker(
                                                  backgroundColor:
                                                      Theme.of(context)
                                                                  .brightness ==
                                                              Brightness.light
                                                          ? Colors.transparent
                                                          : Colors.transparent,
                                                  initialDateTime:
                                                      DateTime.now(),
                                                  onDateTimeChanged:
                                                      (DateTime newdate) {
                                                    setState2(() {
                                                      from_datepill =newdate;
                                                      frompillsdate = newdate
                                                              .toString()
                                                              .substring(
                                                                  8, 10) +
                                                          '/' +
                                                          newdate
                                                              .toString()
                                                              .substring(5, 7) +
                                                          '/' +
                                                          newdate
                                                              .toString()
                                                              .substring(0, 4);
                                                      
                                                    });

                                                    // int tempint;
                                                    // tempint = newdate
                                                    //     .difference(
                                                    //         DateTime.now())
                                                    //     .inDays;

                                                    // if (tempint < 0)
                                                    //   diffdate = 0;
                                                    // else
                                                    //   diffdate = tempint;
                                                    // print(newdate);

                                                     setState(() {
                                                      int diff= till_datepill.difference(from_datepill).inDays;
                                                      if(diff>0)diffdate = diff;
                                                      else diffdate =0;
                                                    });
                                                
                                                  },
                                                  maximumDate: new DateTime(
                                                      2021, 12, 30),
                                                  minimumYear: 2021,
                                                  maximumYear: 2021,
                                                  minuteInterval: 1,
                                                  mode: CupertinoDatePickerMode
                                                      .date,
                                                ),
                                              ),
                                              //datetime(),
                                            )
                                          : SizedBox(height: 10),
                                      /////////////////
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10),
                                                child: Text(
                                                  'Till',
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: diffdate != 0
                                                        ? FontWeight.w600
                                                        : FontWeight.w400,
                                                    color: Theme.of(context)
                                                                .brightness !=
                                                            Brightness.light
                                                        ? diffdate == 0
                                                            ? Color.fromRGBO(
                                                                158,
                                                                158,
                                                                158,
                                                                1)
                                                            : Colors.white
                                                        : null,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Spacer(),
                                          //SizedBox(width:178),
                                          
                                          Container(
                                            padding: EdgeInsets.only(bottom: 5),
                                            width: 113,
                                            height: 30,
                                            child: FlatButton(
                                              onPressed: () {
                                                setState2(() {
                                                  boolpill = !boolpill;
                                                  // a12 = false;
                                                });

                                                //startPeriodTime1();
                                              },
                                              child: Column(
                                                children: [
                                                  Text(pillsdate,
                                                      overflow:
                                                          TextOverflow.clip,
                                                      style: TextStyle(
                                                          color: Theme.of(context)
                                                                      .brightness !=
                                                                  Brightness
                                                                      .light
                                                              ? diffdate == 0
                                                                  ? Color
                                                                      .fromRGBO(
                                                                          158,
                                                                          158,
                                                                          158,
                                                                          1)
                                                                  : Colors.white
                                                              : Colors.black,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w500)),
                                                  //Divider(thickness:3,color:Colors.black),
                                                ],
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    bottom: BorderSide(
                                                        width: 3,
                                                        color: Theme.of(context)
                                                                    .brightness !=
                                                                Brightness.light
                                                            ? diffdate == 0
                                                                ? Color
                                                                    .fromRGBO(
                                                                        158,
                                                                        158,
                                                                        158,
                                                                        1)
                                                                : Colors.white
                                                            : Colors.black))),
                                          ),

                                        ],
                                      ),
                                      SizedBox(height: 15),
                                      boolpill == true
                                          ? Container(
                                              //padding: EdgeInsets.only(top:10),
                                              decoration: BoxDecoration(
                                                border: Border(
                                                  top: BorderSide(
                                                    color: Theme.of(context)
                                                                .brightness ==
                                                            Brightness.light
                                                        ? Colors.black12
                                                        : Colors.white38,
                                                  ),
                                                  bottom: BorderSide(
                                                    color: Theme.of(context)
                                                                .brightness ==
                                                            Brightness.light
                                                        ? Colors.black12
                                                        : Colors.white38,
                                                  ),
                                                ),
                                              ),
                                              height: 180,
                                              // MediaQuery.of(context)
                                              //         .copyWith()
                                              //         .size
                                              //         .height /
                                              //     6,

                                              child: CupertinoTheme(
                                                data: CupertinoThemeData(
                                                  textTheme:
                                                      CupertinoTextThemeData(
                                                    dateTimePickerTextStyle:
                                                        TextStyle(
                                                      fontSize: 22,
                                                      color: Theme.of(context)
                                                                  .brightness ==
                                                              Brightness.light
                                                          ? Colors.black
                                                          : Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                child: CupertinoDatePicker(
                                                  backgroundColor:
                                                      Theme.of(context)
                                                                  .brightness ==
                                                              Brightness.light
                                                          ? Colors.transparent
                                                          : Colors.transparent,
                                                  initialDateTime:
                                                      DateTime.now(),
                                                  onDateTimeChanged:
                                                      (DateTime newdate) {
                                                    setState2(() {
                                                      till_datepill=newdate;
                                                      pillsdate = newdate
                                                              .toString()
                                                              .substring(
                                                                  8, 10) +
                                                          '/' +
                                                          newdate
                                                              .toString()
                                                              .substring(5, 7) +
                                                          '/' +
                                                          newdate
                                                              .toString()
                                                              .substring(0, 4);
                                                      // '${newdate.day}' +
                                                      //     '/' +
                                                      //     '${newdate.month}' +
                                                      //     '/' +
                                                      //     '${newdate.year}';
                                                    });

                                                    // int tempint;
                                                    // tempint = newdate
                                                    //     .difference(
                                                    //         DateTime.now())
                                                    //     .inDays;

                                                    // if (tempint < 0)
                                                    //   diffdate = 0;
                                                    // else
                                                    //   diffdate = tempint;
                                                    // print(newdate);

                                                    setState(() {
                                                      int diff= till_datepill.difference(from_datepill).inDays;
                                                      if(diff>0)diffdate = diff;
                                                      else diffdate =0;
                                                    });
                                                  
                                                  },
                                                  maximumDate: new DateTime(
                                                      2021, 12, 30),
                                                  minimumYear: 2021,
                                                  maximumYear: 2021,
                                                  minuteInterval: 1,
                                                  mode: CupertinoDatePickerMode
                                                      .date,
                                                ),
                                              ),
                                              //datetime(),
                                            )
                                          : SizedBox(height: 10),
                                          
                                      SizedBox(height: 10),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text('No of Pills/day',
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              pill_interval == 0
                                                                  ? FontWeight
                                                                      .w400
                                                                  : FontWeight
                                                                      .w600,
                                                          color: Theme.of(context)
                                                                      .brightness !=
                                                                  Brightness
                                                                      .light
                                                              ? pill_interval ==
                                                                      0
                                                                  ? Color
                                                                      .fromRGBO(
                                                                          158,
                                                                          158,
                                                                          158,
                                                                          1)
                                                                  : null
                                                              : null)),
                                                  Text(
                                                    '$pill_interval times a day',
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            26, 147, 111, 1),
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                          Spacer(),
                                          Container(
                                            height: 30,
                                            width: 113,
                                            child: FlatButton(
                                              onPressed: () {
                                                pills_inside(setState2);

                                                setState2(() {
                                                  //b12 = !b12;
                                                });
                                              },
                                              child: Text('$pill_interval',
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Theme.of(context)
                                                                  .brightness !=
                                                              Brightness.light
                                                          ? pill_interval == 0
                                                              ? Color.fromRGBO(
                                                                  158,
                                                                  158,
                                                                  158,
                                                                  1)
                                                              : Colors.white
                                                          : Colors.black)),
                                            ),
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    bottom: BorderSide(
                                                        width: 3,
                                                        color: Theme.of(context)
                                                                    .brightness !=
                                                                Brightness.light
                                                            ? pill_interval == 0
                                                                ? Color
                                                                    .fromRGBO(
                                                                        158,
                                                                        158,
                                                                        158,
                                                                        1)
                                                                : Colors.white
                                                            : Colors.black))),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 15),
                                      b12 == true
                                          ? Container(
                                              decoration: BoxDecoration(
                                                border: Border(
                                                  top: BorderSide(
                                                    color: Theme.of(context)
                                                                .brightness ==
                                                            Brightness.light
                                                        ? Colors.black12
                                                        : Colors.white38,
                                                  ),
                                                  bottom: BorderSide(
                                                    color: Theme.of(context)
                                                                .brightness ==
                                                            Brightness.light
                                                        ? Colors.black12
                                                        : Colors.white38,
                                                  ),
                                                ),
                                              ),
                                              height: 160,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              // MediaQuery.of(context)
                                              //         .copyWith()
                                              //         .size
                                              //         .height /
                                              //     5.5,
                                              child: NumberPicker.integer(
                                                  // textMapper:,
                                                  selectedTextStyle: TextStyle(
                                                      color: Color.fromRGBO(
                                                          51, 51, 51, 1),
                                                      fontSize: 23,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  highlightSelectedValue: true,
                                                  initialValue: _currentValue2,
                                                  minValue: 0,
                                                  maxValue: 20,
                                                  onChanged: (newVal) =>
                                                      setState2(() => no_pills =
                                                          newVal.toString())),
                                            )
                                          : SizedBox(
                                              //height: 18,
                                              ),
                                      SizedBox(height: 20),
                                     
                                      Text('Name to the Pills',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400)),
                                      SizedBox(height: 10),
                                      TextFormField(
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500),
                                        decoration: InputDecoration(
                                          // border: InputBorder(borderSide: ),
                                          hintText: 'Glass Buster',
                                          hintStyle: TextStyle(
                                              color: Color.fromRGBO(
                                                  114, 114, 114, 1),
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400),
                                          fillColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                        ),
                                        controller: pillname,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text('Reminder Message',
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w300)),
                                      SizedBox(height: 10),
                                      TextFormField(
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500),
                                        decoration: InputDecoration(
                                          // border: InputBorder(borderSide: ),
                                          hintText: 'Remember to take pills',
                                          fillColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                        ),
                                        controller: pills_ovul,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
          );
        });
  }

  void inside_sanitary3(String para, Function setState2) {
    showModalBottomSheet(
        clipBehavior: Clip.none,
        elevation: 10,
        barrierColor: Colors.transparent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        )),
        isScrollControlled: true,
        isDismissible: false,
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? Colors.transparent //Colors.white.withOpacity(0.6)
            : Colors.transparent,
        //radius: 50,
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
              //stream: null,
              builder: (context, setState5) {
            return Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              //padding: const EdgeInsets.all(8.0),
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
                    height: 496,
                    // margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          flex: 0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        'Cancel',
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(46, 154, 215, 1),
                                            fontSize: 17),
                                      )),
                                  Spacer(),
                                  InkWell(
                                      onTap: () {
                                        setState2(() {
                                          if (para == "pad") {
                                            pad = !pad;
                                            if (pad == true) val_pads = true;
                                          } else if (para == 'tampons') {
                                            tampons = !tampons;
                                            if (tampons == true)
                                              val_pads = true;
                                          } else {
                                            cloth = !cloth;
                                            if (cloth == true) val_pads = true;
                                          }
                                        });
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        'Save',
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(46, 154, 215, 1),
                                            fontSize: 17),
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text('Your Average',
                                  style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w600)),
                              SizedBox(height: 3),
                              Text(
                                  'This shall be reminded only during your period days',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400)),
                            ],
                          ),
                        ),
                        SizedBox(height: 35),
                        Expanded(
                          child: ScrollConfiguration(
                            behavior: new ScrollBehavior()
                              ..buildViewportChrome(
                                  context, null, AxisDirection.down),
                            child: SingleChildScrollView(
                              child: Container(
                                //padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        selectedsanitary = 'Once a day';
                                        setState5(() {
                                          d31 = !d31;
                                          d32 = false;
                                          d33 = false;
                                          d34 = false;
                                          d35 = false;
                                          d36 = false;
                                        });
                                      },
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 15),
                                            child: Text('Once a day',
                                                style: d31
                                                    ? TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w600)
                                                    : TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Theme.of(context)
                                                                    .brightness !=
                                                                Brightness.light
                                                            ? Color.fromRGBO(
                                                                158,
                                                                158,
                                                                158,
                                                                1)
                                                            : null)),
                                          ),
                                          Spacer(),
                                          custom_checkbox3(d31, () {
                                            selectedsanitary = 'Once a day';
                                            setState5(() {
                                              d31 = !d31;
                                              d32 = false;
                                              d33 = false;
                                              d34 = false;
                                              d35 = false;
                                              d36 = false;
                                            });
                                          }),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 39),
                                    GestureDetector(
                                      onTap: () {
                                        selectedsanitary = 'Twice a day';

                                        setState5(() {
                                          d32 = !d32;
                                          d31 = false;
                                          d33 = false;
                                          d34 = false;
                                          d35 = false;
                                          d36 = false;
                                        });
                                      },
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 15),
                                            child: Text('Twice a day',
                                                style: d32
                                                    ? TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w600)
                                                    : TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Theme.of(context)
                                                                    .brightness !=
                                                                Brightness.light
                                                            ? Color.fromRGBO(
                                                                158,
                                                                158,
                                                                158,
                                                                1)
                                                            : null)),
                                          ),
                                          Spacer(),
                                          custom_checkbox3(d32, () {
                                            selectedsanitary = 'Twice a day';

                                            setState5(() {
                                              d32 = !d32;
                                              d31 = false;
                                              d33 = false;
                                              d34 = false;
                                              d35 = false;
                                              d36 = false;
                                            });
                                          }),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 39),
                                    GestureDetector(
                                      onTap: () {
                                        selectedsanitary = 'Thrice a day';

                                        setState5(() {
                                          d33 = !d33;
                                          d31 = false;
                                          d32 = false;
                                          d34 = false;
                                          d35 = false;
                                          d36 = false;
                                        });
                                      },
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 15),
                                            child: Text('Thrice a day',
                                                style: d33
                                                    ? TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w600)
                                                    : TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Theme.of(context)
                                                                    .brightness !=
                                                                Brightness.light
                                                            ? Color.fromRGBO(
                                                                158,
                                                                158,
                                                                158,
                                                                1)
                                                            : null)),
                                          ),
                                          Spacer(),
                                          custom_checkbox3(d33, () {
                                            selectedsanitary = 'Thrice a day';

                                            setState5(() {
                                              d33 = !d33;
                                              d31 = false;
                                              d32 = false;
                                              d34 = false;
                                              d35 = false;
                                              d36 = false;
                                            });
                                          }),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 39),
                                    GestureDetector(
                                      onTap: () {
                                        selectedsanitary = '4 times a day';

                                        setState5(() {
                                          d34 = !d34;
                                          d31 = false;
                                          d33 = false;
                                          d32 = false;
                                          d35 = false;
                                          d36 = false;
                                        });
                                      },
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 15),
                                                child: Text('4 times a day',
                                                    style: d34
                                                        ? TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w600)
                                                        : TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Theme.of(context)
                                                                        .brightness !=
                                                                    Brightness
                                                                        .light
                                                                ? Color
                                                                    .fromRGBO(
                                                                        158,
                                                                        158,
                                                                        158,
                                                                        1)
                                                                : null)),
                                              ),
                                              SizedBox(height: 5),
                                              Text(
                                                'Advisable',
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        128, 215, 114, 1),
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                          Spacer(),
                                          custom_checkbox3(d34, () {
                                            selectedsanitary = '4 times a day';

                                            setState5(() {
                                              d34 = !d34;
                                              d31 = false;
                                              d33 = false;
                                              d32 = false;
                                              d35 = false;
                                              d36 = false;
                                            });
                                          }),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    GestureDetector(
                                      onTap: () {
                                        selectedsanitary = 'Every 5th Hour';

                                        setState5(() {
                                          d35 = !d35;
                                          d31 = false;
                                          d33 = false;
                                          d32 = false;
                                          d34 = false;
                                          d36 = false;
                                        });
                                      },
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 15),
                                                child: Text('Every 5th Hour',
                                                    style: d35
                                                        ? TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w600)
                                                        : TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Theme.of(context)
                                                                        .brightness !=
                                                                    Brightness
                                                                        .light
                                                                ? Color
                                                                    .fromRGBO(
                                                                        158,
                                                                        158,
                                                                        158,
                                                                        1)
                                                                : null)),
                                              ),
                                              SizedBox(height: 5),
                                              Text(
                                                'Advisable',
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        128, 215, 114, 1),
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                          Spacer(),
                                          custom_checkbox3(d35, () {
                                            selectedsanitary = 'Every 5th Hour';

                                            setState5(() {
                                              d35 = !d35;
                                              d31 = false;
                                              d33 = false;
                                              d32 = false;
                                              d34 = false;
                                              d36 = false;
                                            });
                                          }),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 21),
                                    GestureDetector(
                                      onTap: () {
                                        selectedsanitary = 'Every 2 Hour';

                                        setState5(() {
                                          d36 = !d36;
                                          d31 = false;
                                          d33 = false;
                                          d32 = false;
                                          d34 = false;
                                          d35 = false;
                                        });
                                      },
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 15),
                                                child: Text('Every 2 Hour',
                                                    style: d36
                                                        ? TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w600)
                                                        : TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Theme.of(context)
                                                                        .brightness !=
                                                                    Brightness
                                                                        .light
                                                                ? Color
                                                                    .fromRGBO(
                                                                        158,
                                                                        158,
                                                                        158,
                                                                        1)
                                                                : null)),
                                              ),
                                            ],
                                          ),
                                          Spacer(),
                                          custom_checkbox3(d36, () {
                                            selectedsanitary = 'Every 2 Hour';

                                            setState5(() {
                                              d36 = !d36;
                                              d31 = false;
                                              d33 = false;
                                              d32 = false;
                                              d34 = false;
                                              d35 = false;
                                            });
                                          }),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    /////////////////
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          });
        });
  }

  void inside_sanitary2(String para, Function setState2) {
    showModalBottomSheet(
        clipBehavior: Clip.none,
        elevation: 10,
        barrierColor: Colors.transparent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        )),
        isScrollControlled: true,
        isDismissible: false,
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? Colors.transparent //Colors.white.withOpacity(0.6)
            : Colors.transparent,
        //radius: 50,
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
              //stream: null,
              builder: (context, setState5) {
            return Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              //padding: const EdgeInsets.all(8.0),
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
                    height: 496,
                    // margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          flex: 0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        'Cancel',
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(46, 154, 215, 1),
                                            fontSize: 17),
                                      )),
                                  Spacer(),
                                  InkWell(
                                      onTap: () {
                                        setState2(() {
                                          if (para == "pad") {
                                            pad = !pad;
                                            if (pad == true) val_pads = true;
                                          } else if (para == 'tampons') {
                                            tampons = !tampons;
                                            if (tampons == true)
                                              val_pads = true;
                                          } else {
                                            cloth = !cloth;
                                            if (cloth == true) val_pads = true;
                                          }
                                        });
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        'Save',
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(46, 154, 215, 1),
                                            fontSize: 17),
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text('Your Average',
                                  style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w600)),
                              SizedBox(height: 3),
                              Text(
                                  'This shall be reminded only during your period days',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400)),
                            ],
                          ),
                        ),
                        SizedBox(height: 35),
                        Expanded(
                          child: ScrollConfiguration(
                            behavior: new ScrollBehavior()
                              ..buildViewportChrome(
                                  context, null, AxisDirection.down),
                            child: SingleChildScrollView(
                              child: Container(
                                //padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        selectedsanitary = 'Once a day';
                                        setState5(() {
                                          d21 = !d21;
                                          d22 = false;
                                          d23 = false;
                                          d24 = false;
                                          d25 = false;
                                          d26 = false;
                                        });
                                      },
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 15),
                                            child: Text('Once a day',
                                                style: d21
                                                    ? TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w600)
                                                    : TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Theme.of(context)
                                                                    .brightness !=
                                                                Brightness.light
                                                            ? Color.fromRGBO(
                                                                158,
                                                                158,
                                                                158,
                                                                1)
                                                            : null)),
                                          ),
                                          Spacer(),
                                          custom_checkbox3(d21, () {
                                            selectedsanitary = 'Once a day';
                                            setState5(() {
                                              d21 = !d21;
                                              d22 = false;
                                              d23 = false;
                                              d24 = false;
                                              d25 = false;
                                              d26 = false;
                                            });
                                          }),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 39),
                                    GestureDetector(
                                      onTap: () {
                                        selectedsanitary = 'Twice a day';

                                        setState5(() {
                                          d22 = !d22;
                                          d21 = false;
                                          d23 = false;
                                          d24 = false;
                                          d25 = false;
                                          d26 = false;
                                        });
                                      },
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 15),
                                            child: Text('Twice a day',
                                                style: d22
                                                    ? TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w600)
                                                    : TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Theme.of(context)
                                                                    .brightness !=
                                                                Brightness.light
                                                            ? Color.fromRGBO(
                                                                158,
                                                                158,
                                                                158,
                                                                1)
                                                            : null)),
                                          ),
                                          Spacer(),
                                          custom_checkbox3(d22, () {
                                            selectedsanitary = 'Twice a day';

                                            setState5(() {
                                              d22 = !d22;
                                              d21 = false;
                                              d23 = false;
                                              d24 = false;
                                              d25 = false;
                                              d26 = false;
                                            });
                                          }),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 39),
                                    GestureDetector(
                                      onTap: () {
                                        selectedsanitary = 'Thrice a day';

                                        setState5(() {
                                          d23 = !d23;
                                          d21 = false;
                                          d22 = false;
                                          d24 = false;
                                          d25 = false;
                                          d26 = false;
                                        });
                                      },
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 15),
                                            child: Text('Thrice a day',
                                                style: d23
                                                    ? TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w600)
                                                    : TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Theme.of(context)
                                                                    .brightness !=
                                                                Brightness.light
                                                            ? Color.fromRGBO(
                                                                158,
                                                                158,
                                                                158,
                                                                1)
                                                            : null)),
                                          ),
                                          Spacer(),
                                          custom_checkbox3(d23, () {
                                            selectedsanitary = 'Thrice a day';

                                            setState5(() {
                                              d23 = !d23;
                                              d21 = false;
                                              d22 = false;
                                              d24 = false;
                                              d25 = false;
                                              d26 = false;
                                            });
                                          }),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 39),
                                    GestureDetector(
                                      onTap: () {
                                        selectedsanitary = '4 times a day';

                                        setState5(() {
                                          d24 = !d24;
                                          d21 = false;
                                          d23 = false;
                                          d22 = false;
                                          d25 = false;
                                          d26 = false;
                                        });
                                      },
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 15),
                                                child: Text('4 times a day',
                                                    style: d24
                                                        ? TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w600)
                                                        : TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Theme.of(context)
                                                                        .brightness !=
                                                                    Brightness
                                                                        .light
                                                                ? Color
                                                                    .fromRGBO(
                                                                        158,
                                                                        158,
                                                                        158,
                                                                        1)
                                                                : null)),
                                              ),
                                              SizedBox(height: 5),
                                              Text(
                                                'Advisable',
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        128, 215, 114, 1),
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                          Spacer(),
                                          custom_checkbox3(d24, () {
                                            selectedsanitary = '4 times a day';

                                            setState5(() {
                                              d24 = !d24;
                                              d21 = false;
                                              d23 = false;
                                              d22 = false;
                                              d25 = false;
                                              d26 = false;
                                            });
                                          }),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    GestureDetector(
                                      onTap: () {
                                        selectedsanitary = 'Every 5th Hour';

                                        setState5(() {
                                          d25 = !d25;
                                          d21 = false;
                                          d23 = false;
                                          d22 = false;
                                          d24 = false;
                                          d26 = false;
                                        });
                                      },
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 15),
                                                child: Text('Every 5th Hour',
                                                    style: d25
                                                        ? TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w600)
                                                        : TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Theme.of(context)
                                                                        .brightness !=
                                                                    Brightness
                                                                        .light
                                                                ? Color
                                                                    .fromRGBO(
                                                                        158,
                                                                        158,
                                                                        158,
                                                                        1)
                                                                : null)),
                                              ),
                                              SizedBox(height: 5),
                                              Text(
                                                'Advisable',
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        128, 215, 114, 1),
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                          Spacer(),
                                          custom_checkbox3(d25, () {
                                            selectedsanitary = 'Every 5th Hour';

                                            setState5(() {
                                              d25 = !d25;
                                              d21 = false;
                                              d23 = false;
                                              d22 = false;
                                              d24 = false;
                                              d26 = false;
                                            });
                                          }),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 21),
                                    GestureDetector(
                                      onTap: () {
                                        selectedsanitary = 'Every 2 Hour';

                                        setState5(() {
                                          d26 = !d26;
                                          d21 = false;
                                          d23 = false;
                                          d22 = false;
                                          d24 = false;
                                          d25 = false;
                                        });
                                      },
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 15),
                                                child: Text('Every 2 Hour',
                                                    style: d26
                                                        ? TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w600)
                                                        : TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Theme.of(context)
                                                                        .brightness !=
                                                                    Brightness
                                                                        .light
                                                                ? Color
                                                                    .fromRGBO(
                                                                        158,
                                                                        158,
                                                                        158,
                                                                        1)
                                                                : null)),
                                              ),
                                            ],
                                          ),
                                          Spacer(),
                                          custom_checkbox3(d26, () {
                                            selectedsanitary = 'Every 2 Hour';

                                            setState5(() {
                                              d26 = !d26;
                                              d21 = false;
                                              d23 = false;
                                              d22 = false;
                                              d24 = false;
                                              d25 = false;
                                            });
                                          }),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    /////////////////
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          });
        });
  }

  /////////////
  void inside_sanitary1(String para, Function setState2) {
    showModalBottomSheet(
        clipBehavior: Clip.none,
        elevation: 10,
        barrierColor: Colors.transparent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        )),
        isScrollControlled: true,
        isDismissible: false,
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? Colors.transparent //Colors.white.withOpacity(0.6)
            : Colors.transparent,
        //radius: 50,
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
              //stream: null,
              builder: (context, setState5) {
            return Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              //padding: const EdgeInsets.all(8.0),
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
                    height: 496,
                    // margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          flex: 0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        'Cancel',
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(46, 154, 215, 1),
                                            fontSize: 17),
                                      )),
                                  Spacer(),
                                  InkWell(
                                      onTap: () {
                                        setState2(() {
                                          if (para == "pad") {
                                            pad = !pad;
                                            if (pad == true) val_pads = true;
                                          } else if (para == 'tampons') {
                                            tampons = !tampons;
                                            if (tampons == true)
                                              val_pads = true;
                                          } else {
                                            cloth = !cloth;
                                            if (cloth == true) val_pads = true;
                                          }
                                        });
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        'Save',
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(46, 154, 215, 1),
                                            fontSize: 17),
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text('Your Average',
                                  style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w600)),
                              SizedBox(height: 3),
                              Text(
                                  'This shall be reminded only during your period days',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400)),
                            ],
                          ),
                        ),
                        SizedBox(height: 35),
                        Expanded(
                          child: ScrollConfiguration(
                            behavior: new ScrollBehavior()
                              ..buildViewportChrome(
                                  context, null, AxisDirection.down),
                            child: SingleChildScrollView(
                              child: Container(
                                //padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        selectedsanitary = 'Once a day';
                                        setState5(() {
                                          d11 = !d11;
                                          d12 = false;
                                          d13 = false;
                                          d14 = false;
                                          d15 = false;
                                          d16 = false;
                                        });
                                      },
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 15),
                                            child: Text('Once a day',
                                                style: d11
                                                    ? TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w600)
                                                    : TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Theme.of(context)
                                                                    .brightness !=
                                                                Brightness.light
                                                            ? Color.fromRGBO(
                                                                158,
                                                                158,
                                                                158,
                                                                1)
                                                            : null)),
                                          ),
                                          Spacer(),
                                          custom_checkbox3(d11, () {
                                            selectedsanitary = 'Once a day';
                                            setState5(() {
                                              d11 = !d11;
                                              d12 = false;
                                              d13 = false;
                                              d14 = false;
                                              d15 = false;
                                              d16 = false;
                                            });
                                          }),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 39),
                                    GestureDetector(
                                      onTap: () {
                                        selectedsanitary = 'Twice a day';

                                        setState5(() {
                                          d12 = !d12;
                                          d11 = false;
                                          d13 = false;
                                          d14 = false;
                                          d15 = false;
                                          d16 = false;
                                        });
                                      },
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 15),
                                            child: Text('Twice a day',
                                                style: d12
                                                    ? TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w600)
                                                    : TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Theme.of(context)
                                                                    .brightness !=
                                                                Brightness.light
                                                            ? Color.fromRGBO(
                                                                158,
                                                                158,
                                                                158,
                                                                1)
                                                            : null)),
                                          ),
                                          Spacer(),
                                          custom_checkbox3(d12, () {
                                            selectedsanitary = 'Twice a day';

                                            setState5(() {
                                              d12 = !d12;
                                              d11 = false;
                                              d13 = false;
                                              d14 = false;
                                              d15 = false;
                                              d16 = false;
                                            });
                                          }),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 39),
                                    GestureDetector(
                                      onTap: () {
                                        selectedsanitary = 'Thrice a day';

                                        setState5(() {
                                          d13 = !d13;
                                          d11 = false;
                                          d12 = false;
                                          d14 = false;
                                          d15 = false;
                                          d16 = false;
                                        });
                                      },
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 15),
                                            child: Text('Thrice a day',
                                                style: d13
                                                    ? TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w600)
                                                    : TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Theme.of(context)
                                                                    .brightness !=
                                                                Brightness.light
                                                            ? Color.fromRGBO(
                                                                158,
                                                                158,
                                                                158,
                                                                1)
                                                            : null)),
                                          ),
                                          Spacer(),
                                          custom_checkbox3(d13, () {
                                            selectedsanitary = 'Thrice a day';

                                            setState5(() {
                                              d13 = !d13;
                                              d11 = false;
                                              d12 = false;
                                              d14 = false;
                                              d15 = false;
                                              d16 = false;
                                            });
                                          }),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 39),
                                    GestureDetector(
                                      onTap: () {
                                        selectedsanitary = '4 times a day';

                                        setState5(() {
                                          d14 = !d14;
                                          d11 = false;
                                          d13 = false;
                                          d12 = false;
                                          d15 = false;
                                          d16 = false;
                                        });
                                      },
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 15),
                                                child: Text('4 times a day',
                                                    style: d14
                                                        ? TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w600)
                                                        : TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Theme.of(context)
                                                                        .brightness !=
                                                                    Brightness
                                                                        .light
                                                                ? Color
                                                                    .fromRGBO(
                                                                        158,
                                                                        158,
                                                                        158,
                                                                        1)
                                                                : null)),
                                              ),
                                              SizedBox(height: 5),
                                              Text(
                                                'Advisable',
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        128, 215, 114, 1),
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                          Spacer(),
                                          custom_checkbox3(d14, () {
                                            selectedsanitary = '4 times a day';

                                            setState5(() {
                                              d14 = !d14;
                                              d11 = false;
                                              d13 = false;
                                              d12 = false;
                                              d15 = false;
                                              d16 = false;
                                            });
                                          }),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    GestureDetector(
                                      onTap: () {
                                        selectedsanitary = 'Every 5th Hour';

                                        setState5(() {
                                          d15 = !d15;
                                          d11 = false;
                                          d13 = false;
                                          d12 = false;
                                          d14 = false;
                                          d16 = false;
                                        });
                                      },
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 15),
                                                child: Text('Every 5th Hour',
                                                    style: d15
                                                        ? TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w600)
                                                        : TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Theme.of(context)
                                                                        .brightness !=
                                                                    Brightness
                                                                        .light
                                                                ? Color
                                                                    .fromRGBO(
                                                                        158,
                                                                        158,
                                                                        158,
                                                                        1)
                                                                : null)),
                                              ),
                                              SizedBox(height: 5),
                                              Text(
                                                'Advisable',
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        128, 215, 114, 1),
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                          Spacer(),
                                          custom_checkbox3(d15, () {
                                            selectedsanitary = 'Every 5th Hour';

                                            setState5(() {
                                              d15 = !d15;
                                              d11 = false;
                                              d13 = false;
                                              d12 = false;
                                              d14 = false;
                                              d16 = false;
                                            });
                                          }),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 21),
                                    GestureDetector(
                                      onTap: () {
                                        selectedsanitary = 'Every 2 Hour';

                                        setState5(() {
                                          d16 = !d16;
                                          d11 = false;
                                          d13 = false;
                                          d12 = false;
                                          d14 = false;
                                          d15 = false;
                                        });
                                      },
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 15),
                                                child: Text('Every 2 Hour',
                                                    style: d16
                                                        ? TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w600)
                                                        : TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Theme.of(context)
                                                                        .brightness !=
                                                                    Brightness
                                                                        .light
                                                                ? Color
                                                                    .fromRGBO(
                                                                        158,
                                                                        158,
                                                                        158,
                                                                        1)
                                                                : null)),
                                              ),
                                            ],
                                          ),
                                          Spacer(),
                                          custom_checkbox3(d16, () {
                                            selectedsanitary = 'Every 2 Hour';

                                            setState5(() {
                                              d16 = !d16;
                                              d11 = false;
                                              d13 = false;
                                              d12 = false;
                                              d14 = false;
                                              d15 = false;
                                            });
                                          }),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    /////////////////
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          });
        });
  }
  ////////////

  void startAddNewTransaction1() {
    bool a11 = false;
    bool a12 = false;

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
          return StatefulBuilder(
              //stream: null,
              builder: (context, setState2) {
            return Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              //padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.75,
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                child: ListView(
                  //mainAxisSize: MainAxisSize.min,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        FlatButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Edit',
                              style: TextStyle(
                                  color: Color.fromRGBO(46, 154, 215, 1),
                                  fontSize: 17),
                            )),
                        Spacer(),
                        FlatButton(
                            onPressed: () {
                              setState(() {
                                widget.start_time = period_start_now1;
                                widget.start_day = _currentValue1;
                                val1 = true;
                                a11 = false;
                                a12 = false;
                              });
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Done',
                              style: TextStyle(
                                  color: Color.fromRGBO(46, 154, 215, 1),
                                  fontSize: 17),
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
                                  setState2(() {
                                    a11 = !a11;
                                    a12 = false;
                                  });

                                  //startPeriodTime1();
                                },
                                child: Text(
                                  // widget.start_time != null
                                  //     ? widget.start_time.format(context)
                                  //     :
                                  period_start_now1.format(context),
                                  //widget.start_time.format(context),
                                  style: TextStyle(
                                    color: Color.fromRGBO(108, 45, 5, 1),
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          a11 == true
                              ? Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      top: BorderSide(
                                        color: Theme.of(context).brightness ==
                                                Brightness.light
                                            ? Colors.black12
                                            : Colors.white38,
                                      ),
                                      bottom: BorderSide(
                                        color: Theme.of(context).brightness ==
                                                Brightness.light
                                            ? Colors.black12
                                            : Colors.white38,
                                      ),
                                    ),
                                  ),
                                  height: 207,
                                  // MediaQuery.of(context)
                                  //         .copyWith()
                                  //         .size
                                  //         .height /
                                  //     6,
                                  child: CupertinoDatePicker(
                                    backgroundColor:
                                        Theme.of(context).brightness ==
                                                Brightness.light
                                            ? Colors.white
                                            : Colors.black,
                                    initialDateTime: DateTime.now(),
                                    onDateTimeChanged: (DateTime newdate) {
                                      setState2(() {
                                        period_start_now1 =
                                            TimeOfDay.fromDateTime(newdate);
                                      });
                                      print(newdate);
                                    },
                                    maximumDate: new DateTime(2021, 12, 30),
                                    minimumYear: 2010,
                                    maximumYear: 2021,
                                    minuteInterval: 1,
                                    mode: CupertinoDatePickerMode.time,
                                  ),
                                  //datetime(),
                                )
                              : SizedBox(height: 10),
                          SizedBox(height: 7),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Remind me before',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w400),
                              ),
                              FlatButton(
                                onPressed: () {
                                  setState2(() {
                                    a11 = false;
                                    a12 = !a12;
                                  });

                                  //startPeriodsDays1();
                                },
                                child: Text(
                                  // widget.start_day != null
                                  //     ? '${widget.start_day} days'
                                  //     :
                                  '$_currentValue1 days',
                                  style: TextStyle(
                                    color: Color.fromRGBO(108, 45, 5, 1),
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          a12 == true
                              ? Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      top: BorderSide(
                                        color: Theme.of(context).brightness ==
                                                Brightness.light
                                            ? Colors.black12
                                            : Colors.white38,
                                      ),
                                      bottom: BorderSide(
                                        color: Theme.of(context).brightness ==
                                                Brightness.light
                                            ? Colors.black12
                                            : Colors.white38,
                                      ),
                                    ),
                                  ),
                                  height: 195,
                                  width: MediaQuery.of(context).size.width,
                                  // MediaQuery.of(context)
                                  //         .copyWith()
                                  //         .size
                                  //         .height /
                                  //     5.5,
                                  child: NumberPicker.integer(
                                      selectedTextStyle: TextStyle(
                                          color: Color.fromRGBO(51, 51, 51, 1),
                                          fontSize: 23,
                                          fontWeight: FontWeight.w400),
                                      highlightSelectedValue: true,
                                      initialValue: _currentValue1,
                                      minValue: 0,
                                      maxValue: 17,
                                      onChanged: (newVal) => setState2(
                                          () => _currentValue1 = newVal)),
                                )
                              : SizedBox(
                                  //height: 18,
                                  ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text('Reminder Message',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300)),
                            ],
                          ),
                          TextFormField(
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w400),
                            decoration: InputDecoration(
                              // border: InputBorder(borderSide: ),
                              hintText: 'New cycle starts soon!',
                              fillColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                            ),
                            controller: _titleController1,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
        });
  }

  void startAddNewTransaction2() {
    bool b11 = false;
    bool b12 = false;
    bool del = false;
    globals.popup = false;
    showModalBottomSheet(
        clipBehavior: Clip.none,
        barrierColor: Color.fromRGBO(73, 73, 73, 0.4),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        )),
        isScrollControlled: false,
        isDismissible: false,
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? Colors.transparent //Colors.white.withOpacity(0.6)
            : Colors.transparent, //Colors.black,
        //radius: 50,
        context: context,
        builder: (BuildContext context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: StatefulBuilder(
                //stream: null,
                builder: (context, setState2) {
              return ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
                //clipBehavior: Clip.values[1],
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
                    height: 496,
                    //margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    //padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                    child: Column(
                      //mainAxisSize: MainAxisSize.min,
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          flex: 0,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 16, 15, 0),
                            child: Row(
                              children: <Widget>[
                                FlatButton(
                                    onPressed: () {
                                      setState2(() {
                                        //val2 = false;
                                        del = !del;
                                        //alert = false;
                                      });
                                      // Navigator.pop(context);
                                    },
                                    child: Text(
                                      'Edit',
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(46, 154, 215, 1),
                                          fontSize: 17),
                                    )),
                                Spacer(),
                                FlatButton(
                                    onPressed: () async {
                                      DateTime endTime = DateTime.now().add(
                                          new Duration(days: _currentValue2));

                                      // targetDay day when period starts or Endtime
                                      var targetDay = DateTime(
                                          period_day.year,
                                          period_day.month,
                                          period_day.day,
                                          period_start_now2.hour,
                                          period_start_now2.minute);

                                      String remaindermsg =
                                          _titleController2.text == ''
                                              ? 'Your Period starts soon':_titleController2.text.trim();

                                      await NotificationHelper()
                                          .show_Notification_Over_An_Interval(
                                              messagetitle: 'Period Alert',
                                              messagebody: remaindermsg,
                                              numberofdaysprior: _currentValue2,
                                              offset: period_offset,
                                              targetday: targetDay);

                                      // setStartTime(DateTime(
                                      //     DateTime.now().year,
                                      //     DateTime.now().month,
                                      //     DateTime.now().day,
                                      //     DateTime.now().hour,
                                      //     DateTime.now().minute));

                                      // setEndTime(DateTime(
                                      //     endTime.year,
                                      //     endTime.month,
                                      //     endTime.day,
                                      //     period_start_now2.hour,
                                      //     period_start_now2.minute));

                                     // WidgetsFlutterBinding.ensureInitialized();
                                     // await AndroidAlarmManager.initialize();
                                     //  onTimePeriodic();
                                      setState(() {
                                        alert = true;
                                        widget.end_time = period_start_now2;
                                        widget.end_day = _currentValue2;
                                        val2 = true;
                                        b11 = false;
                                        b12 = false;
                                      });

                                      setStatus();
                                      globals1.periodalertupdate = true;
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'Done',
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(46, 154, 215, 1),
                                          fontSize: 17),
                                    )),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: ScrollConfiguration(
                            behavior: new ScrollBehavior()
                              ..buildViewportChrome(
                                  context, null, AxisDirection.down),
                            child: SingleChildScrollView(
                              child: Container(
                                padding: EdgeInsets.fromLTRB(30, 0, 25, 0),
                                child: Column(
                                  children: [
                                    Row(
                                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          'Remind me at',
                                          style: period_start_now2.hour != 0 &&
                                                  period_start_now2.minute != 0
                                              ? TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600)
                                              : TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400,
                                                  color: Theme.of(context)
                                                              .brightness !=
                                                          Brightness.light
                                                      ? Color.fromRGBO(
                                                          158, 158, 158, 1)
                                                      : null),
                                        ),
                                        Spacer(),
                                        FlatButton(
                                          onPressed: () {
                                            setState2(() {
                                              b11 = !b11;
                                              b12 = false;
                                            });

                                            //startPeriodTime1();
                                          },
                                          child: Column(
                                            children: [
                                              Text(
                                                // widget.start_time != null
                                                //     ? widget.start_time.format(context)
                                                //     :
                                                period_start_now2
                                                    .format(context),
                                                //widget.start_time.format(context),
                                                //widget.start_time.format(context),
                                                style: TextStyle(
                                                  color: del
                                                      ? Colors.red
                                                      : Theme.of(
                                                                      context)
                                                                  .brightness !=
                                                              Brightness.light
                                                          ? period_start_now2
                                                                          .hour ==
                                                                      0 &&
                                                                  period_start_now2
                                                                          .minute ==
                                                                      0
                                                              ? Color.fromRGBO(
                                                                  158,
                                                                  158,
                                                                  158,
                                                                  1)
                                                              : Colors.white
                                                          : Colors.black,
                                                  //decoration: TextDecoration.underline,
                                                ),
                                              ),
                                              Container(
                                                  width: 75,
                                                  child: Divider(
                                                    thickness: 3,
                                                    color: del
                                                        ? Colors.red
                                                        : Theme.of(context)
                                                                    .brightness !=
                                                                Brightness.light
                                                            ? _currentValue2 !=
                                                                    0
                                                                ? Colors.white
                                                                : Color
                                                                    .fromRGBO(
                                                                        158,
                                                                        158,
                                                                        158,
                                                                        1)
                                                            : Colors.black,
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    b11 == true
                                        ? Container(
                                            decoration: BoxDecoration(
                                              border: Border(
                                                top: BorderSide(
                                                  color: Theme.of(context)
                                                              .brightness ==
                                                          Brightness.light
                                                      ? Colors.black12
                                                      : Colors.white38,
                                                ),
                                                bottom: BorderSide(
                                                  color: Theme.of(context)
                                                              .brightness ==
                                                          Brightness.light
                                                      ? Colors.black12
                                                      : Colors.white38,
                                                ),
                                              ),
                                            ),
                                            height: 207,
                                            child: CupertinoTheme(
                                              data: CupertinoThemeData(
                                                textTheme:
                                                    CupertinoTextThemeData(
                                                  dateTimePickerTextStyle:
                                                      TextStyle(
                                                    fontSize: 22,
                                                    color: Theme.of(context)
                                                                .brightness ==
                                                            Brightness.light
                                                        ? Colors.black
                                                        : Colors.white,
                                                  ),
                                                ),
                                              ),
                                              child: CupertinoDatePicker(
                                                initialDateTime: DateTime.now(),
                                                onDateTimeChanged:
                                                    (DateTime newdate) {
                                                  setState2(() {
                                                    period_start_now2 =
                                                        TimeOfDay.fromDateTime(
                                                            newdate);
                                                    print(period_start_now2);
                                                  });

                                                  print(newdate);
                                                },
                                                maximumDate:
                                                    new DateTime(2021, 12, 30),
                                                minimumYear: 2010,
                                                maximumYear: 2021,
                                                minuteInterval: 1,
                                                mode: CupertinoDatePickerMode
                                                    .time,
                                              ),
                                            ),
                                            //datetime2(),
                                          )
                                        : SizedBox(height: 10),
                                    SizedBox(height: 7),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          'Remind me before',
                                          style: _currentValue2 != 0
                                              ? TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600)
                                              : TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400,
                                                  color: Theme.of(context)
                                                              .brightness !=
                                                          Brightness.light
                                                      ? Color.fromRGBO(
                                                          158, 158, 158, 1)
                                                      : null),
                                        ),
                                        FlatButton(
                                          onPressed: () {
                                            setState2(() {
                                              b11 = false;
                                              b12 = !b12;
                                            });

                                            //startPeriodsDays1();
                                          },
                                          child: Column(
                                            children: [
                                              Text(
                                                // widget.start_day != null
                                                //     ? '${widget.start_day} days'
                                                //     :
                                                '$_currentValue2 days',
                                                style: TextStyle(
                                                  color: del
                                                      ? Colors.red
                                                      : Theme.of(context)
                                                                  .brightness !=
                                                              Brightness.light
                                                          ? _currentValue2 != 0
                                                              ? Colors.white
                                                              : Color.fromRGBO(
                                                                  158,
                                                                  158,
                                                                  158,
                                                                  1)
                                                          : Colors.black,
                                                  //decoration: TextDecoration.underline,
                                                ),
                                              ),
                                              Container(
                                                  width: 75,
                                                  child: Divider(
                                                    thickness: 3,
                                                    color: del
                                                        ? Colors.red
                                                        : Theme.of(context)
                                                                    .brightness !=
                                                                Brightness.light
                                                            ? _currentValue2 !=
                                                                    0
                                                                ? Colors.white
                                                                : Color
                                                                    .fromRGBO(
                                                                        158,
                                                                        158,
                                                                        158,
                                                                        1)
                                                            : Colors.black,
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    b12 == true
                                        ? Container(
                                            decoration: BoxDecoration(
                                              border: Border(
                                                top: BorderSide(
                                                  color: Theme.of(context)
                                                              .brightness ==
                                                          Brightness.light
                                                      ? Colors.black12
                                                      : Colors.white38,
                                                ),
                                                bottom: BorderSide(
                                                  color: Theme.of(context)
                                                              .brightness ==
                                                          Brightness.light
                                                      ? Colors.black12
                                                      : Colors.white38,
                                                ),
                                              ),
                                            ),
                                            height: 150,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            // MediaQuery.of(context)
                                            //         .copyWith()
                                            //         .size
                                            //         .height /
                                            //     5.5,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: 55,
                                                  child: NumberPicker.integer(
                                                      // textMapper:,
                                                      selectedTextStyle: TextStyle(
                                                          color: Theme.of(context)
                                                                      .brightness ==
                                                                  Brightness
                                                                      .light
                                                              ? Color.fromRGBO(
                                                                  51, 51, 51, 1)
                                                              : Colors.white,
                                                          fontSize: 23,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      highlightSelectedValue:
                                                          true,
                                                      initialValue:
                                                          _currentValue2,
                                                      minValue: 0,
                                                      maxValue: 17,
                                                      onChanged: (newVal) =>
                                                          setState2(() =>
                                                              _currentValue2 =
                                                                  newVal)),
                                                ),
                                                Text('Days',
                                                    style: TextStyle(
                                                        fontSize: 23,
                                                        fontWeight:
                                                            FontWeight.w300))
                                              ],
                                            ),
                                          )
                                        : SizedBox(
                                            //height: 18,
                                            ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Text('Reminder Message',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w300)),
                                      ],
                                    ),
                                    TextFormField(
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w400),
                                      decoration: InputDecoration(
                                        // border: InputBorder(borderSide: ),
                                        hintText: 'Cycle ends soon!',
                                        fillColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                      ),
                                      controller: _titleController2,
                                    ),
                                    SizedBox(height: 50),
                                    if (del == true)
                                      GestureDetector(
                                          onTap: () {
                                            print('deleting remainder');
                                            NotificationHelper()
                                                .cancell_Notification_Interval(
                                                    _currentValue2,
                                                    period_offset);
                                            setState(() {
                                              _currentValue2 = 0;
                                              period_start_now2 =
                                                  TimeOfDay(hour: 0, minute: 0);

                                              val2 = false;
                                              // showAlertDialog1(
                                              //     'period_alert', setState);
                                            });
                                            Navigator.pop(context);
                                          },
                                          child: Center(
                                              child: Text(
                                            'Delete this reminder',
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 17),
                                          )))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          );
        });
  }

  void startAddNewTransaction3() {
    bool c11 = false;
    bool c12 = false;
    bool del = false;
    showModalBottomSheet(
        clipBehavior: Clip.none,
        elevation: 0,
        barrierColor: Color.fromRGBO(73, 73, 73, 0.4),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        )),
        isScrollControlled: false,
        isDismissible: true,
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? Colors.transparent //Colors.white.withOpacity(0.6)
            : Colors.transparent, //Colors.black,
        //radius: 50,
        context: context,
        builder: (BuildContext context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: StatefulBuilder(
                //stream: null,
                builder: (context, setState3) {
              return ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 15, sigmaY: 10),
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
                    height: 496,
                    // margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    //padding: EdgeInsets.fromLTRB(30, 15, 26, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          flex: 0,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 15, 18, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                FlatButton(
                                    onPressed: () {
                                      setState3(() {
                                        del = !del;
                                      });
                                      //Navigator.pop(context);
                                    },
                                    child: Text(
                                      'Edit',
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(46, 154, 215, 1),
                                          fontSize: 17),
                                    )),
                                Spacer(),
                                FlatButton(
                                    onPressed: () async {
                                      DateTime targetDay = DateTime(
                                          ovulaiton_day.year,
                                          ovulaiton_day.month,
                                          ovulaiton_day.day,
                                          period_start_now3.hour,
                                          period_start_now3.minute);

                                      String remmsg =
                                          _titleController3.text == ''
                                              ? 'Ovulation starts soon!'
                                              : _titleController3.text.trim();

                                      await NotificationHelper()
                                          .show_Notification_Over_An_Interval(
                                              messagetitle: 'Ovulation Alert',
                                              offset: ovulation_offset,
                                              messagebody: remmsg,
                                              numberofdaysprior: _currentValue3,
                                              targetday: targetDay);

                                      setState(() {
                                        widget.ovul_time = period_start_now3;
                                        widget.ovul_day = _currentValue3;
                                        val3 = true;
                                        c11 = false;
                                        c12 = false;
                                      });
                                      setStatus();
                                      globals1.ovulationupdate = true;
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'Done',
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(46, 154, 215, 1),
                                          fontSize: 17),
                                    )),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          flex: 2,
                          child: ScrollConfiguration(
                            behavior: new ScrollBehavior()
                              ..buildViewportChrome(
                                  context, null, AxisDirection.down),
                            child: SingleChildScrollView(
                              child: Container(
                                padding: EdgeInsets.fromLTRB(30, 0, 25, 0),
                                child: Column(
                                  children: [
                                    Row(
                                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          'Remind me at',
                                          style: period_start_now3.hour != 0 &&
                                                  period_start_now3.minute != 0
                                              ? TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600)
                                              : TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400,
                                                  color: Theme.of(context)
                                                              .brightness !=
                                                          Brightness.light
                                                      ? Color.fromRGBO(
                                                          158, 158, 158, 1)
                                                      : null),
                                        ),
                                        Spacer(),
                                        FlatButton(
                                          onPressed: () {
                                            setState3(() {
                                              c11 = !c11;
                                              c12 = false;
                                            });

                                            //startPeriodTime1();
                                          },
                                          child: Column(
                                            children: [
                                              Text(
                                                // widget.start_time != null
                                                //     ? widget.start_time.format(context)
                                                //     :
                                                period_start_now3
                                                    .format(context),
                                                //widget.start_time.format(context),
                                                //widget.start_time.format(context),
                                                style: TextStyle(
                                                  color: del
                                                      ? Colors.red
                                                      : Theme.of(
                                                                      context)
                                                                  .brightness !=
                                                              Brightness.light
                                                          ? period_start_now3
                                                                          .hour ==
                                                                      0 &&
                                                                  period_start_now3
                                                                          .minute ==
                                                                      0
                                                              ? Color.fromRGBO(
                                                                  158,
                                                                  158,
                                                                  158,
                                                                  1)
                                                              : Colors.white
                                                          : Colors.black,
                                                  //decoration: TextDecoration.underline,
                                                ),
                                              ),
                                              Container(
                                                  width: 75,
                                                  child: Divider(
                                                    thickness: 3,
                                                    color: del
                                                        ? Colors.red
                                                        : Theme.of(context)
                                                                    .brightness !=
                                                                Brightness.light
                                                            ? period_start_now3
                                                                            .hour ==
                                                                        0 &&
                                                                    period_start_now3
                                                                            .minute ==
                                                                        0
                                                                ? Color
                                                                    .fromRGBO(
                                                                        158,
                                                                        158,
                                                                        158,
                                                                        1)
                                                                : Colors.white
                                                            : Colors.black,
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    c11 == true
                                        ? Container(
                                            decoration: BoxDecoration(
                                              border: Border(
                                                top: BorderSide(
                                                  color: Theme.of(context)
                                                              .brightness ==
                                                          Brightness.light
                                                      ? Colors.black12
                                                      : Colors.white38,
                                                ),
                                                bottom: BorderSide(
                                                  color: Theme.of(context)
                                                              .brightness ==
                                                          Brightness.light
                                                      ? Colors.black12
                                                      : Colors.white38,
                                                ),
                                              ),
                                            ),
                                            height: 207,
                                            child: CupertinoTheme(
                                              data: CupertinoThemeData(
                                                textTheme:
                                                    CupertinoTextThemeData(
                                                  dateTimePickerTextStyle:
                                                      TextStyle(
                                                    fontSize: 22,
                                                    color: Theme.of(context)
                                                                .brightness ==
                                                            Brightness.light
                                                        ? Colors.black
                                                        : Colors.white,
                                                  ),
                                                ),
                                              ),
                                              child: CupertinoDatePicker(
                                                initialDateTime: DateTime.now(),
                                                onDateTimeChanged:
                                                    (DateTime newdate) {
                                                  setState3(() {
                                                    period_start_now3 =
                                                        TimeOfDay.fromDateTime(
                                                            newdate);
                                                    print(period_start_now3);
                                                  });

                                                  print(newdate);
                                                },
                                                maximumDate:
                                                    new DateTime(2021, 12, 30),
                                                minimumYear: 2010,
                                                maximumYear: 2021,
                                                minuteInterval: 1,
                                                mode: CupertinoDatePickerMode
                                                    .time,
                                              ),
                                            ),
                                            //datetime3(),
                                          )
                                        : SizedBox(height: 10),
                                    SizedBox(height: 7),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          'Remind me before',
                                          style: _currentValue3 != 0
                                              ? TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600)
                                              : TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400,
                                                  color: Theme.of(context)
                                                              .brightness !=
                                                          Brightness.light
                                                      ? Color.fromRGBO(
                                                          158, 158, 158, 1)
                                                      : null),
                                        ),
                                        FlatButton(
                                          onPressed: () {
                                            setState3(() {
                                              c11 = false;
                                              c12 = !c12;
                                            });

                                            //startPeriodsDays1();
                                          },
                                          child: Column(
                                            children: [
                                              Text(
                                                // widget.start_day != null
                                                //     ? '${widget.start_day} days'
                                                //     :
                                                '$_currentValue3 days',
                                                style: TextStyle(
                                                  color: del
                                                      ? Colors.red
                                                      : Theme.of(context)
                                                                  .brightness !=
                                                              Brightness.light
                                                          ? _currentValue3 == 0
                                                              ? Color.fromRGBO(
                                                                  158,
                                                                  158,
                                                                  158,
                                                                  1)
                                                              : Colors.white
                                                          : Colors.black,
                                                  // decoration: TextDecoration.underline,
                                                ),
                                              ),
                                              Container(
                                                  width: 75,
                                                  child: Divider(
                                                    thickness: 3,
                                                    color: del
                                                        ? Colors.red
                                                        : Theme.of(context)
                                                                    .brightness !=
                                                                Brightness.light
                                                            ? _currentValue3 ==
                                                                    0
                                                                ? Color
                                                                    .fromRGBO(
                                                                        158,
                                                                        158,
                                                                        158,
                                                                        1)
                                                                : Colors.white
                                                            : Colors.black,
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    c12 == true
                                        ? Container(
                                            decoration: BoxDecoration(
                                              border: Border(
                                                top: BorderSide(
                                                  color: Theme.of(context)
                                                              .brightness ==
                                                          Brightness.light
                                                      ? Colors.black12
                                                      : Colors.white38,
                                                ),
                                                bottom: BorderSide(
                                                  color: Theme.of(context)
                                                              .brightness ==
                                                          Brightness.light
                                                      ? Colors.black12
                                                      : Colors.white38,
                                                ),
                                              ),
                                            ),
                                            height: 150,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            // MediaQuery.of(context)
                                            //         .copyWith()
                                            //         .size
                                            //         .height /
                                            //     5.5,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: 55,
                                                  child: NumberPicker.integer(
                                                      selectedTextStyle: TextStyle(
                                                          color: Theme.of(context)
                                                                      .brightness ==
                                                                  Brightness
                                                                      .light
                                                              ? Color.fromRGBO(
                                                                  51, 51, 51, 1)
                                                              : Colors.white,
                                                          fontSize: 23,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      highlightSelectedValue:
                                                          true,
                                                      initialValue:
                                                          _currentValue3,
                                                      minValue: 0,
                                                      maxValue: 17,
                                                      onChanged: (newVal) =>
                                                          setState3(() =>
                                                              _currentValue3 =
                                                                  newVal)),
                                                ),
                                                Text('Days',
                                                    style: TextStyle(
                                                        fontSize: 23,
                                                        fontWeight:
                                                            FontWeight.w300))
                                              ],
                                            ),
                                          )
                                        : SizedBox(
                                            //height: 18,
                                            ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Text('Reminder Message',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w300)),
                                      ],
                                    ),
                                    TextFormField(
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500),
                                      decoration: InputDecoration(
                                        // border: InputBorder(borderSide: ),
                                        hintText: 'Ovulation starts soon!',
                                        fillColor:
                                            Theme.of(context).brightness ==
                                                    Brightness.light
                                                ? Colors.black
                                                : Colors.white,
                                        focusColor: Colors.black,
                                        hoverColor: Colors.black,
                                      ),
                                      controller: _titleController3,
                                    ),
                                    SizedBox(height: 50),
                                    if (del == true)
                                      GestureDetector(
                                          onTap: () async {
                                            print('deleting remainder');
                                            await NotificationHelper()
                                                .cancell_Notification_Interval(
                                                    _currentValue3,
                                                    ovulation_offset);

                                            setState(() {
                                              val3 = false;
                                              _currentValue3 = 0;
                                              period_start_now3 =
                                                  TimeOfDay(hour: 0, minute: 0);
                                            });
                                            Navigator.pop(context);
                                          },
                                          child: Center(
                                              child: Text(
                                            'Delete this reminder',
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 17),
                                          )))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          );
        });
  }

  showAlertDialog1(String para, Function setState) {
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
        setState(() {
          if (para == 'contraception') conraception = false;
          if (para == 'period_alert') alert = false;
          if (para == 'period_end') period_alertval = false;
          if (para == 'pills') pills = false;
        });
        Navigator.pop(context);
        if (para == 'period_alert' || para == 'period_end' || para == 'pills')
          Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert1 = AlertDialog(
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
        return alert1;
      },
    );
  }

  void check1() {
    if (conraception == false)
      setState(() {
        conraception = !conraception;
      });
    else
      showAlertDialog1('contraception', setState);
    setStatus();
    globals1.contraceptionupdate = true;
  }

  void check2() {
    pills_dialog();
  }

  Widget custom_checkbox2(bool value, Function abcd) {
    return GestureDetector(
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
    );
  }

  Widget custom_checkbox3(bool value, Function abcd) {
    return Transform.translate(
      offset: Offset(0, -8),
      child: InkWell(
        onTap: () {
          setState(() {
            value = !value;
            abcd();
          });
        },
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 8, 0, 2),
          height: 37,
          width: 47,
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

  // ignore: non_constant_identifier_names
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

  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      globals.status ? globals.player.play('sound.mp3') : null;
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.navigate_before,
                      size: 30,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      globals.status ? globals.player.play('sound.mp3') : null;
                      Navigator.pop(context);
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
                    '  Reminder',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  // Spacer(),
                  // FlatButton(
                  //     onPressed: () {
                  //       Navigator.pop(context);
                  //     },
                  //     child: Text(
                  //       'Done',
                  //       style: TextStyle(
                  //         fontSize: 17,
                  //       ),
                  //     )),
                ],
              ),
              Container(
                // margin: EdgeInsets.fromLTRB(20, 10, 20, 30),
                padding: EdgeInsets.all(10),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.start,
                            //   children: <Widget>[
                            //     Text(
                            //       'Cycles',
                            //       textAlign: TextAlign.left,
                            //       style: TextStyle(fontSize: 15),
                            //     ),
                            //   ],
                            // ),
                            // SizedBox(
                            //   height: 6,
                            // ),
                            // Row(
                            //   children: <Widget>[
                            //     Column(
                            //       crossAxisAlignment: CrossAxisAlignment.start,
                            //       children: <Widget>[
                            //         Text(
                            //           'Period start',
                            //           textAlign: TextAlign.left,
                            //           style: TextStyle(
                            //               fontSize: 17,
                            //               fontWeight: FontWeight.w600),
                            //         ),
                            //         Text(
                            //           widget.start_time != null &&
                            //                   widget.start_day != null
                            //               ? widget.start_time.format(context) +
                            //                   ' - ' +
                            //                   widget.start_day.toString() +
                            //                   ' days'
                            //               : '',
                            //           style: TextStyle(color: Colors.red),
                            //           textAlign: TextAlign.left,
                            //         ),
                            //       ],
                            //     ),
                            //     Spacer(),
                            //     custom_checkbox(val1, startAddNewTransaction1),
                            //   ],
                            // ),
                            //////////////////////
                            Text('Before',
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w600)),
                            SizedBox(
                              height: 29,
                            ),
                            GestureDetector(
                              onTap: () {
                                sanitary();
                              },
                              child: Row(
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Sanitary Pads',
                                        textAlign: TextAlign.left,
                                        style: val_pads
                                            ? TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600)
                                            : TextStyle(
                                                fontSize: 18,
                                                color: Theme.of(context)
                                                            .brightness !=
                                                        Brightness.light
                                                    ? Color.fromRGBO(
                                                        158, 158, 158, 1)
                                                    : null),
                                      ),
                                      Text(selectedsanitary,
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  255, 202, 66, 1)))
                                      // Text(
                                      //   widget.end_time != null &&
                                      //           widget.end_day != null
                                      //       ? widget.end_time.format(context) +
                                      //           ' - ' +
                                      //           widget.end_day.toString() +
                                      //           ' days'
                                      //       : '',
                                      //   style: TextStyle(color: Colors.red),
                                      //   textAlign: TextAlign.left,
                                      // ),
                                    ],
                                  ),
                                  Spacer(),
                                  custom_checkbox(val_pads, () {
                                    setState(() {
                                      //if (val_pads) {
                                      sanitary();
                                      //}
                                    });
                                  }),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            GestureDetector(
                              onTap: () {
                                startAddNewTransaction2();
                              },
                              child: Row(
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Period Alert',
                                        textAlign: TextAlign.left,
                                        style: alert
                                            ? TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600)
                                            : TextStyle(
                                                fontSize: 18,
                                                color: Theme.of(context)
                                                            .brightness !=
                                                        Brightness.light
                                                    ? Color.fromRGBO(
                                                        158, 158, 158, 1)
                                                    : null),
                                      ),
                                       if (period_alertval == true)
                                        Text(
                                          widget.end_time != null &&
                                                  widget.end_day != null
                                              ? widget.end_time
                                                      .format(context) +
                                                  ' - ' +
                                                  widget.end_day.toString() +
                                                  ' days'
                                              : '',
                                          style: TextStyle(color: Colors.red),
                                          textAlign: TextAlign.left,
                                        ),
                                      // Text(
                                      //   widget.ovul_time != null &&
                                      //           widget.ovul_day != null
                                      //       ? widget.ovul_time.format(context) +
                                      //           ' - ' +
                                      //           widget.ovul_day.toString() +
                                      //           ' days'
                                      //       : '',
                                      //   style: TextStyle(color: Colors.red),
                                      //   textAlign: TextAlign.left,
                                      // ),
                                    ],
                                  ),
                                  Spacer(),
                                  custom_checkbox(alert, () {
                                    setState(() {
                                      //period_alert2();
                                      startAddNewTransaction2();
                                      globals.popup = true;
                                    });
                                  }),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 29,
                            ),
                            Text('After',
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w600)),
                            SizedBox(
                              height: 29,
                            ),
                            GestureDetector(
                              onTap: () {
                                period_alert2();
                              },
                              child: Row(
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Period end',
                                        textAlign: TextAlign.left,
                                        style: period_alertval
                                            ? TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600)
                                            : TextStyle(
                                                fontSize: 18,
                                                color: Theme.of(context)
                                                            .brightness !=
                                                        Brightness.light
                                                    ? Color.fromRGBO(
                                                        158, 158, 158, 1)
                                                    : null),
                                      ),
                                     
                                    ],
                                  ),
                                  Spacer(),
                                  custom_checkbox(period_alertval, () {
                                    setState(() {
                                      //period_alert2();
                                      period_alert2();
                                    });
                                  }),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            GestureDetector(
                              onTap: () {
                                startAddNewTransaction3();
                              },
                              child: Row(
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Ovulation',
                                        textAlign: TextAlign.left,
                                        style: val3
                                            ? TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600)
                                            : TextStyle(
                                                fontSize: 18,
                                                color: Theme.of(context)
                                                            .brightness !=
                                                        Brightness.light
                                                    ? Color.fromRGBO(
                                                        158, 158, 158, 1)
                                                    : null),
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
                                  custom_checkbox(
                                      val3, startAddNewTransaction3),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 29,
                            ),
                            Text('Pills',
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w600)),
                            SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Medication and Contraception',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 29,
                            ),
                            GestureDetector(
                              onTap: () {
                                check1();
                              },
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    'Contraception',
                                    style: conraception
                                        ? TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600)
                                        : TextStyle(
                                            fontSize: 18,
                                            color:
                                                Theme.of(context).brightness !=
                                                        Brightness.light
                                                    ? Color.fromRGBO(
                                                        158, 158, 158, 1)
                                                    : null),
                                  ),
                                  Spacer(),
                                  custom_checkbox2(conraception, check1),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 35,
                            ),
                            GestureDetector(
                              onTap: () {
                                check2();
                              },
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    'Pills',
                                    style: pills
                                        ? TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600)
                                        : TextStyle(
                                            fontSize: 18,
                                            color:
                                                Theme.of(context).brightness !=
                                                        Brightness.light
                                                    ? Color.fromRGBO(
                                                        158, 158, 158, 1)
                                                    : null),
                                  ),
                                  Spacer(),
                                  custom_checkbox2(pills, check2),
                                ],
                              ),
                            ),
                          ],
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

  static periodicCallback() {
    NotificationHelper().showNotificationBtweenInterval();
  }

  onTimePeriodic() {
    SharedPreferences.getInstance().then((value) async {
      var a = value.getBool('oneTimePeriodic') ?? false;
      if (!a) {
        await AndroidAlarmManager.periodic(
            Duration(minutes: 1), 0, periodicCallback);
        onlyOneTimePeriodic();
      } else {
        print("Cannot run more than once");
      }
    });
  }
}
