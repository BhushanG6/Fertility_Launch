import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import '../year/year2.dart';
//import 'package:upcloud_tracker/month/monthly_view.dart';
import '../utils/date_models.dart';
//import '../utils/date_utils.dart' as dp;
import '../utils/date2utils.dart' as dp;
import '../month/monthly_view.dart';
import '../globals.dart' as globals;

class YearlyView extends StatefulWidget {
  static const routeName = '/vertical';
  final DateTime minDate;
  final DateTime maxDate;
  final DateTime currentDate;
  final MonthBuilder monthBuilder;
  final DayBuilder dayBuilder;
  final DateTime initialMinDate;
  final DateTime initialMaxDate;
  final ValueChanged<DateTime> onDayPressed;
  final ValueChanged<DateTime> onMonthPressed;
  final PeriodChanged onRangeSelected;
  final EdgeInsetsGeometry listPadding;

  YearlyView(
      {this.minDate,
      this.maxDate,
      this.currentDate,
      this.monthBuilder,
      this.dayBuilder,
      this.onDayPressed,
      this.onMonthPressed,
      this.onRangeSelected,
      this.initialMinDate,
      this.initialMaxDate,
      this.listPadding})
      : assert(minDate != null),
        assert(maxDate != null),
        assert(!minDate.isAfter(maxDate));

  @override
  _YearlyViewState createState() => _YearlyViewState();
}

class _YearlyViewState extends State<YearlyView> {
  bool show = false;
  ScrollController _scrollViewController;
  void showflybutton() {
    if ((_scrollViewController.offset < 0)) {
      print(_scrollViewController.offset);
      setState(() {
        show = true;
      });
    } else {
      setState(() {
        show = false;
      });
    }
  }

  DateTime _minDate;
  DateTime _maxDate;
  DateTime _currentDate;
  List<Month> _months;
  DateTime rangeMinDate;
  DateTime rangeMaxDate;
  double abcd = 0;
  bool downDirection = false;
  @override
  void initState() {
    super.initState();
    _scrollViewController = ScrollController(initialScrollOffset: 0.0)
      ..addListener(() {
        downDirection = _scrollViewController.position.userScrollDirection ==
            ScrollDirection.forward;

        // makes sure we don't call setState too much, but only when it is needed
        if (downDirection != show) {
          setState(() {
            show = downDirection;
          });

          print("offset = ${_scrollViewController.offset}");
        }
      });

    _months = dp.DateUtils2.extractWeeks(widget.minDate, widget.maxDate);
    _minDate = widget.minDate.removeTime();
    _maxDate = widget.maxDate.removeTime();
    rangeMinDate = widget.initialMinDate;
    rangeMaxDate = widget.initialMaxDate;
  }

  @override
  void dispose() {
    _scrollViewController
        .dispose(); // it is a good practice to dispose the controller
    super.dispose();
  }

