import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import '../utils/date_models.dart';
import '../utils/date_utils.dart' as dp;
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
  DateTime _minDate;
  DateTime _maxDate;
  DateTime _currentDate;
  List<Month> _months;
  DateTime rangeMinDate;
  DateTime rangeMaxDate;

  @override
  void initState() {
    super.initState();
    _months = dp.DateUtils.extractWeeks(widget.minDate, widget.maxDate);
    _minDate = widget.minDate.removeTime();
    _maxDate = widget.maxDate.removeTime();
    rangeMinDate = widget.initialMinDate;
    rangeMaxDate = widget.initialMaxDate;
  }

  @override
  void didUpdateWidget(YearlyView oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.minDate != widget.minDate ||
        oldWidget.maxDate != widget.maxDate) {
      _months = dp.DateUtils.extractWeeks(widget.minDate, widget.maxDate);
      _minDate = widget.minDate.removeTime();
      _maxDate = widget.maxDate.removeTime();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
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
                          : widget.onDayPressed,
                      rangeMinDate: DateTime.now(),
                      rangeMaxDate: DateTime.now(),
                    ),
                  ],
                );
              }),
        ),
      ],
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

  @override
  Widget build(BuildContext context) {
    // Map<int, int> lk = new Map();
    // lk[month.month] = month.year;
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
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
                      _DefaultMonthView(
                        month: month.month,
                        year: month.year,
                        day: month.daysInMonth,
                      ),
                      SizedBox(
                        height: 40,
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
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 7.1,
                            child: Text(
                              qazq[month.month * month.year] == 7
                                  ? 'Mon'
                                  : '   ',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 7.1,
                            child: Text(
                              qazq[month.month * month.year] == 1 ||
                                      qazq[month.month * month.year] == 7
                                  ? 'Tue'
                                  : '   ',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 7.1,
                            child: Text(
                              // qazq[month.month * month.year] < 3
                              qazq[month.month * month.year] == 1 ||
                                      qazq[month.month * month.year] == 7 ||
                                      qazq[month.month * month.year] == 2
                                  ? 'Wed'
                                  : '   ',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 7.1,
                            child: Text(
                              // qazq[month.month * month.year] < 4
                              qazq[month.month * month.year] == 1 ||
                                      qazq[month.month * month.year] == 7 ||
                                      qazq[month.month * month.year] == 2 ||
                                      qazq[month.month * month.year] == 3
                                  ? 'Thu'
                                  : '   ',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 7.1,
                            child: Text(
                              // qazq[month.month * month.year] < 5
                              qazq[month.month * month.year] == 4 ||
                                      qazq[month.month * month.year] == 1 ||
                                      qazq[month.month * month.year] == 7 ||
                                      qazq[month.month * month.year] == 2 ||
                                      qazq[month.month * month.year] == 3
                                  ? 'Fri'
                                  : '   ',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 7.1,
                            child: Text(
                              qazq[month.month * month.year] != 6
                                  ? 'Sat'
                                  : '   ',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          // SizedBox(
                          //   width: MediaQuery.of(context).size.width / 7.1,
                          //   child: Text(
                          //     qazq[month.month * month.year] < 7
                          //         ? 'Sun'
                          //         : '   ',
                          //     style: TextStyle(
                          //       fontSize: 16,
                          //       fontWeight: FontWeight.w400,
                          //     ),
                          //   ),
                          // ),
                        ]),
                      ),
                    ],
                  ),
                ),
          Table(
            children: month.weeks
                .map((Week week) => _generateFor(context, week))
                .toList(growable: false),
          ),
        ],
      ),
    );
  }

  TableRow _generateFor(BuildContext context, Week week) {
    DateTime firstDay = week.firstDay;
    bool rangeFeatureEnabled = rangeMinDate != null;

    return TableRow(
        children: List<Widget>.generate(DateTime.daysPerWeek, (int position) {
      DateTime day = DateTime(
        week.firstDay.year,
        week.firstDay.month,
        firstDay.day + (position - (firstDay.weekday - 1)),
      );

      if ((position + 1) < week.firstDay.weekday ||
          (position + 1) > week.lastDay.weekday ||
          day.isBefore(minDate) ||
          day.isAfter(maxDate)) {
        return SizedBox(width: 5, height: 5);
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
        return AspectRatio(
          aspectRatio: 1,
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
                ? dayBuilder(
                    context,
                    day,
                    icons: globals.icons,
                    isSelected: isSelected,
                  )
                : _DefaultDayView(
                    date: day,
                    isSelected: isSelected,
                  ),
          ),
        );
      }
    }, growable: false));
  }
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
    return (globals.d1 != null && globals.d1 != null)
        ?
        //checks if date is in between rangemax and rangemin
        widget.date.compareTo(globals.d1) >= 0 &&
                widget.date.compareTo(globals.d2) <= 0
            ?
            //icons code goes here
            //Make stack if icons exist else stay with containers
            globals.li[widget.date] != null
                ? InkWell(
                    onTap: () {
                      setState(() {
                        //globals.d = widget.date;
                        print(widget.date.toString());
                        if (globals.li[widget.date] == null) {
                          globals.li[widget.date] = {};
                        }
                        // globals.li[globals.d] = {};
                        print('List:${globals.li}');
                      });
                    },
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(width: 2.0, color: Colors.red),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              DateFormat('d').format(widget.date),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.all(3),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                globals.li[widget.date]['bloodflow'] != null
                                    ? globals.li[widget.date]['bloodflow']
                                    : SizedBox(),
                                globals.li[widget.date]['pills'] != null
                                    ? globals.li[widget.date]['pills']
                                    : SizedBox(),
                                globals.li[widget.date]['tests'] != null
                                    ? globals.li[widget.date]['tests']
                                    : SizedBox(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : InkWell(
                    onTap: () {
                      setState(() {
                        globals.d = widget.date;
                        print(globals.d.toString());
                        if (globals.li[globals.d] == null) {
                          globals.li[globals.d] = {};
                        }
                        // globals.li[globals.d] = {};
                        print('List:${globals.li}');
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 2.0, color: Colors.red),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          DateFormat('d').format(widget.date),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                  )
            : globals.li[widget.date] != null
                ? InkWell(
                    onTap: () {
                      setState(() {
                        //globals.d = widget.date;
                        print(widget.date.toString());
                        if (globals.li[widget.date] == null) {
                          globals.li[widget.date] = {};
                        }
                        // globals.li[globals.d] = {};
                        print('List:${globals.li}');
                      });
                    },
                    child: Stack(
                      children: [
                        Container(
                          child: Center(
                            child: Text(
                              DateFormat('d').format(widget.date),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ),
                        Align(
                            alignment: Alignment.bottomCenter,
                            child:
                                // gb.li[widget.date].length < 3
                                // ?
                                Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  globals.li[widget.date]['bloodflow'] != null
                                      ? globals.li[widget.date]['bloodflow']
                                      : SizedBox(),
                                  globals.li[widget.date]['pills'] != null
                                      ? globals.li[widget.date]['pills']
                                      : SizedBox(),
                                  globals.li[widget.date]['tests'] != null
                                      ? globals.li[widget.date]['tests']
                                      : SizedBox(),
                                ],
                              ),
                            )
                            // :
                            // Row(
                            //     // crossAxisAlignment:
                            //     //     CrossAxisAlignment.start,
                            //     children: [
                            //       Column(
                            //         children: [
                            //           gb.li[widget.date]['bloodflow'] != null
                            //               ? gb.li[widget.date]['bloodflow']
                            //               : SizedBox(),
                            //           gb.li[widget.date]['pills'] != null
                            //               ? gb.li[widget.date]['pills']
                            //               : SizedBox(),
                            //         ],
                            //       ),
                            //       Column(
                            //         children: [
                            //           gb.li[widget.date]['tests'] != null
                            //               ? gb.li[widget.date]['tests']
                            //               : SizedBox(),
                            //         ],
                            //       ),
                            //     ],
                            // ),
                            ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //   children: [
                        //     globals.li[widget.date]['bloodflow'] != null
                        //         ? globals.li[widget.date]['bloodflow']
                        //         : SizedBox(),
                        //     globals.li[widget.date]['pills'] != null
                        //         ? globals.li[widget.date]['pills']
                        //         : SizedBox(),
                        //     globals.li[widget.date]['tests'] != null
                        //         ? globals.li[widget.date]['tests']
                        //         : SizedBox(),
                        //   ],
                        // ),
                      ],
                    ),
                  )
                : InkWell(
                    onTap: () {
                      setState(() {
                        globals.d = widget.date;
                        print(globals.d.toString());
                        if (globals.li[globals.d] == null) {
                          globals.li[globals.d] = {};
                        }
                        // globals.li[globals.d] = {};
                        print('List:${globals.li}');
                      });
                    },
                    child: Container(
                      child: Center(
                        child: Text(
                          DateFormat('d').format(widget.date),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                  )
        : globals.li[widget.date] != null
            ? InkWell(
                onTap: () {
                  setState(() {
                    //globals.d = widget.date;
                    print(widget.date.toString());
                    if (globals.li[widget.date] == null) {
                      globals.li[widget.date] = {};
                    }
                    // globals.li[globals.d] = {};
                    print('List:${globals.li}');
                  });
                },
                child: Stack(
                  children: [
                    Container(
                      child: Center(
                        child: Text(
                          DateFormat('d').format(widget.date),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: [
                    //     globals.li[widget.date]['bloodflow'] != null
                    //         ? globals.li[widget.date]['bloodflow']
                    //         : SizedBox(),
                    //     globals.li[widget.date]['pills'] != null
                    //         ? globals.li[widget.date]['pills']
                    //         : SizedBox(),
                    //     globals.li[widget.date]['tests'] != null
                    //         ? globals.li[widget.date]['tests']
                    //         : SizedBox(),
                    //   ],
                    // ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            globals.li[widget.date]['bloodflow'] != null
                                ? globals.li[widget.date]['bloodflow']
                                : SizedBox(),
                            globals.li[widget.date]['pills'] != null
                                ? globals.li[widget.date]['pills']
                                : SizedBox(),
                            globals.li[widget.date]['tests'] != null
                                ? globals.li[widget.date]['tests']
                                : SizedBox(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : InkWell(
                onTap: () {
                  setState(() {
                    globals.d = widget.date;
                    print(globals.d.toString());
                    if (globals.li[globals.d] == null) {
                      globals.li[globals.d] = {};
                    }
                    // globals.li[globals.d] = {};
                    print('List:${globals.li}');
                  });
                },
                child: Container(
                  child: Center(
                    child: Text(
                      DateFormat('d').format(widget.date),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
              );
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
