import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../utils/date_models.dart';
import '../utils/date_utils.dart' as dp;
import '../month/monthly_view.dart';
import '../globals.dart' as globals;

bool abcd2 = false;

class YearlyMissed extends StatefulWidget {
  final DateTime minDate;
  final DateTime maxDate;
  final MonthBuilder monthBuilder;
  final DayBuilder dayBuilder;
  final DateTime initialMinDate;
  final DateTime initialMaxDate;
  final ValueChanged<DateTime> onDayPressed;
  final PeriodChanged onRangeSelected;
  final EdgeInsetsGeometry listPadding;

  YearlyMissed(
      {@required this.minDate,
      @required this.maxDate,
      this.monthBuilder,
      this.dayBuilder,
      this.onDayPressed,
      this.onRangeSelected,
      this.initialMinDate,
      this.initialMaxDate,
      this.listPadding})
      : assert(minDate != null),
        assert(maxDate != null),
        assert(minDate.isBefore(maxDate));

  @override
  _YearlyMissedState createState() => _YearlyMissedState();
}

class _YearlyMissedState extends State<YearlyMissed> {
  bool ifExists = false;
  DateTime _minDate;
  DateTime _maxDate;
  List<Month> _months;
  DateTime rangeMinDate;
  DateTime rangeMaxDate;
  bool isValid(Map<dynamic, dynamic> mp) {
    //int u = 0;
    globals.missed.forEach((k, v) {
      //u = u + 1;
      if ((globals.lop[k] == true && v == false) ||
          (globals.lop[k] == false && v == true)) {
        print("Key : $k, Value : $v");
        return true;
      }
      // if (u == globals.missed.length) {
      //   return false;
      // }
    });
    return false;
  }

  @override
  void initState() {
    super.initState();
    abcd2 = false;
    _months = dp.DateUtils.extractWeeks(widget.minDate, widget.maxDate);
    _minDate = widget.minDate.removeTime();
    _maxDate = widget.maxDate.removeTime();
    rangeMinDate = widget.initialMinDate;
    rangeMaxDate = widget.initialMaxDate;
  }