  @override
  void didUpdateWidget(YearlyView oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.minDate != widget.minDate ||
        oldWidget.maxDate != widget.maxDate) {
      _months = dp.DateUtils2.extractWeeks(widget.minDate, widget.maxDate);
      _minDate = widget.minDate.removeTime();
      _maxDate = widget.maxDate.removeTime();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: <Widget>[
          ListView.builder(
              controller: _scrollViewController,
              cacheExtent:
                  (MediaQuery.of(context).size.width / DateTime.daysPerWeek) *
                      6,
              padding: EdgeInsets.zero,
              itemCount: _months.length,
              itemBuilder: (BuildContext context, int position) {
                return Column(
                  children: [
                    _MonthView(
                      month: _months[position],
                      minDate: _minDate,
                      maxDate: _maxDate,
                      currentDate: _currentDate,
                      monthBuilder: widget.monthBuilder,
                      dayBuilder: widget.dayBuilder,
                      onDayPressed: widget.onRangeSelected != null
                          ? (DateTime date) {
                              if (rangeMinDate == null ||
                                  rangeMaxDate != null) {
                                setState(() {
                                  rangeMinDate = date;
                                  rangeMaxDate = null;
                                });
                              } else if (date.isBefore(rangeMinDate)) {
                                setState(() {
                                  rangeMaxDate = rangeMinDate;
                                  rangeMinDate = date;
                                });
                              } else if (date.isAfter(rangeMinDate)) {
                                setState(() {
                                  rangeMaxDate = date;
                                });
                              }

                              widget.onRangeSelected(
                                  rangeMinDate, rangeMaxDate);
                              if (widget.onDayPressed != null) {
                                widget.onDayPressed(date);
                              }
                            }
                          : (DateTime date) {
                              setState(() {
                                rangeMinDate = date;
                                rangeMaxDate = date;
                                globals.pq = date;
                                if (globals.lop[date] == null) {
                                  //changing
                                  globals.lop[date] = false;
                                }
                                if (globals.li[date] == null) {
                                  globals.li[date] = {};
                                }
                              });
                            },
                      //widget.onDayPressed,
                      rangeMinDate: globals.pq,
                      rangeMaxDate: globals.pq,
                    ),
                  ],
                );
              }),
          show == true
              ? Positioned(
                  bottom: 120,
                  left: MediaQuery.of(context).size.width / 2.7,
                  child: RaisedButton(
                    child: Text('Fly Button'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Year2()),
                      );
                    },
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}

class _MonthView extends StatelessWidget {
  final Month month;
  final DateTime minDate;
  final DateTime maxDate;

  final DateTime currentDate;
  final MonthBuilder monthBuilder;
  final DayBuilder dayBuilder;
  final ValueChanged<DateTime> onDayPressed;
  final ValueChanged<DateTime> onMonthPressed;
  final DateTime rangeMinDate;
  final DateTime rangeMaxDate;

  _MonthView(
      {@required this.month,
      @required this.minDate,
      @required this.maxDate,
      @required this.currentDate,
      this.monthBuilder,
      this.dayBuilder,
      this.onDayPressed,
      this.onMonthPressed,
      this.rangeMinDate,
      this.rangeMaxDate,
      Key key})
      : super(key: key);

  bool check(int y, int x) {
    if ((y - x) % 7 == 0) {
      return true;
    } else {
      return false;
    }
  }

  Map<int, int> qazq = globals.mainq();
  bool issel = false;
  @override
  Widget build(BuildContext context) {
    // Map<int, int> lk = new Map();
    // lk[month.month] = month.year;
    return Container(
      padding: EdgeInsets.fromLTRB(7, 10, 7, 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                7.8,
                                            child: Text(
                                              qazq[month.month * month.year] ==
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
                                              qazq[month.month * month.year] ==
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
                                              qazq[month.month * month.year] ==
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
                                              qazq[month.month * month.year] ==
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
                                              qazq[month.month * month.year] ==
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
                                              qazq[month.month * month.year] ==
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
                                              qazq[month.month * month.year] ==
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
                      // _DefaultMonthView(
                      //   month: month.month,
                      //   year: month.year,
                      //   day: month.daysInMonth,
                      // ),
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
                                  ? 'Mon'
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
                                  ? '  Tue'
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
                                  ? 'Thu'
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
          Container(
            padding: EdgeInsets.fromLTRB(7, 0, 7, 0),
            child: Table(
              children: month.weeks
                  .map((Week week) => _generateFor(context, week))
                  .toList(growable: false),
            ),
          ),
          DateTime(
                          month.year,
                          month.month,
                          dp.DateUtils2.daysPerMonth(
                              month.year)[month.month - 1])
                      .weekday ==
                  7
              ?
              // InkWell(
              //     onTap: () {
              //       issel = !issel;
              //     },
              //     child: Container(
              //       height: 22.5,
              //       width: 24,
              //       margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(7),
              //         color: issel == true ||
              //                 (globals.pq == null &&
              //                     globals.qr ==
              //                         DateTime(
              //                             month.year,
              //                             month.month,
              //                             dp.DateUtils2.daysPerMonth(
              //                                 month.year)[month.month - 1]))
              //             ? Colors.grey
              //             : Colors.transparent,
              //         border: Border.all(width: 0, color: Colors.transparent),
              //       ),
              //       child: Center(
              //         child: Text(
              //           //'${dp.DateUtils2.daysPerMonth(month.year)[month.month - 1]}',
              //           DateFormat('d').format(DateTime(
              //               month.year,
              //               month.month,
              //               dp.DateUtils2.daysPerMonth(
              //                   month.year)[month.month - 1])),
              //           textAlign: TextAlign.center,
              //           style: TextStyle(
              //             fontSize: 16,
              //             fontWeight: FontWeight.w300,
              //             color: globals.pq != null &&
              //                     globals.qr ==
              //                         DateTime(
              //                             month.year,
              //                             month.month,
              //                             dp.DateUtils2.daysPerMonth(
              //                                 month.year)[month.month - 1])
              //                 ? Color.fromRGBO(138, 93, 54, 1)
              //                 : Theme.of(context).brightness == Brightness.light
              //                     ? Colors.black
              //                     : Colors.white,
              //           ),
              //         ),
              //       ),
              //     ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 4, 0, 0),
                  child: Text(
                    '${dp.DateUtils2.daysPerMonth(month.year)[month.month - 1]}',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                )
              // )
              : SizedBox(),
        ],
      ),
    );
  }

  TableRow _generateFor(BuildContext context, Week week) {
    DateTime firstDay = week.firstDay;
    bool rangeFeatureEnabled = rangeMinDate != null;
    return TableRow(
      children: List<Widget>.generate(DateTime.daysPerWeek, (int position) {
        DateTime re;
        re = firstDay.subtract(Duration(days: 1));
        //print(re);
        DateTime day = DateTime(
          week.firstDay.year,
          week.firstDay.month,
          // daysPerMonth(week.firstDay.year)[week.firstDay.month - 1]==firstDay.day
          //     ? firstDay.day + (position - (firstDay.weekday))
          // :
          firstDay.day + (position - (firstDay.weekday)),
        );
        // if (day.day ==
        //     daysPerMonth(week.firstDay.year)[week.firstDay.month - 1]) {
        //   print('Here:${day.day}');
        //   day = DateTime(
        //     week.firstDay.year,
        //     week.firstDay.month,
        //     day.day + (position - (day.weekday)),
        //   );
        // }

        if (((position + 1) < week.firstDay.weekday ||
                (position) > week.lastDay.weekday ||
                day.isBefore(minDate) ||
                day.isAfter(maxDate))
            //     &&
            // !((week.lastDay.day == 31 ||
            //         week.lastDay.day == 28 ||
            //         week.lastDay.day == 29 ||
            //         week.lastDay.day == 30) &&
            //     week.lastDay.weekday == 7)
            ) {
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
          // if ((week.lastDay.day == 31 ||
          //         week.lastDay.day == 28 ||
          //         week.lastDay.day == 29 ||
          //         week.lastDay.day == 30) &&
          //     week.lastDay.weekday == 7) {
          //   day = DateTime(
          //       week.firstDay.year, week.firstDay.month, week.lastDay.day
          //       //firstDay.day + (position - (firstDay.weekday)),
          //       );
          // }

          return day.day == re.day &&
                  (re.day == 31 ||
                      re.day == 29 ||
                      re.day == 30 ||
                      re.day == 28) &&
                  (week.lastDay.day != 29 &&
                      week.lastDay.day != 30 &&
                      week.lastDay.day != 31 &&
                      week.lastDay.day != 28)

              // (re.day == 31 ||
              //     re.day == 29 ||
              //     re.day == 28 ||
              //     re.day == 30) &&
              // (day.day != week.lastDay.day)
              // (re.day == 31 || re.day == 29 || re.day == 28 || re.day == 30)
              //dp.DateUtils2.daysPerMonth(week.firstDay.year)[week.firstDay.year-1]

              ? SizedBox()
              : AspectRatio(
                  aspectRatio: 0.75,
                  //1.0,
                  //1.15,
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: onDayPressed != null
                        ? () {
                            if (onDayPressed != null) {
                              onDayPressed(day);
                            }
                          }
                        : null,
                    child: dayBuilder != null
                        ? dayBuilder(context, day, isSelected: isSelected)
                        : _DefaultDayView(date: day, isSelected: isSelected),
                  ),
                );
        }
      }, growable: false),
    );
  }

  // TableRow _generateFor(BuildContext context, Week week) {
  //   DateTime firstDay = week.firstDay;
  //   bool rangeFeatureEnabled = rangeMinDate != null;

  //   return TableRow(
  //       children: List<Widget>.generate(DateTime.daysPerWeek, (int position) {
  //     DateTime re;
  //     re = firstDay.add(Duration(days: 1));
  //     DateTime day;
  //     day = DateTime(
  //       week.firstDay.year,
  //       week.firstDay.month,
  //       firstDay.day + (position - (firstDay.weekday)),
  //     );
  //     // if (week.lastDay.day == 31) {
  //     //   print('Here bsvsvdns dsndbsd');

  //     //   day = DateTime(
  //     //     week.firstDay.year,
  //     //     week.firstDay.month,
  //     //     firstDay.day + (position - (firstDay.weekday - 1)),
  //     //   );
  //     // } else {

  //     // }

  //     // if (day.day == 30) {
  //     //   day = DateTime(
  //     //     week.firstDay.year,
  //     //     week.firstDay.month,
  //     //     firstDay.day + (position - (firstDay.weekday - 1)),
  //     //   );
  //     // }

  //     if ((position + 1) < week.firstDay.weekday ||
  //         (position) > week.lastDay.weekday ||
  //         day.isBefore(minDate) ||
  //         day.isAfter(maxDate)) {
  //       return SizedBox(width: 5, height: 5);
  //     } else {
  //       bool isSelected = false;
  //       if (rangeFeatureEnabled) {
  //         if (rangeMinDate != null && rangeMaxDate != null) {
  //           isSelected = day.isSameDayOrAfter(rangeMinDate) &&
  //               day.isSameDayOrBefore(rangeMaxDate);
  //         } else {
  //           isSelected = day.isAtSameMomentAs(rangeMinDate);
  //         }
  //       }
  //       return AspectRatio(
  //         aspectRatio: 1,
  //         child: GestureDetector(
  //           behavior: HitTestBehavior.translucent,
  //           onTap: onDayPressed != null
  //               ? () {
  //                   if (onDayPressed != null) {
  //                     onDayPressed(day);
  //                   }
  //                 }
  //               : null,
  //           child: dayBuilder != null
  //               ? dayBuilder(
  //                   context,
  //                   day,
  //                   icons: globals.icons,
  //                   isSelected: isSelected,
  //                 )
  //               : _DefaultDayView(
  //                   date: day,
  //                   isSelected: isSelected,
  //                 ),
  //         ),
  //       );
  //     }
  //   }, growable: false));
  // }
}

// Month-view in Yearly calender.
class _DefaultMonthView extends StatelessWidget {
  final int month;
  final int year;
  final int day;
  //final DateTime xyz;

