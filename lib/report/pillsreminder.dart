import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PillReminder extends StatefulWidget {
  @override
  var reminder;
  PillReminder(reminder) {
    this.reminder = reminder;
  }
  _PillReminderState createState() => _PillReminderState(reminder);
}

class _PillReminderState extends State<PillReminder> {
  var reminder;
  _PillReminderState(reminder) {
    this.reminder = reminder;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
          color: Colors.white,
          padding: EdgeInsets.only(top: 25),
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 40, 0, 0),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20.0, bottom: 7.0, top: 0.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Reminders',
                              style: TextStyle(
                                  fontSize: 25.0, fontWeight: FontWeight.w500),
                            ),
                            IconButton(
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.black,
                                  size: 35,
                                ),
                                onPressed: null),
                          ])),
                  Container(
                      margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 53.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'keep yourself updated with the use of reminders for better tracking of your intakes',
                            style: TextStyle(
                                color: Color(0xff454545),
                                fontSize: 15.0,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 25.0,
                          ),
                          for (var rem in reminder)
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: 180.0,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          width: 180.0,
                                          child: Text(rem[0],
                                              style: TextStyle(
                                                decoration:
                                                    TextDecoration.underline,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 17.0,
                                              )),
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        Text(rem[1],
                                            style: TextStyle(
                                                color: Color(0xff454545),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400)),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    rem[2],
                                    style: TextStyle(
                                      color: Color(0xff727272),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17.0,
                                    ),
                                  ),
                                ],
                              ),
                            )
                        ],
                      )),
                  SizedBox(
                    height: 50.0,
                  ),
                ],
              ))),
    ));
  }
}