  @override
  void didUpdateWidget(YearlyMissed oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.minDate != widget.minDate ||
        oldWidget.maxDate != widget.maxDate) {
      print('I am in update widget');
      _months = dp.DateUtils.extractWeeks(widget.minDate, widget.maxDate);
      _minDate = widget.minDate.removeTime();
      _maxDate = widget.maxDate.removeTime();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          ListView.builder(
            cacheExtent:
                (MediaQuery.of(context).size.width / DateTime.daysPerWeek) * 6,
            padding: widget.listPadding ?? EdgeInsets.zero,
            itemCount: _months.length,
            itemBuilder: (BuildContext context, int position) {
              return _MonthView(
                month: _months[position],
                minDate: _minDate,
                maxDate: _maxDate,
                monthBuilder: widget.monthBuilder,
                dayBuilder: widget.dayBuilder,
                onDayPressed: widget.onRangeSelected != null
                    ? (DateTime date) {
                        print('Yes it\'s pressed');
                        setState(() {
                          rangeMinDate = date;
                          rangeMaxDate = date;
                          globals.d = date;
                          if (globals.missed[date] == null) {
                            //changing
                            globals.missed[date] = false;
                          }
                          if (globals.li[date] == null) {
                            globals.li[date] = {};
                          }
                        });
                        // if (rangeMinDate == null || rangeMaxDate != null) {
                        //   setState(() {
                        //     rangeMinDate = date;
                        //     rangeMaxDate = null;
                        //   });
                        // } else if (date.isBefore(rangeMinDate)) {
                        //   setState(() {
                        //     rangeMaxDate = rangeMinDate;
                        //     rangeMinDate = date;
                        //   });
                        // } else if (date.isAfter(rangeMinDate)) {
                        //   setState(() {
                        //     rangeMaxDate = date;
                        //   });
                        // }

                        // widget.onRangeSelected(rangeMinDate, rangeMaxDate);

                        // if (widget.onDayPressed != null) {
                        //   widget.onDayPressed(date);
                        // }
                        // setState(() {
                        //   globals.d2 = rangeMaxDate;
                        //   globals.d1 = rangeMinDate;
                        // });
                      }
                    : widget.onDayPressed,
                rangeMinDate: rangeMinDate,
                rangeMaxDate: rangeMaxDate,
              );
            },
          ),
          Positioned(
            bottom: 120,
            left: MediaQuery.of(context).size.width / 2.7,
            child: RaisedButton(
              onPressed: () {},
              child: abcd2 == true
                  ? InkWell(
                      onTap: () {
                        if (isValid(globals.missed) == true) {
                          setState(() {
                            ifExists = true;
                          });
                        } else {
                          setState(() {
                            ifExists = true;
                            //false;
                          });
                        }

                        ifExists == true
                            ? showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (context) {
                                  return SimpleDialog(
                                    contentPadding:
                                        EdgeInsets.fromLTRB(0, 12, 0, 0),
                                    title: Text(
                                        "Would you like to make changes in the records?"),
                                    children: [
                                      //Divider(thickness: 2, color: Colors.black),
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1, color: Colors.black),
                                        ),
                                        child: Center(
                                          child: Row(
                                            children: [
                                              //SizedBox(width: 50),
                                              InkWell(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Container(
                                                  height: 45,
                                                  alignment: Alignment.center,
                                                  width: (MediaQuery.of(context)
                                                              .size
                                                              .width -
                                                          48) *
                                                      0.45,
                                                  child: Text('Yes',
                                                      style: TextStyle(
                                                          fontSize: 20)),
                                                  decoration: BoxDecoration(
                                                    border: Border(
                                                        right: BorderSide(
                                                            width: 0.5,
                                                            color:
                                                                Colors.black)),
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Container(
                                                  height: 45,
                                                  alignment: Alignment.center,
                                                  width: (MediaQuery.of(context)
                                                              .size
                                                              .width -
                                                          50) *
                                                      0.4,
                                                  child: Text('No',
                                                      style: TextStyle(
                                                          fontSize: 20)),
                                                  decoration: BoxDecoration(
                                                      border: Border(
                                                          left: BorderSide(
                                                              width: 0.5,
                                                              color: Colors
                                                                  .black))),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                })
                            : SizedBox();
                      },
                      child: Text(
                        'Done',
                        style: TextStyle(fontSize: 20),
                      ))
                  : InkWell(
                      onTap: () {
                        setState(() {
                          abcd2 = !abcd2;
                        });
                      },
                      child: Text(
                        'Edit',
                        style: TextStyle(fontSize: 20),
                      )),
            ),
          )
        ],
      ),
    );
  }
}

class _MonthView extends StatelessWidget {
  bool isLeapYear(int year) {
    bool leapYear = false;
    bool leap = ((year % 100 == 0) && (year % 400 != 0));
    if (leap == true) {
      return false;
    } else if (year % 4 == 0) {
      return true;
    }

    return leapYear;
  }

  List<int> daysPerMonth(int year) => <int>[
        31,
        isLeapYear(year) ? 29 : 30,
        31,
        30,
        31,
        30,
        31,
        31,
        30,
        31,
        30,
        31,
      ];
  bool issel = false;
  Map<int, int> qazq = globals.mainq();
  final Month month;
  final DateTime minDate;
  final DateTime maxDate;
  final MonthBuilder monthBuilder;
  final DayBuilder dayBuilder;
  final ValueChanged<DateTime> onDayPressed;
  final DateTime rangeMinDate;
  final DateTime rangeMaxDate;

  _MonthView(
      {@required this.month,
      @required this.minDate,
      @required this.maxDate,
      this.monthBuilder,
      this.dayBuilder,
      this.onDayPressed,
      this.rangeMinDate,
      this.rangeMaxDate,
      Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.fromLTRB(7, 10, 7, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            monthBuilder != null
                ? monthBuilder(
                    context,
                    month.month,
                    month.year,
                  )
                : Container(
                    padding: EdgeInsets.only(
                      left: 5,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    new MaterialPageRoute(
                                        builder: (context) => MonthlyView(
                                            month: month.month,
                                            year: month.year,
                                            valu: globals.lop[globals.pq])),
                                  );
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                    //padding: EdgeInsets.all(0),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      physics: NeverScrollableScrollPhysics(),
                                      child: Column(
                                        children: [
                                          // SizedBox(
                                          //   height: 50,
                                          // ),
                                          Row(children: [
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  7.8,
                                              child: Text(
                                                qazq[month.month *
                                                            month.year] ==
                                                        1
                                                    ? globals.dates[month.month]
                                                    : '   ',
                                                style: TextStyle(
                                                  color: Theme.of(context)
                                                              .brightness ==
                                                          Brightness.light
                                                      ? Colors.black
                                                      : Colors.white,
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  7.8,
                                              child: Text(
                                                qazq[month.month *
                                                            month.year] ==
                                                        2
                                                    ? globals.dates[month.month]
                                                    : '   ',
                                                style: TextStyle(
                                                  color: Theme.of(context)
                                                              .brightness ==
                                                          Brightness.light
                                                      ? Colors.black
                                                      : Colors.white,
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  7.8,
                                              child: Text(
                                                qazq[month.month *
                                                            month.year] ==
                                                        3
                                                    ? globals.dates[month.month]
                                                    : '   ',
                                                style: TextStyle(
                                                  color: Theme.of(context)
                                                              .brightness ==
                                                          Brightness.light
                                                      ? Colors.black
                                                      : Colors.white,
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  7.8,
                                              child: Text(
                                                qazq[month.month *
                                                            month.year] ==
                                                        4
                                                    ? globals.dates[month.month]
                                                    : '   ',
                                                style: TextStyle(
                                                  color: Theme.of(context)
                                                              .brightness ==
                                                          Brightness.light
                                                      ? Colors.black
                                                      : Colors.white,
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  7.8,
                                              child: Text(
                                                qazq[month.month *
                                                            month.year] ==
                                                        5
                                                    ? globals.dates[month.month]
                                                    : '   ',
                                                style: TextStyle(
                                                  color: Theme.of(context)
                                                              .brightness ==
                                                          Brightness.light
                                                      ? Colors.black
                                                      : Colors.white,
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  7.8,
                                              child: Text(
                                                qazq[month.month *
                                                            month.year] ==
                                                        6
                                                    ? globals.dates[month.month]
                                                    : '   ',
                                                style: TextStyle(
                                                  color: Theme.of(context)
                                                              .brightness ==
                                                          Brightness.light
                                                      ? Colors.black
                                                      : Colors.white,
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  6,
                                              child: Text(
                                                qazq[month.month *
                                                            month.year] ==
                                                        7
                                                    ? globals.dates[month.month]
                                                    : '   ',
                                                style: TextStyle(
                                                  color: Theme.of(context)
                                                              .brightness ==
                                                          Brightness.light
                                                      ? Colors.black
                                                      : Colors.white,
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ]),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: NeverScrollableScrollPhysics(),
                          child: Row(children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 7.1,
                              child: Text(
                                '   ',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Theme.of(context).brightness ==
                                          Brightness.light
                                      ? Colors.black
                                      : Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 7.1,
                              child: Text(
                                qazq[month.month * month.year] == 1
                                    ? '   Mon'
                                    : '   ',
                                style: TextStyle(
                                  color: Theme.of(context).brightness ==
                                          Brightness.light
                                      ? Colors.black
                                      : Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 7.1,
                              child: Text(
                                qazq[month.month * month.year] == 1 ||
                                        qazq[month.month * month.year] == 2
                                    ? '   Tue'
                                    : '   ',
                                style: TextStyle(
                                  color: Theme.of(context).brightness ==
                                          Brightness.light
                                      ? Colors.black
                                      : Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 7.1,
                              child: Text(
                                qazq[month.month * month.year] == 1 ||
                                        qazq[month.month * month.year] == 2 ||
                                        qazq[month.month * month.year] == 3
                                    ? ' Wed'
                                    : '   ',
                                style: TextStyle(
                                  color: Theme.of(context).brightness ==
                                          Brightness.light
                                      ? Colors.black
                                      : Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 7.1,
                              child: Text(
                                qazq[month.month * month.year] == 1 ||
                                        qazq[month.month * month.year] == 2 ||
                                        qazq[month.month * month.year] == 3 ||
                                        qazq[month.month * month.year] == 4
                                    ? ' Thu'
                                    : '   ',
                                style: TextStyle(
                                  color: Theme.of(context).brightness ==
                                          Brightness.light
                                      ? Colors.black
                                      : Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 7.1,
                              child: Text(
                                qazq[month.month * month.year] == 1 ||
                                        qazq[month.month * month.year] == 2 ||
                                        qazq[month.month * month.year] == 3 ||
                                        qazq[month.month * month.year] == 4 ||
                                        qazq[month.month * month.year] == 5
                                    ? ' Fri'
                                    : '   ',
                                style: TextStyle(
                                  color: Theme.of(context).brightness ==
                                          Brightness.light
                                      ? Colors.black
                                      : Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 7.1,
                              child: Text(
                                qazq[month.month * month.year] == 1 ||
                                        qazq[month.month * month.year] == 2 ||
                                        qazq[month.month * month.year] == 3 ||
                                        qazq[month.month * month.year] == 4 ||
                                        qazq[month.month * month.year] == 5 ||
                                        qazq[month.month * month.year] == 6
                                    ? 'Sat'
                                    : '   ',
                                style: TextStyle(
                                  color: Theme.of(context).brightness ==
                                          Brightness.light
                                      ? Colors.black
                                      : Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
            SizedBox(),
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Table(
                children: month.weeks
                    .map((Week week) => _generateFor(context, week, month))
                    .toList(growable: false),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TableRow _generateFor(BuildContext context, Week week, Month mon) {
    DateTime firstDay = week.firstDay;
    bool rangeFeatureEnabled = rangeMinDate != null;
    DateTime re;
    re = firstDay.subtract(Duration(days: 1));
    return TableRow(
      children: List<Widget>.generate(DateTime.daysPerWeek, (int position) {
        DateTime day = DateTime(
          week.firstDay.year,
          week.firstDay.month,
          firstDay.day + (position - (firstDay.weekday)),
        );

        if ((position + 1) < week.firstDay.weekday ||
            (position) > week.lastDay.weekday ||
            day.isBefore(minDate) ||
            day.isAfter(maxDate)) {
          return const SizedBox();
        } else {
          bool isSelected = false;
          if (rangeFeatureEnabled) {
            if (rangeMinDate != null && rangeMaxDate != null) {
              isSelected = day.isSameDayOrAfter(rangeMinDate) &&
                  day.isSameDayOrBefore(rangeMaxDate);
            } else {
              isSelected = day.isAtSameMomentAs(rangeMinDate);
            }
          }
          // if (isSelected) {
          //   globals.selectedDates.add(day);
          // }
          // print(globals.selectedDates);

          return day.day == re.day &&
                  (re.day == 31 ||
                      re.day == 29 ||
                      re.day == 30 ||
                      re.day == 28) &&
                  (week.lastDay.day != 29 &&
                      week.lastDay.day != 30 &&
                      week.lastDay.day != 31 &&
                      week.lastDay.day != 28)

              // day.isAfter(DateTime(
              //         mon.year, mon.month, daysPerMonth(mon.year)[mon.month - 1]))
              // &&
              //         day.isBefore(DateTime(mon.year, mon.month, 2))
              ? SizedBox()
              : AspectRatio(
                  aspectRatio: 0.75,
                  //0.75,
                  //1.0,
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: onDayPressed != null
                        ? () {
                            if (globals.missed[day] == null) {
                              globals.missed[day] = false;
                            }
                            if (globals.missed[day] != null) {
                              globals.missed[day] = !globals.missed[day];
                            }
                            print('Day is pressed');
                            if (onDayPressed != null) {
                              if (abcd2 == true) {
                                onDayPressed(day);
                              }
                            }
                          }
                        : null,
                    child: dayBuilder != null
                        ? dayBuilder(
                            context,
                            day,
                            isSelected: isSelected,
                          )
                        : _DefaultDayView(
                            date: day,
                            isSelected: isSelected,
                          ),
                  ),
                );
        }
      }, growable: false),
    );
  }
}

//class ScreenArguments {
//  final int month;
//  final int year;
//  ScreenArguments(this.month, this.year);
//}

class _DefaultMonthView extends StatelessWidget {
  final int month;
  final int year;
//  globals.month = month;
  _DefaultMonthView({@required this.month, @required this.year});
  Map<int, int> qazq2 = globals.mainq();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => MonthlyView(month: month, year: year)),
          );
        },

        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Container(
            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
            //padding: EdgeInsets.all(0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: NeverScrollableScrollPhysics(),
              child: Column(
                children: [
                  // SizedBox(
                  //   height: 50,
                  // ),
                  Row(children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 7.8,
                      child: Text(
                        qazq2[month * year] == 1 ? globals.dates[month] : '   ',
                        style: TextStyle(
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.black
                                  : Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 7.8,
                      child: Text(
                        qazq2[month * year] == 2 ? globals.dates[month] : '   ',
                        style: TextStyle(
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.black
                                  : Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 7.8,
                      child: Text(
                        qazq2[month * year] == 3 ? globals.dates[month] : '   ',
                        style: TextStyle(
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.black
                                  : Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 7.8,
                      child: Text(
                        qazq2[month * year] == 4 ? globals.dates[month] : '   ',
                        style: TextStyle(
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.black
                                  : Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 7.8,
                      child: Text(
                        qazq2[month * year] == 5 ? globals.dates[month] : '   ',
                        style: TextStyle(
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.black
                                  : Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 7.8,
                      child: Text(
                        qazq2[month * year] == 6 ? globals.dates[month] : '   ',
                        style: TextStyle(
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.black
                                  : Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 6,
                      child: Text(
                        qazq2[month * year] == 7 ? globals.dates[month] : '   ',
                        style: TextStyle(
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.black
                                  : Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
          ),
        ),
        // Container(
        //   alignment: DateTime.now().month != month
        //       ? Alignment.bottomRight
        //       : Alignment.center,
        //   child: Text(
        //     DateFormat('MMM').format(
        //       DateTime(year, month),
        //     ),
        //     style: TextStyle(
        //       fontSize: 25,
        //       fontWeight: FontWeight.bold,
        //     ),
        //   ),
        // ),
      ),
    );
  }
}

class _DefaultDayView extends StatelessWidget {
  final DateTime date;
  final bool isSelected;

  _DefaultDayView({@required this.date, this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
          color: globals.d == date ? Color.fromRGBO(208, 2, 27, 1) : null,
          shape: BoxShape.circle,
          border: new Border.all(
            color:
                //globals.d==date
                isSelected || globals.missed[date] == true
                    ? Colors.pinkAccent
                    : Colors.grey,
            width: isSelected || globals.missed[date] == true ? 2 : 1,
            //!isSelected || (globals.missed[date] != true) ? 1 : 4,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Ink(
            child: Center(
              child: Text(DateFormat('d').format(date),
                  style: TextStyle(
                    color: globals.d == date ? Colors.white : null,
                  )),
            ),
          ),
        ),
      ),
    );
  }
}

typedef MonthBuilder = Widget Function(
    BuildContext context, int month, int year);
typedef DayBuilder = Widget Function(BuildContext context, DateTime date,
    {bool isSelected});
typedef PeriodChanged = void Function(DateTime minDate, DateTime maxDate);

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import '../utils/date_models.dart';
// import '../utils/date_utils.dart' as dp;
// import '../month/monthly_view.dart';
// import '../globals.dart' as globals;

// class YearlyMissed extends StatefulWidget {
//   final DateTime minDate;
//   final DateTime maxDate;
//   final MonthBuilder monthBuilder;
//   final DayBuilder dayBuilder;
//   final DateTime initialMinDate;
//   final DateTime initialMaxDate;
//   final ValueChanged<DateTime> onDayPressed;
//   final PeriodChanged onRangeSelected;
//   final EdgeInsetsGeometry listPadding;

//   YearlyMissed(
//       {@required this.minDate,
//       @required this.maxDate,
//       this.monthBuilder,
//       this.dayBuilder,
//       this.onDayPressed,
//       this.onRangeSelected,
//       this.initialMinDate,
//       this.initialMaxDate,
//       this.listPadding})
//       : assert(minDate != null),
//         assert(maxDate != null),
//         assert(minDate.isBefore(maxDate));

//   @override
//   _YearlyMissedState createState() => _YearlyMissedState();
// }

// class _YearlyMissedState extends State<YearlyMissed> {
//   DateTime _minDate;
//   DateTime _maxDate;
//   List<Month> _months;
//   DateTime rangeMinDate;
//   DateTime rangeMaxDate;

//   @override
//   void initState() {
//     super.initState();
//     _months = dp.DateUtils.extractWeeks(widget.minDate, widget.maxDate);
//     _minDate = widget.minDate.removeTime();
//     _maxDate = widget.maxDate.removeTime();
//     rangeMinDate = widget.initialMinDate;
//     rangeMaxDate = widget.initialMaxDate;
//   }

//   @override
//   void didUpdateWidget(YearlyMissed oldWidget) {
//     super.didUpdateWidget(oldWidget);

//     if (oldWidget.minDate != widget.minDate ||
//         oldWidget.maxDate != widget.maxDate) {
//       _months = dp.DateUtils.extractWeeks(widget.minDate, widget.maxDate);
//       // _minDate = widget.minDate.removeTime();
//       // _maxDate = widget.maxDate.removeTime();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         Expanded(
//           child: ListView.builder(
//             cacheExtent:
//                 (MediaQuery.of(context).size.width / DateTime.daysPerWeek) * 6,
//             padding: widget.listPadding ?? EdgeInsets.zero,
//             itemCount: _months.length,
//             itemBuilder: (BuildContext context, int position) {
//               return _MonthView(
//                 month: _months[position],
//                 minDate: _minDate,
//                 maxDate: _maxDate,
//                 monthBuilder: widget.monthBuilder,
//                 dayBuilder: widget.dayBuilder,
//                 onDayPressed: widget.onRangeSelected != null
//                     ? (DateTime date) {
//                         if (rangeMinDate == null || rangeMaxDate != null) {
//                           setState(() {
//                             rangeMinDate = date;
//                             rangeMaxDate = null;
//                           });
//                         } else if (date.isBefore(rangeMinDate)) {
//                           setState(() {
//                             rangeMaxDate = rangeMinDate;
//                             rangeMinDate = date;
//                           });
//                         } else if (date.isAfter(rangeMinDate)) {
//                           setState(() {
//                             rangeMaxDate = date;
//                           });
//                         }

//                         widget.onRangeSelected(rangeMinDate, rangeMaxDate);

//                         if (widget.onDayPressed != null) {
//                           widget.onDayPressed(date);
//                         }
//                         globals.d2 = rangeMaxDate;
//                         globals.d1 = rangeMinDate;
//                       }
//                     : (DateTime date) {
//                         setState(() {
//                           rangeMinDate = date;
//                           rangeMaxDate = date;
//                           globals.d = date;
//                           if (globals.lop[date] == null) {
//                             //changing
//                             globals.lop[date] = false;
//                           }
//                           if (globals.li[date] == null) {
//                             globals.li[date] = {};
//                           }
//                         });
//                       },
//                 //widget.onDayPressed,
//                 rangeMinDate: globals.d,
//                 rangeMaxDate: globals.d,
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }

// class _MonthView extends StatelessWidget {
//   final Month month;
//   final DateTime minDate;
//   final DateTime maxDate;
//   final MonthBuilder monthBuilder;
//   final DayBuilder dayBuilder;
//   final ValueChanged<DateTime> onDayPressed;
//   final DateTime rangeMinDate;
//   final DateTime rangeMaxDate;

//   _MonthView(
//       {@required this.month,
//       @required this.minDate,
//       @required this.maxDate,
//       this.monthBuilder,
//       this.dayBuilder,
//       this.onDayPressed,
//       this.rangeMinDate,
//       this.rangeMaxDate,
//       Key key})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         monthBuilder != null
//             ? monthBuilder(
//                 context,
//                 month.month,
//                 month.year,
//               )
//             : _DefaultMonthView(
//                 month: month.month,
//                 year: month.year,
//               ),
//         SizedBox(),
//         Table(
//           children: month.weeks
//               .map((Week week) => _generateFor(context, week))
//               .toList(growable: false),
//         ),
//       ],
//     );
//   }

//   TableRow _generateFor(BuildContext context, Week week) {
//     DateTime firstDay = week.firstDay;
//     bool rangeFeatureEnabled = rangeMinDate != null;

//     return TableRow(
//       children: List<Widget>.generate(DateTime.daysPerWeek, (int position) {
//         DateTime day = DateTime(
//           week.firstDay.year,
//           week.firstDay.month,
//           firstDay.day + (position - (firstDay.weekday - 1)),
//         );

//         if ((position + 1) < week.firstDay.weekday ||
//             (position + 1) > week.lastDay.weekday ||
//             day.isBefore(minDate) ||
//             day.isAfter(maxDate)) {
//           return const SizedBox();
//         } else {
//           bool isSelected = false;
//           if (rangeFeatureEnabled) {
//             if (rangeMinDate != null && rangeMaxDate != null) {
//               isSelected = day.isSameDayOrAfter(rangeMinDate) &&
//                   day.isSameDayOrBefore(rangeMaxDate);
//             } else {
//               isSelected = day.isAtSameMomentAs(rangeMinDate);
//             }
//           }
//           // if (isSelected) {
//           //   globals.selectedDates.add(day);
//           // }
//           // print(globals.selectedDates);
//           return AspectRatio(
//             aspectRatio: 1.0,
//             child: GestureDetector(
//               behavior: HitTestBehavior.translucent,
//               onTap: onDayPressed != null
//                   ? () {
//                       if (onDayPressed != null) {
//                         onDayPressed(day);
//                       }
//                     }
//                   : null,
//               child: dayBuilder != null
//                   ? dayBuilder(
//                       context,
//                       day,
//                       isSelected: isSelected,
//                     )
//                   : _DefaultDayView(
//                       date: day,
//                       isSelected: isSelected,
//                     ),
//             ),
//           );
//         }
//       }, growable: false),
//     );
//   }
// }

// //class ScreenArguments {
// //  final int month;
// //  final int year;
// //  ScreenArguments(this.month, this.year);
// //}

// class _DefaultMonthView extends StatelessWidget {
//   final int month;
//   final int year;
// //  globals.month = month;
//   _DefaultMonthView({@required this.month, @required this.year});
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: GestureDetector(
//         onTap: () {
//           Navigator.push(
//             context,
//             new MaterialPageRoute(
//                 builder: (context) => MonthlyView(
//                     month: month, year: year, valu: globals.lop[globals.d])),
//           );
//         },
//         child: Container(
//           alignment: DateTime.now().month != month
//               ? Alignment.bottomRight
//               : Alignment.center,
//           child: Text(
//             DateFormat('MMM').format(
//               DateTime(year, month),
//             ),
//             style: TextStyle(
//               fontSize: 25,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _DefaultDayView extends StatelessWidget {
//   final DateTime date;
//   final bool isSelected;

//   _DefaultDayView({@required this.date, this.isSelected});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(5.0),
//       child: Container(
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           border: new Border.all(
//             color: isSelected ? Colors.pinkAccent : Colors.grey,
//             width: !isSelected ? 1 : 4,
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(4.0),
//           child: Ink(
//             child: Center(
//               child: Text(
//                 DateFormat('d').format(date),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// typedef MonthBuilder = Widget Function(
//     BuildContext context, int month, int year);
// typedef DayBuilder = Widget Function(BuildContext context, DateTime date,
//     {bool isSelected});
// typedef PeriodChanged = void Function(DateTime minDate, DateTime maxDate);