  _DefaultMonthView({
    @required this.month,
    @required this.year,
    @required this.day,
    // this.xyz,
  });
  Map<int, int> qazq2 = globals.mainq();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => MonthlyView(
                        month: month,
                        year: year,
                        valu: globals.lop[globals.pq])),
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
                            qazq2[month * year] == 1
                                ? globals.dates[month]
                                : '   ',
                            style: TextStyle(
                              color: Theme.of(context).brightness ==
                                      Brightness.light
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
                            qazq2[month * year] == 2
                                ? globals.dates[month]
                                : '   ',
                            style: TextStyle(
                              color: Theme.of(context).brightness ==
                                      Brightness.light
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
                            qazq2[month * year] == 3
                                ? globals.dates[month]
                                : '   ',
                            style: TextStyle(
                              color: Theme.of(context).brightness ==
                                      Brightness.light
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
                            qazq2[month * year] == 4
                                ? globals.dates[month]
                                : '   ',
                            style: TextStyle(
                              color: Theme.of(context).brightness ==
                                      Brightness.light
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
                            qazq2[month * year] == 5
                                ? globals.dates[month]
                                : '   ',
                            style: TextStyle(
                              color: Theme.of(context).brightness ==
                                      Brightness.light
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
                            qazq2[month * year] == 6
                                ? globals.dates[month]
                                : '   ',
                            style: TextStyle(
                              color: Theme.of(context).brightness ==
                                      Brightness.light
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
                            qazq2[month * year] == 7
                                ? globals.dates[month]
                                : '   ',
                            style: TextStyle(
                              color: Theme.of(context).brightness ==
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
    );
  }
}

class _DefaultDayView extends StatefulWidget {
  final DateTime date;
  final bool isSelected;
  // final DateTime endDate;

  _DefaultDayView({@required this.date, this.isSelected});

  @override
  __DefaultDayViewState createState() => __DefaultDayViewState();
}

class __DefaultDayViewState extends State<_DefaultDayView> {
  @override
  Widget build(BuildContext context) {
    if (globals.d1 != null && globals.d2 == null) {
      globals.d2 = globals.d1;
    }
    if (globals.li[widget.date] == null) {
      globals.li[widget.date] = {};
    }

    return widget.date.isSameDayOrBefore(DateTime.now())
        ? Container(
            decoration: BoxDecoration(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 22.5,
                  width: 24,
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: widget.isSelected ||
                            (globals.pq == null && globals.qr == widget.date)
                        ? Colors.grey
                        : Colors.transparent,
                    border: Border.all(width: 0, color: Colors.transparent),
                  ),
                  child: Center(
                    child: Text(
                      DateFormat('d').format(widget.date),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: globals.pq != null && globals.qr == widget.date
                            ? Color.fromRGBO(138, 93, 54, 1)
                            : Theme.of(context).brightness == Brightness.light
                                ? Colors.black
                                : Colors.white,
                      ),
                    ),
                  ),
                ),
                globals.li[widget.date].length == 1
                    ? Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 17, 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            globals.li[widget.date]['bloodflow'] != null
                                ? globals.li[widget.date]['bloodflow']
                                : SizedBox(),
                            globals.li[widget.date]['pills'] != null &&
                                    globals.li[widget.date]['bloodflow'] == null
                                ? globals.li[widget.date]['pills']
                                : SizedBox(),
                            globals.li[widget.date]['discharge'] != null &&
                                    globals.li[widget.date]['bloodflow'] == null
                                ? globals.li[widget.date]['discharge']
                                : SizedBox(),
                            globals.li[widget.date]['tests'] != null
                                ? globals.li[widget.date]['tests']
                                : SizedBox(),
                            globals.li[widget.date]['notes'] != null
                                ? globals.li[widget.date]['notes']
                                : SizedBox(),
                            globals.li[widget.date]['intimacy'] != null
                                ? globals.li[widget.date]['intimacy']
                                : SizedBox(),
                            globals.li[widget.date]['mns'] != null
                                ? globals.li[widget.date]['mns']
                                : SizedBox(),
                          ],
                        ),
                      )
                    : globals.li[widget.date].length >= 4
                        ? Padding(
                            padding: const EdgeInsets.fromLTRB(7, 0, 5, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    globals.li[widget.date]['bloodflow'] != null
                                        ? globals.li[widget.date]['bloodflow']
                                        : SizedBox(),
                                    globals.li[widget.date]['pills'] != null &&
                                            globals.li[widget.date]
                                                    ['bloodflow'] ==
                                                null
                                        ? globals.li[widget.date]['pills']
                                        : SizedBox(),
                                    globals.li[widget.date]['discharge'] !=
                                                null &&
                                            globals.li[widget.date]
                                                    ['bloodflow'] ==
                                                null
                                        ? globals.li[widget.date]['discharge']
                                        : SizedBox(),
                                    globals.li[widget.date]['notes'] != null
                                        ? globals.li[widget.date]['notes']
                                        : SizedBox(),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    globals.li[widget.date]['intimacy'] != null
                                        ? globals.li[widget.date]['intimacy']
                                        : SizedBox(),
                                    globals.li[widget.date]['mns'] != null
                                        ? globals.li[widget.date]['mns']
                                        : SizedBox(),
                                    globals.li[widget.date]['tests'] != null
                                        ? globals.li[widget.date]['tests']
                                        : SizedBox(),
                                  ],
                                ),
                              ],
                            ),
                          )
                        : globals.li[widget.date].length > 4
                            ? Padding(
                                padding: const EdgeInsets.fromLTRB(7, 0, 5, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        globals.li[widget.date]['bloodflow'] !=
                                                null
                                            ? globals.li[widget.date]
                                                ['bloodflow']
                                            : SizedBox(),
                                        globals.li[widget.date]['pills'] !=
                                                    null &&
                                                globals.li[widget.date]
                                                        ['bloodflow'] ==
                                                    null
                                            ? globals.li[widget.date]['pills']
                                            : SizedBox(),
                                        globals.li[widget.date]['discharge'] !=
                                                    null &&
                                                globals.li[widget.date]
                                                        ['bloodflow'] ==
                                                    null
                                            ? globals.li[widget.date]
                                                ['discharge']
                                            : SizedBox(),
                                        globals.li[widget.date]['tests'] != null
                                            ? globals.li[widget.date]['tests']
                                            : SizedBox(),
                                        globals.li[widget.date]['notes'] != null
                                            ? globals.li[widget.date]['notes']
                                            : SizedBox(),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        globals.li[widget.date]['intimacy'] !=
                                                null
                                            ? globals.li[widget.date]
                                                ['intimacy']
                                            : SizedBox(),
                                        globals.li[widget.date]['mns'] != null
                                            ? globals.li[widget.date]['mns']
                                            : SizedBox(),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.fromLTRB(6, 0, 5, 0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    globals.li[widget.date]['intimacy'] != null
                                        ? globals.li[widget.date]['intimacy']
                                        : SizedBox(),
                                    globals.li[widget.date]['mns'] != null
                                        ? globals.li[widget.date]['mns']
                                        : SizedBox(),
                                    globals.li[widget.date]['bloodflow'] != null
                                        ? globals.li[widget.date]['bloodflow']
                                        : SizedBox(),
                                    globals.li[widget.date]['pills'] != null &&
                                            globals.li[widget.date]
                                                    ['bloodflow'] ==
                                                null
                                        ? globals.li[widget.date]['pills']
                                        : SizedBox(),
                                    globals.li[widget.date]['discharge'] !=
                                                null &&
                                            globals.li[widget.date]
                                                    ['bloodflow'] ==
                                                null
                                        ? globals.li[widget.date]['discharge']
                                        : SizedBox(),
                                    globals.li[widget.date]['tests'] != null
                                        ? globals.li[widget.date]['tests']
                                        : SizedBox(),
                                    globals.li[widget.date]['notes'] != null
                                        ? globals.li[widget.date]['notes']
                                        : SizedBox(),
                                  ],
                                ),
                              ),
                ////
                globals.lop2[widget.date] == 1 &&
                        globals.lop[widget.date] != true
                    ? Container(
                        width:
                            globals.lop2[widget.date.add(Duration(days: 1))] ==
                                        1 ||
                                    globals.lop2[widget.date
                                            .subtract(Duration(days: 1))] ==
                                        1
                                ? 67
                                : 27,
                        height: 1,
                        color: Colors.red,
                        margin:
                            //edit this
                            globals.li[widget.date].length == 0
                                ? EdgeInsets.fromLTRB(0, 12, 0, 0)
                                : EdgeInsets.fromLTRB(0, 0, 0, 0),
                      )
                    : SizedBox(),
                globals.lop[widget.date] == true
                    ? Container(
                        width:
                            globals.lop[widget.date.add(Duration(days: 1))] ==
                                        true ||
                                    globals.lop[widget.date
                                            .subtract(Duration(days: 1))] ==
                                        true
                                ? 67
                                : 27,
                        height: 2,
                        color: Colors.red,
                        margin:
                            //edit this
                            globals.li[widget.date].length == 0
                                ? EdgeInsets.fromLTRB(0, 12, 0, 0)
                                : EdgeInsets.fromLTRB(0, 0, 0, 0),
                      )
                    : SizedBox(),
              ],
            ),
          )
        : Container(
            decoration: BoxDecoration(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 22.5,
                  width: 24,
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: widget.isSelected ? Colors.grey : Colors.transparent,
                    border: Border.all(width: 0, color: Colors.transparent),
                  ),
                  child: Center(
                    child: Text(
                      DateFormat('d').format(widget.date),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.black
                            : Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
                globals.li[widget.date].length == 1
                    ? Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 10, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            globals.li[widget.date]['bloodflow'] != null
                                ? globals.li[widget.date]['bloodflow']
                                : SizedBox(),
                            globals.li[widget.date]['pills'] != null &&
                                    globals.li[widget.date]['bloodflow'] == null
                                ? globals.li[widget.date]['pills']
                                : SizedBox(),
                            globals.li[widget.date]['discharge'] != null &&
                                    globals.li[widget.date]['bloodflow'] == null
                                ? globals.li[widget.date]['discharge']
                                : SizedBox(),
                            globals.li[widget.date]['tests'] != null
                                ? globals.li[widget.date]['tests']
                                : SizedBox(),
                            globals.li[widget.date]['notes'] != null
                                ? globals.li[widget.date]['notes']
                                : SizedBox(),
                          ],
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.fromLTRB(7, 0, 5, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            globals.li[widget.date]['bloodflow'] != null
                                ? globals.li[widget.date]['bloodflow']
                                : SizedBox(),
                            globals.li[widget.date]['pills'] != null &&
                                    globals.li[widget.date]['bloodflow'] == null
                                ? globals.li[widget.date]['pills']
                                : SizedBox(),
                            globals.li[widget.date]['discharge'] != null &&
                                    globals.li[widget.date]['bloodflow'] == null
                                ? globals.li[widget.date]['discharge']
                                : SizedBox(),
                            globals.li[widget.date]['tests'] != null
                                ? globals.li[widget.date]['tests']
                                : SizedBox(),
                            globals.li[widget.date]['notes'] != null
                                ? globals.li[widget.date]['notes']
                                : SizedBox(),
                          ],
                        ),
                      ),
                Spacer(),
                globals.lop2[widget.date] == 1
                    // ||
                    //     globals.lop[widget.date] == null
                    // )
                    ? Column(
                        children: [
                          Container(
                            width: globals.lop2[widget.date
                                            .add(Duration(days: 1))] ==
                                        1 ||
                                    globals.lop2[widget.date
                                            .subtract(Duration(days: 1))] ==
                                        1
                                ? 67
                                : 27,
                            height: 1,
                            color: Colors.red,
                            margin:
                                //edit this
                                globals.li[widget.date].length == 0
                                    ? EdgeInsets.fromLTRB(0, 12, 0, 0)
                                    : EdgeInsets.fromLTRB(0, 0, 0, 0),
                          ),
                          SizedBox(height: 2),
                        ],
                      )
                    : SizedBox(),
              ],
            ),
          );
    // return (globals.d1 != null && globals.d1 != null)
    //     ?
    //     //checks if date is in between rangemax and rangemin
    //     widget.date.compareTo(globals.d1) >= 0 &&
    //             widget.date.compareTo(globals.d2) <= 0
    //         ?
    //         //icons code goes here
    //         //Make stack if icons exist else stay with containers
    //         globals.li[widget.date] != null
    //             ? InkWell(
    //                 onTap: () {
    //                   setState(() {
    //                     //globals.d = widget.date;
    //                     print(widget.date.toString());
    //                     if (globals.li[widget.date] == null) {
    //                       globals.li[widget.date] = {};
    //                     }
    //                     // globals.li[globals.d] = {};
    //                     print('List:${globals.li}');
    //                   });
    //                 },
    //                 child: Stack(
    //                   children: [
    //                     Container(
    //                       decoration: BoxDecoration(
    //                         border: Border(
    //                           bottom: BorderSide(width: 2.0, color: Colors.red),
    //                         ),
    //                       ),
    //                       child: Center(
    //                         child: Text(
    //                           DateFormat('d').format(widget.date),
    //                           textAlign: TextAlign.center,
    //                           style: TextStyle(
    //                             fontSize: 18,
    //                             fontWeight: FontWeight.w300,
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //                     Align(
    //                       alignment: Alignment.bottomCenter,
    //                       child: Padding(
    //                         padding: const EdgeInsets.all(3),
    //                         child: Row(
    //                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                           children: [
    //                             globals.li[widget.date]['bloodflow'] != null
    //                                 ? globals.li[widget.date]['bloodflow']
    //                                 : SizedBox(),
    //                             globals.li[widget.date]['pills'] != null
    //                                 ? globals.li[widget.date]['pills']
    //                                 : SizedBox(),
    //                             globals.li[widget.date]['tests'] != null
    //                                 ? globals.li[widget.date]['tests']
    //                                 : SizedBox(),
    //                           ],
    //                         ),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               )
    //             : InkWell(
    //                 onTap: () {
    //                   setState(() {
    //                     globals.d = widget.date;
    //                     print(globals.d.toString());
    //                     if (globals.li[globals.d] == null) {
    //                       globals.li[globals.d] = {};
    //                     }
    //                     // globals.li[globals.d] = {};
    //                     print('List:${globals.li}');
    //                   });
    //                 },
    //                 child: Container(
    //                   decoration: BoxDecoration(
    //                     border: Border(
    //                       bottom: BorderSide(width: 2.0, color: Colors.red),
    //                     ),
    //                   ),
    //                   child: Center(
    //                     child: Text(
    //                       DateFormat('d').format(widget.date),
    //                       textAlign: TextAlign.center,
    //                       style: TextStyle(
    //                         fontSize: 18,
    //                         fontWeight: FontWeight.w300,
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //               )
    //         : globals.li[widget.date] != null
    //             ? InkWell(
    //                 onTap: () {
    //                   setState(() {
    //                     //globals.d = widget.date;
    //                     print(widget.date.toString());
    //                     if (globals.li[widget.date] == null) {
    //                       globals.li[widget.date] = {};
    //                     }
    //                     // globals.li[globals.d] = {};
    //                     print('List:${globals.li}');
    //                   });
    //                 },
    //                 child: Stack(
    //                   children: [
    //                     Container(
    //                       child: Center(
    //                         child: Text(
    //                           DateFormat('d').format(widget.date),
    //                           textAlign: TextAlign.center,
    //                           style: TextStyle(
    //                             fontSize: 18,
    //                             fontWeight: FontWeight.w300,
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //                     Align(
    //                         alignment: Alignment.bottomCenter,
    //                         child:
    //                             // globals.li[widget.date].length < 3
    //                             // ?
    //                             Padding(
    //                           padding: const EdgeInsets.all(2.0),
    //                           child: Row(
    //                             mainAxisAlignment:
    //                                 MainAxisAlignment.spaceEvenly,
    //                             children: [
    //                               globals.li[widget.date]['bloodflow'] != null
    //                                   ? globals.li[widget.date]['bloodflow']
    //                                   : SizedBox(),
    //                               globals.li[widget.date]['pills'] != null
    //                                   ? globals.li[widget.date]['pills']
    //                                   : SizedBox(),
    //                               globals.li[widget.date]['tests'] != null
    //                                   ? globals.li[widget.date]['tests']
    //                                   : SizedBox(),
    //                             ],
    //                           ),
    //                         )
    //                         // :
    //                         // Row(
    //                         //     // crossAxisAlignment:
    //                         //     //     CrossAxisAlignment.start,
    //                         //     children: [
    //                         //       Column(
    //                         //         children: [
    //                         //           globals.li[widget.date]['bloodflow'] != null
    //                         //               ? globals.li[widget.date]['bloodflow']
    //                         //               : SizedBox(),
    //                         //           globals.li[widget.date]['pills'] != null
    //                         //               ? globals.li[widget.date]['pills']
    //                         //               : SizedBox(),
    //                         //         ],
    //                         //       ),
    //                         //       Column(
    //                         //         children: [
    //                         //           globals.li[widget.date]['tests'] != null
    //                         //               ? globals.li[widget.date]['tests']
    //                         //               : SizedBox(),
    //                         //         ],
    //                         //       ),
    //                         //     ],
    //                         // ),
    //                         ),
    //                     // Row(
    //                     //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                     //   children: [
    //                     //     globals.li[widget.date]['bloodflow'] != null
    //                     //         ? globals.li[widget.date]['bloodflow']
    //                     //         : SizedBox(),
    //                     //     globals.li[widget.date]['pills'] != null
    //                     //         ? globals.li[widget.date]['pills']
    //                     //         : SizedBox(),
    //                     //     globals.li[widget.date]['tests'] != null
    //                     //         ? globals.li[widget.date]['tests']
    //                     //         : SizedBox(),
    //                     //   ],
    //                     // ),
    //                   ],
    //                 ),
    //               )
    //             : InkWell(
    //                 onTap: () {
    //                   setState(() {
    //                     globals.d = widget.date;
    //                     print(globals.d.toString());
    //                     if (globals.li[globals.d] == null) {
    //                       globals.li[globals.d] = {};
    //                     }
    //                     // globals.li[globals.d] = {};
    //                     print('List:${globals.li}');
    //                   });
    //                 },
    //                 child: Container(
    //                   child: Center(
    //                     child: Text(
    //                       DateFormat('d').format(widget.date),
    //                       textAlign: TextAlign.center,
    //                       style: TextStyle(
    //                         fontSize: 18,
    //                         fontWeight: FontWeight.w300,
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //               )
    //     : globals.li[widget.date] != null
    //         ? InkWell(
    //             onTap: () {
    //               setState(() {
    //                 //globals.d = widget.date;
    //                 print(widget.date.toString());
    //                 if (globals.li[widget.date] == null) {
    //                   globals.li[widget.date] = {};
    //                 }
    //                 // globals.li[globals.d] = {};
    //                 print('List:${globals.li}');
    //               });
    //             },
    //             child: Stack(
    //               children: [
    //                 Container(
    //                   child: Center(
    //                     child: Text(
    //                       DateFormat('d').format(widget.date),
    //                       textAlign: TextAlign.center,
    //                       style: TextStyle(
    //                         fontSize: 18,
    //                         fontWeight: FontWeight.w300,
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //                 // Row(
    //                 //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                 //   children: [
    //                 //     globals.li[widget.date]['bloodflow'] != null
    //                 //         ? globals.li[widget.date]['bloodflow']
    //                 //         : SizedBox(),
    //                 //     globals.li[widget.date]['pills'] != null
    //                 //         ? globals.li[widget.date]['pills']
    //                 //         : SizedBox(),
    //                 //     globals.li[widget.date]['tests'] != null
    //                 //         ? globals.li[widget.date]['tests']
    //                 //         : SizedBox(),
    //                 //   ],
    //                 // ),
    //                 Align(
    //                   alignment: Alignment.bottomCenter,
    //                   child: Padding(
    //                     padding: const EdgeInsets.all(3),
    //                     child: Row(
    //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                       children: [
    //                         globals.li[widget.date]['bloodflow'] != null
    //                             ? globals.li[widget.date]['bloodflow']
    //                             : SizedBox(),
    //                         globals.li[widget.date]['pills'] != null
    //                             ? globals.li[widget.date]['pills']
    //                             : SizedBox(),
    //                         globals.li[widget.date]['tests'] != null
    //                             ? globals.li[widget.date]['tests']
    //                             : SizedBox(),
    //                       ],
    //                     ),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           )
    //         : InkWell(
    //             onTap: () {
    //               setState(() {
    //                 globals.d = widget.date;
    //                 print(globals.d.toString());
    //                 if (globals.li[globals.d] == null) {
    //                   globals.li[globals.d] = {};
    //                 }
    //                 // globals.li[globals.d] = {};
    //                 print('List:${globals.li}');
    //               });
    //             },
    //             child: Container(
    //               child: Center(
    //                 child: Text(
    //                   DateFormat('d').format(widget.date),
    //                   textAlign: TextAlign.center,
    //                   style: TextStyle(
    //                     fontSize: 18,
    //                     fontWeight: FontWeight.w300,
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           );
  }
}

typedef MonthBuilder = Widget Function(
    BuildContext context, int month, int year);
typedef DayBuilder = Widget Function(
  BuildContext context,
  DateTime date, {
  bool isSelected,
  Map<dynamic, dynamic> icons,
});
typedef PeriodChanged = void Function(DateTime minDate, DateTime maxDate);
