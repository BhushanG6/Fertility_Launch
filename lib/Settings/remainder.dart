import 'package:flutter/material.dart';
import 'package:rounded_modal/rounded_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:numberpicker/numberpicker.dart';
import 'globals.dart' as globals;

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
  _RemainderAgainState createState() => _RemainderAgainState();
}

class _RemainderAgainState extends State<RemainderAgain> {
  @override
  final _titleController_alert = TextEditingController();

  bool pad = false;
  bool period_alert = false;
  bool tampons = false;
  bool cloth = false;
  //////////////////
  bool val1 = false;
  bool val2 = false;
  bool val3 = false;
  bool val_pads = false;
  bool alert = false;
  TimeOfDay period_start_now1 = TimeOfDay(hour: 10, minute: 10);
  TimeOfDay period_start_now2 = TimeOfDay(hour: 10, minute: 10);
  TimeOfDay period_start_now3 = TimeOfDay(hour: 10, minute: 10);

  int _currentValue1 = 9;
  int _currentValue2 = 9;
  int _currentValue3 = 9;
  final pillname = TextEditingController();
  final pills_ovul = TextEditingController();
  final _titleController1 = TextEditingController();
  final _titleController2 = TextEditingController();
  final _titleController3 = TextEditingController();

  bool conraception = false;
  bool pills = false;

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
                height: MediaQuery.of(context).size.height * 0.7,
                margin: EdgeInsets.fromLTRB(36, 0, 30, 0),
                //padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 36),
                      child: Row(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Cancel',
                                style: TextStyle(color: Colors.blue),
                              )),
                          Spacer(),
                          GestureDetector(
                              onTap: () {
                                setState(() {
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
                                style: TextStyle(color: Colors.blue),
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 36,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Pads'),
                        Spacer(),
                        custom_checkbox(pad, () {
                          setState2(() {
                            pad = !pad;
                            cloth = false;
                            tampons = false;
                            if (pad) {
                              inside_sanitary();
                            }
                          });
                        })
                      ],
                    ),
                    SizedBox(height: 57),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Tampons'),
                        Spacer(),
                        custom_checkbox(tampons, () {
                          setState2(() {
                            tampons = !tampons;
                            cloth = false;
                            pad = false;
                            if (tampons) {
                              inside_sanitary();
                            }
                          });
                        })
                      ],
                    ),
                    SizedBox(height: 57),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Cloth'),
                        Spacer(),
                        custom_checkbox(cloth, () {
                          setState2(() {
                            cloth = !cloth;
                            pad = false;
                            tampons = false;
                            if (cloth) {
                              inside_sanitary();
                            }
                            // cloth = !cloth;
                          });
                        })
                      ],
                    ),
                  ],
                ),
              ),
            );
          });
        });
  }

  ///////////////
  void period_alert2() {
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
                height: MediaQuery.of(context).size.height * 0.7,
                margin: EdgeInsets.fromLTRB(36, 0, 30, 0),
                //padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 36),
                        child: Row(
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'Edit',
                                  style: TextStyle(color: Colors.blue),
                                )),
                            Spacer(),
                            GestureDetector(
                                onTap: () {
                                  setState(() {});
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'Done',
                                  style: TextStyle(color: Colors.blue),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Period End',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              )),
                          Spacer(),
                          CupertinoSwitch(
                              value: period_alert,
                              activeColor: Colors.yellow[700],
                              onChanged: (value) {
                                setState2(() {
                                  period_alert = value;
                                });
                              }),
                        ],
                      ),
                      SizedBox(height: 15),
                      Text('This shall be reminded by the end of the day.',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                          )),
                      SizedBox(height: 87),
                      Text('Reminder Message'),
                      SizedBox(height: 22),
                      TextFormField(
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w400),
                        decoration: InputDecoration(
                          // border: InputBorder(borderSide: ),
                          hintText: 'Ovulation starts soon!',
                          fillColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                        ),
                        controller: _titleController_alert,
                      ),
                    ],
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
    // bool a12 = false;

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
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'Edit',
                                  style: TextStyle(color: Colors.blue),
                                )),
                            Spacer(),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    // widget.start_time = period_start_now1;
                                    // widget.start_day = _currentValue1;
                                    // val1 = true;
                                    // a11 = false;
                                    // a12 = false;
                                  });
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'Done',
                                  style: TextStyle(color: Colors.blue),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('From',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400)),
                                    SizedBox(height: 3),
                                    Text('5 days of medication',
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                150, 150, 150, 1),
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),
                                Spacer(),
                                Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.only(bottom: 5),
                                  height: 30,
                                  width: 113,
                                  child: Text('Today',
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(114, 114, 114, 1),
                                          fontSize: 17,
                                          fontWeight: FontWeight.w400)),
                                  decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide())),
                                ),
                              ],
                            ),
                            SizedBox(height: 26),
                            /////////////////
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Till',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400)),
                                  ],
                                ),
                                Spacer(),
                                Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.only(bottom: 5),
                                  height: 30,
                                  width: 113,
                                  child: Text('24 Jan, Wed',
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(114, 114, 114, 1),
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500)),
                                  decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide())),
                                ),
                              ],
                            ),
                            SizedBox(height: 42),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('No of Pills/day',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400)),
                                  ],
                                ),
                                Spacer(),
                                Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.only(bottom: 5),
                                  height: 30,
                                  width: 113,
                                  child: Text('3',
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(114, 114, 114, 1),
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500)),
                                  decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide())),
                                ),
                              ],
                            ),
                            SizedBox(height: 42),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Stages',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400)),
                                  ],
                                ),
                                Spacer(),
                                Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.only(bottom: 5),
                                  height: 30,
                                  width: 113,
                                  child: Text('3',
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(114, 114, 114, 1),
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500)),
                                  decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide())),
                                ),
                              ],
                            ),
                            ///////////////////
                            SizedBox(height: 40),
                            Text('Name of the Pills',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w400)),
                            SizedBox(height: 15),
                            TextFormField(
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w400),
                              decoration: InputDecoration(
                                // border: InputBorder(borderSide: ),
                                hintText: 'Glass Buster',
                                hintStyle: TextStyle(
                                    color: Color.fromRGBO(114, 114, 114, 1),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                                fillColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                              ),
                              controller: pillname,
                            ),
                            SizedBox(
                              height: 45,
                            ),
                            Text('Reminder Message',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w300)),
                            SizedBox(height: 22),
                            TextFormField(
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w400),
                              decoration: InputDecoration(
                                // border: InputBorder(borderSide: ),
                                hintText: 'Ovulation starts soon',
                                fillColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                              ),
                              controller: pills_ovul,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
        });
  }

  /////////////
  void inside_sanitary() {
    bool d1 = false;
    bool d2 = false;
    bool d3 = false;
    bool d4 = false;
    bool d5 = false;
    bool d6 = false;

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
              builder: (context, setState5) {
            return Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              //padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.75,
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(color: Colors.blue),
                                )),
                            Spacer(),
                            InkWell(
                                onTap: () {
                                  //setState5(() {});
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'Save',
                                  style: TextStyle(color: Colors.blue),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 17,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Your Average',
                                style: TextStyle(
                                    fontSize: 28, fontWeight: FontWeight.w600)),
                            SizedBox(height: 3),
                            Text(
                                'This shall be reminded only during your period days',
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w400)),
                            SizedBox(height: 35),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Once a day',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400)),
                                Spacer(),
                                custom_checkbox3(d1, () {
                                  setState5(() {
                                    d1 = !d1;
                                    d2 = false;
                                    d3 = false;
                                    d4 = false;
                                    d5 = false;
                                    d6 = false;
                                  });
                                }),
                              ],
                            ),
                            SizedBox(height: 39),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Twice a day',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400)),
                                Spacer(),
                                custom_checkbox3(d2, () {
                                  setState5(() {
                                    d2 = !d2;
                                    d1 = false;
                                    d3 = false;
                                    d4 = false;
                                    d5 = false;
                                    d6 = false;
                                  });
                                }),
                              ],
                            ),
                            SizedBox(height: 39),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Thrice a day',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400)),
                                Spacer(),
                                custom_checkbox3(d3, () {
                                  setState5(() {
                                    d3 = !d3;
                                    d1 = false;
                                    d2 = false;
                                    d4 = false;
                                    d5 = false;
                                    d6 = false;
                                  });
                                }),
                              ],
                            ),
                            SizedBox(height: 39),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('4 times a day',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400)),
                                    SizedBox(height: 5),
                                    Text(
                                      'Advisable',
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(128, 215, 114, 1),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                custom_checkbox3(d4, () {
                                  setState5(() {
                                    d4 = !d4;
                                    d1 = false;
                                    d3 = false;
                                    d2 = false;
                                    d5 = false;
                                    d6 = false;
                                  });
                                }),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Every 5th Hour',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400)),
                                    SizedBox(height: 5),
                                    Text(
                                      'Advisable',
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(128, 215, 114, 1),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                custom_checkbox3(d5, () {
                                  setState5(() {
                                    d5 = !d5;
                                    d1 = false;
                                    d3 = false;
                                    d2 = false;
                                    d4 = false;
                                    d6 = false;
                                  });
                                }),
                              ],
                            ),
                            SizedBox(height: 21),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Every 2 Hour',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400)),
                                  ],
                                ),
                                Spacer(),
                                custom_checkbox3(d6, () {
                                  setState5(() {
                                    d6 = !d6;
                                    d1 = false;
                                    d3 = false;
                                    d2 = false;
                                    d4 = false;
                                    d5 = false;
                                  });
                                }),
                              ],
                            ),
                            SizedBox(height: 20),
                            /////////////////
                          ],
                        ),
                      ),
                    ],
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
                              'Cancel',
                              style: TextStyle(color: Colors.blue),
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
                                'From when to start',
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
                              'Cancel',
                              style: TextStyle(color: Colors.blue),
                            )),
                        Spacer(),
                        FlatButton(
                            onPressed: () {
                              setState(() {
                                widget.end_time = period_start_now2;
                                widget.end_day = _currentValue2;
                                val2 = true;
                                b11 = false;
                                b12 = false;
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
                                  setState2(() {
                                    b11 = !b11;
                                    b12 = false;
                                  });

                                  //startPeriodTime1();
                                },
                                child: Text(
                                  // widget.start_time != null
                                  //     ? widget.start_time.format(context)
                                  //     :
                                  period_start_now2.format(context),
                                  //widget.start_time.format(context),
                                  //widget.start_time.format(context),
                                  style: TextStyle(
                                    color: Color.fromRGBO(108, 45, 5, 1),
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          b11 == true
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
                                  child: CupertinoDatePicker(
                                    initialDateTime: DateTime.now(),
                                    onDateTimeChanged: (DateTime newdate) {
                                      setState2(() {
                                        period_start_now2 =
                                            TimeOfDay.fromDateTime(newdate);
                                        print(period_start_now2);
                                      });

                                      print(newdate);
                                    },
                                    maximumDate: new DateTime(2021, 12, 30),
                                    minimumYear: 2010,
                                    maximumYear: 2021,
                                    minuteInterval: 1,
                                    mode: CupertinoDatePickerMode.time,
                                  ),
                                  //datetime2(),
                                )
                              : SizedBox(height: 10),
                          SizedBox(height: 7),
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
                                  setState2(() {
                                    b11 = false;
                                    b12 = !b12;
                                  });

                                  //startPeriodsDays1();
                                },
                                child: Text(
                                  // widget.start_day != null
                                  //     ? '${widget.start_day} days'
                                  //     :
                                  '$_currentValue2 days',
                                  style: TextStyle(
                                    color: Color.fromRGBO(108, 45, 5, 1),
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          b12 == true
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
                                      initialValue: _currentValue2,
                                      minValue: 0,
                                      maxValue: 17,
                                      onChanged: (newVal) => setState2(
                                          () => _currentValue2 = newVal)),
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
                              hintText: 'Cycle ends soon!',
                              fillColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                            ),
                            controller: _titleController2,
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

  void startAddNewTransaction3() {
    bool c11 = false;
    bool c12 = false;
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
              builder: (context, setState3) {
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
                              'Cancel',
                              style: TextStyle(color: Colors.blue),
                            )),
                        Spacer(),
                        FlatButton(
                            onPressed: () {
                              setState(() {
                                widget.ovul_time = period_start_now3;
                                widget.ovul_day = _currentValue3;
                                val3 = true;
                                c11 = false;
                                c12 = false;
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
                                  setState3(() {
                                    c11 = !c11;
                                    c12 = false;
                                  });

                                  //startPeriodTime1();
                                },
                                child: Text(
                                  // widget.start_time != null
                                  //     ? widget.start_time.format(context)
                                  //     :
                                  period_start_now3.format(context),
                                  //widget.start_time.format(context),
                                  //widget.start_time.format(context),
                                  style: TextStyle(
                                    color: Color.fromRGBO(108, 45, 5, 1),
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          c11 == true
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
                                  child: CupertinoDatePicker(
                                    initialDateTime: DateTime.now(),
                                    onDateTimeChanged: (DateTime newdate) {
                                      setState3(() {
                                        period_start_now3 =
                                            TimeOfDay.fromDateTime(newdate);
                                        print(period_start_now3);
                                      });

                                      print(newdate);
                                    },
                                    maximumDate: new DateTime(2021, 12, 30),
                                    minimumYear: 2010,
                                    maximumYear: 2021,
                                    minuteInterval: 1,
                                    mode: CupertinoDatePickerMode.time,
                                  ),
                                  //datetime3(),
                                )
                              : SizedBox(height: 10),
                          SizedBox(height: 7),
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
                                  setState3(() {
                                    c11 = false;
                                    c12 = !c12;
                                  });

                                  //startPeriodsDays1();
                                },
                                child: Text(
                                  // widget.start_day != null
                                  //     ? '${widget.start_day} days'
                                  //     :
                                  '$_currentValue3 days',
                                  style: TextStyle(
                                    color: Color.fromRGBO(108, 45, 5, 1),
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          c12 == true
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
                                      initialValue: _currentValue3,
                                      minValue: 0,
                                      maxValue: 17,
                                      onChanged: (newVal) => setState3(
                                          () => _currentValue3 = newVal)),
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
                              hintText: 'Ovulation starts soon!',
                              fillColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                            ),
                            controller: _titleController3,
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

  void check1() {
    conraception = !conraception;
  }

  void check2() {
    pills = !pills;
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
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.black
                  : Colors.white,
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
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.black
                    : Colors.white,
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
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.black
                    : Colors.white,
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
                          Row(
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Sanitary Pads',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),
                                  ),
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
                                  val_pads = !val_pads;
                                  if (val_pads) {
                                    sanitary();
                                  }
                                });
                              }),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Period Alert',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),
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
                                  alert = !alert;
                                  period_alert2();
                                });
                              }),
                            ],
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
                          Row(
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Period end',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),
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
                              custom_checkbox(val2, startAddNewTransaction2),
                            ],
                          ),
                          SizedBox(
                            height: 30,
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
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),
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
                              custom_checkbox(val3, startAddNewTransaction3),
                            ],
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
                                    fontSize: 15, fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 29,
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                'Contraception',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w600),
                              ),
                              Spacer(),
                              custom_checkbox2(conraception, check1),
                            ],
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                'Pills',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w600),
                              ),
                              Spacer(),
                              custom_checkbox2(pills, check2),
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
        ),
      )),
    );
  }
}
