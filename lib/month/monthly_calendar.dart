import '../slideScreen/firstScreen.dart';
// import '../mns/homepage.dart' as mp;
import '../mns/main.dart' as mns;
import '../widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import '../year/year.dart';
import '../utils/date_models.dart';
// import '../utils/date_utils.dart' as dp;
import '../utils/date_utils.dart' as dp;
import '../Settings/home_page.dart';
import '../globals.dart' as gb;

class MonthlyCalendar extends StatefulWidget {
  static const routeName = '/vertical';
  final int month;
  final int year;
  final DateTime minDate;
  final DateTime maxDate;
  final MonthBuilder monthBuilder;
  final DayBuilder dayBuilder;
  final DateTime initialMinDate;
  final DateTime initialMaxDate;
  final ValueChanged<DateTime> onDayPressed;
  final PeriodChanged onRangeSelected;
  final EdgeInsetsGeometry listPadding;

  MonthlyCalendar(
      {this.month,
      this.year,
      this.minDate,
      this.maxDate,
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
  _MonthlyCalendarState createState() => _MonthlyCalendarState();
}

class _MonthlyCalendarState extends State<MonthlyCalendar> {
  DateTime _minDate;
  DateTime _maxDate;
  List<Month> _months;
  DateTime rangeMinDate;
  DateTime rangeMaxDate;
  DateTime choosenday;
  String m;
  int count;
  @override
  void initState() {
    count = 0;
    monthName(widget.month);
    super.initState();
    _months = dp.DateUtils.extractWeeks(widget.minDate, widget.maxDate);
    print(_months);
    _minDate = widget.minDate.removeTime();
    _maxDate = widget.maxDate.removeTime();
    rangeMinDate = widget.initialMinDate;
    rangeMaxDate = widget.initialMaxDate;

    gb.pq = DateTime.now();

    if (gb.lop[DateTime.now()] == null) {
      //changing
      gb.lop[DateTime.now()] = false;
    }
    if (gb.li[DateTime.now()] == null) {
      gb.li[DateTime.now()] = {};
    }
  }

  void monthName(int month) {
    print(month);
    switch (month) {
      case 1:
        m = "January";
        break;
      case 2:
        m = "February";
        break;
      case 3:
        m = "March";
        break;
      case 4:
        m = "April";
        break;
      case 5:
        m = "May";
        break;
      case 6:
        m = "June";
        break;
      case 7:
        m = "July";
        break;
      case 8:
        m = "August";
        break;
      case 9:
        m = "September";
        break;
      case 10:
        m = "October";
        break;
      case 11:
        m = "November";
        break;
      case 12:
        m = "December";
        break;

      default:
        m = "Out of Bounds";
        break;
    }
  }

  void _onHorizontalDragStartHandler(DragStartDetails details) {
    setState(() {
      // this.dragDirection = "HORIZONTAL";
      // this.startDXPoint = '${details.globalPosition.dx.floorToDouble()}';
      // this.startDYPoint = '${details.globalPosition.dy.floorToDouble()}';
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => mns.MNS()),
    );
  }

  @override
  void didUpdateWidget(MonthlyCalendar oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.minDate != widget.minDate ||
        oldWidget.maxDate != widget.maxDate) {
      _months = dp.DateUtils.extractWeeks(widget.minDate, widget.maxDate);
      _minDate = widget.minDate.removeTime();
      _maxDate = widget.maxDate.removeTime();
    }
    // setState(() {
    //   if (gb.lop[gb.pq] == null) {
    //     gb.lop[gb.pq] = false;
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? Colors.white
            : Colors.black,
        //Colors.white,
        //bottomNavigationBar: BottomNavbar(currentIndex: 3,),
        // appBar: AppBar(
        //   leading: Transform.translate(
        //     offset: Offset(-8, 0),
        //     child: IconButton(
        //       padding: EdgeInsets.zero,
        //       onPressed: () {
        //         Navigator.push(
        //           context,
        //           MaterialPageRoute(builder: (context) => Year()),
        //         );
        //       },
        //       icon: Icon(
        //         Icons.arrow_back_ios_outlined,
        //         color: Colors.black,
        //         size: 28,
        //       ),
        //     ),
        //   ),
        //   automaticallyImplyLeading: false,
        //   actions: <Widget>[
        //     IconButton(
        //       icon: Icon(
        //         Icons.settings,
        //         color: Colors.black,
        //       ),
        //       onPressed: () {
        //         Navigator.push(context,
        //             MaterialPageRoute(builder: (context) => SettingsHomePage()));
        //         // do something
        //       },
        //     )
        //   ],
        //   toolbarHeight: 35,
        //   titleSpacing: -23,
        //   backgroundColor: Colors.white,
        //   elevation: 0.0,
        //   title: Text(
        //     m,
        //     style: TextStyle(
        //         color: Colors.black, fontSize: 24, fontWeight: FontWeight.w500),
        //   ),
        // ),
        body: Stack(
          children: [
            Container(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: WeekDayView(context),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(17, 0, 17, 5),
                    height: MediaQuery.of(context).size.height * 0.50,
                    child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        cacheExtent: (MediaQuery.of(context).size.width /
                                DateTime.daysPerWeek) *
                            6,
                        padding: widget.listPadding ?? EdgeInsets.zero,
                        itemCount: _months.length,
                        itemBuilder: (BuildContext context, int position) {
                          print(_months);
                          return _MonthView(
                            month: _months[position],
                            minDate: _minDate,
                            maxDate: _maxDate,
                            monthBuilder: widget.monthBuilder,
                            dayBuilder: widget.dayBuilder,
                            onDayPressed: widget.onRangeSelected != null
                                ? (DateTime date) {
                                    setState(() {
                                      if (date.isBefore(DateTime.now())) {
                                        gb.pq = date;
                                        choosenday = date;
                                      } //choosenday = date;
                                    });

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
                                      //FirstScreen(widget.month, widget.year);
                                      rangeMinDate = date;
                                      rangeMaxDate = date;
                                      gb.pq = date;

                                      if (gb.lop[date] == null) {
                                        //changing
                                        gb.lop[date] = false;
                                      }
                                      if (gb.li[date] == null) {
                                        gb.li[date] = {};
                                      }
                                    });
                                  },
                            //widget.onDayPressed,
                            rangeMinDate: gb.pq,
                            rangeMaxDate: gb.pq,
                          );
                          //static List<DateTime> red=gb.calculateDaysInterval(gb.d1,gb.d2);
                        }),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0.0,
              left: 0.0,
              right: 0.0,
              child: Padding(
                padding: const EdgeInsets.only(top: 3, bottom: 2),
                child: AppBar(
                  leading: Transform.translate(
                    offset: Offset(-8, 0),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Year()),
                        );
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_outlined,
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.black
                            : Colors.white,
                        //color: Colors.black,
                        size: 28,
                      ),
                    ),
                  ),
                  automaticallyImplyLeading: false,
                  actions: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 18),
                      child: IconButton(
                        icon: Icon(
                          Icons.settings,
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.black
                                  : Colors.white,
                          //color: Colors.black,
                          size: 20,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SettingsHomePage()));
                          // do something
                        },
                      ),
                    )
                  ],
                  toolbarHeight: 35,
                  titleSpacing: -23,
                  backgroundColor:
                      Theme.of(context).brightness == Brightness.light
                          ? Colors.white
                          : Colors.black,
                  elevation: 0.0,
                  title: Text(
                    m,
                    style: TextStyle(
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.black
                            : Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onHorizontalDragStart: _onHorizontalDragStartHandler,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.black
                        : Color.fromRGBO(201, 165, 165, 1),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                    ),
                  ),
                  height: MediaQuery.of(context).size.height,
                  width: 11,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MonthView extends StatefulWidget {
  final Month month;
  final DateTime minDate;
  final DateTime maxDate;
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
      this.monthBuilder,
      this.dayBuilder,
      this.onDayPressed,
      this.onMonthPressed,
      this.rangeMinDate,
      this.rangeMaxDate,
      Key key})
      : super(key: key);

  static List<int> daysPerMonth(int year) => <int>[
        31,
        isLeapYear(year) ? 29 : 28,
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

  static bool isLeapYear(int year) {
    bool leapYear = false;

    bool leap = ((year % 100 == 0) && (year % 400 != 0));
    if (leap == true) {
      return false;
    } else if (year % 4 == 0) {
      return true;
    }

    return leapYear;
  }

  @override
  __MonthViewState createState() => __MonthViewState();
}

class __MonthViewState extends State<_MonthView> {
  List<int> po = [];
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
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        //change if giving errors
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            widget.monthBuilder != null
                ? widget.monthBuilder(
                    context, widget.month.month, widget.month.year)
                : SizedBox(),
            SizedBox(),
            Table(
              children: widget.month.weeks
                  .map((Week week) => _generateFor(context, week, widget.month))
                  .toList(growable: false),
            ),
          ],
        ),
      ],
    );
  }

  TableRow _generateFor(BuildContext context, Week week, Month mon) {
    DateTime firstDay = week.firstDay;
    bool rangeFeatureEnabled = widget.rangeMinDate != null;
    return TableRow(
      children: List<Widget>.generate(DateTime.daysPerWeek, (int position) {
        DateTime re;
        DateTime re2;
        re = firstDay.subtract(Duration(days: 1));
        DateTime day = DateTime(
          week.firstDay.year,
          week.firstDay.month,
          // daysPerMonth(week.firstDay.year)[week.firstDay.month - 1]==firstDay.day
          //     ? firstDay.day + (position - (firstDay.weekday))
          // :
          firstDay.day + (position - (firstDay.weekday)),
        );

        if ((position + 1) < week.firstDay.weekday ||
            (position) > week.lastDay.weekday ||
            day.isBefore(widget.minDate) ||
            day.isAfter(widget.maxDate)) {
          return const SizedBox();
        } else {
          bool isSelected = false;

          if (rangeFeatureEnabled) {
            if (widget.rangeMinDate != null && widget.rangeMaxDate != null) {
              isSelected = day.isSameDayOrAfter(widget.rangeMinDate) &&
                  day.isSameDayOrBefore(widget.rangeMaxDate);
            } else {
              isSelected = day.isAtSameMomentAs(widget.rangeMinDate);
            }
          }
          // if (!po.contains(mon.month)) {
          //   po.add(mon.month);
          // }
          // print(mon.month);
          // print('PO:$po');
          return
              // (day.month != re.month) &&
              //         day.day == week.firstDay.day &&
              //         (day.weekday == 1 || day.weekday == 2) &&
              //         DateTime(mon.year, mon.month,
              //                     daysPerMonth(mon.year)[mon.month - 1])
              //                 .weekday ==
              //             7
              // day.day == re.day &&
              //         (re.day == 31 ||
              //             re.day == 29 ||
              //             re.day == 30 ||
              //             re.day == 28) &&
              //         (week.lastDay.day != 29 &&
              //             week.lastDay.day != 30 &&
              //             week.lastDay.day != 31 &&
              //             week.lastDay.day != 28)

              // (day.month != re.month) &&
              //         (day.day == 1 && (day.month == re.month + 1))

              // ((DateTime(mon.year, mon.month, 1).weekday == 5 ||
              //                         DateTime(mon.year, mon.month, 1)
              //                                 .weekday ==
              //                             6) &&
              //                     (DateTime(
              //                                     mon.year,
              //                                     mon.month,
              //                                     daysPerMonth(
              //                                         mon.year)[mon.month - 1])
              //                                 .weekday ==
              //                             1 ||
              //                         DateTime(
              //                                     mon.year,
              //                                     mon.month,
              //                                     daysPerMonth(
              //                                         mon.year)[mon.month - 1])
              //                                 .weekday ==
              //                             7))
              //               &&
              day.isAfter(DateTime(mon.year, mon.month,
                      daysPerMonth(mon.year)[mon.month - 1]))
                  // &&
                  //         day.isBefore(DateTime(mon.year, mon.month, 2))
                  ? SizedBox()
                  : AspectRatio(
                      aspectRatio:
                          // DateTime(mon.year, mon.month,
                          //                 daysPerMonth(mon.year)[mon.month - 1])
                          //             .weekday ==
                          //         7
                          ((DateTime(mon.year, mon.month, 1).weekday == 5 ||
                                      DateTime(mon.year, mon.month, 1)
                                              .weekday ==
                                          6) &&
                                  (DateTime(
                                                  mon.year,
                                                  mon.month,
                                                  daysPerMonth(
                                                      mon.year)[mon.month - 1])
                                              .weekday ==
                                          1 ||
                                      DateTime(
                                                  mon.year,
                                                  mon.month,
                                                  daysPerMonth(
                                                      mon.year)[mon.month - 1])
                                              .weekday ==
                                          7))
                              ? 1.00
                              : 0.92,
                      child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: widget.onDayPressed != null
                            ? () {
                                if (widget.onDayPressed != null) {
                                  widget.onDayPressed(day);
                                }
                              }
                            : null,
                        child: widget.dayBuilder != null
                            ? widget.dayBuilder(context, day,
                                isSelected: isSelected)
                            : _DefaultDayView(
                                date: day, isSelected: isSelected),
                      ),
                    );
        }
      }, growable: false),
    );
  }
}

class _DefaultMonthView extends StatelessWidget {
  final int month;
  final int year;

  _DefaultMonthView({@required this.month, @required this.year});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(DateFormat('MMM').format(DateTime(year, month)),
          style: TextStyle(fontSize: 20)),
    );
  }
}

class _DefaultDayView extends StatefulWidget {
  final DateTime date;
  final bool isSelected;
  //Map<dynamic, dynamic> icons;
  _DefaultDayView({@required this.date, this.isSelected});

  @override
  __DefaultDayViewState createState() => __DefaultDayViewState();
}

class __DefaultDayViewState extends State<_DefaultDayView> {
  @override
  Widget build(BuildContext context) {
    if (gb.li[widget.date] == null) {
      gb.li[widget.date] = {};
    }

    return widget.date.isSameDayOrBefore(DateTime.now())
        ? Container(
            decoration: BoxDecoration(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  // height: 22.5,
                  // width: 24,
                  height: widget.isSelected ||
                          (gb.pq == null && gb.qr == widget.date)
                      ? 23.5
                      : 22.5,
                  width: widget.isSelected ||
                          (gb.pq == null && gb.qr == widget.date)
                      ? 25
                      : 24,
                  //width: 25,
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: widget.isSelected ||
                            (gb.pq == null && gb.qr == widget.date)
                        ? Colors.grey
                        : Colors.transparent,
                    border: Border.all(width: 0, color: Colors.transparent),
                  ),
                  child: Center(
                    child: Text(
                      DateFormat('d').format(widget.date),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w400,
                        color: gb.pq != null && gb.qr == widget.date
                            ? Colors.brown
                            : Theme.of(context).brightness == Brightness.light
                                ? Colors.black
                                : Colors.white,
                      ),
                    ),
                  ),
                ),
                gb.li[widget.date].length == 1
                    ? Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 17, 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            gb.li[widget.date]['bloodflow'] != null
                                ? gb.li[widget.date]['bloodflow']
                                : SizedBox(),
                            gb.li[widget.date]['pills'] != null &&
                                    gb.li[widget.date]['bloodflow'] == null
                                ? gb.li[widget.date]['pills']
                                : SizedBox(),
                            gb.li[widget.date]['discharge'] != null &&
                                    gb.li[widget.date]['bloodflow'] == null
                                ? gb.li[widget.date]['discharge']
                                : SizedBox(),
                            gb.li[widget.date]['tests'] != null
                                ? gb.li[widget.date]['tests']
                                : SizedBox(),
                            gb.li[widget.date]['notes'] != null
                                ? gb.li[widget.date]['notes']
                                : SizedBox(),
                            gb.li[widget.date]['intimacy'] != null
                                ? gb.li[widget.date]['intimacy']
                                : SizedBox(),
                            gb.li[widget.date]['mns'] != null
                                ? gb.li[widget.date]['mns']
                                : SizedBox(),
                          ],
                        ),
                      )
                    : gb.li[widget.date].length >= 4
                        ? Padding(
                            padding: const EdgeInsets.fromLTRB(7, 0, 5, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    gb.li[widget.date]['bloodflow'] != null
                                        ? gb.li[widget.date]['bloodflow']
                                        : SizedBox(),
                                    gb.li[widget.date]['pills'] != null &&
                                            gb.li[widget.date]['bloodflow'] ==
                                                null
                                        ? gb.li[widget.date]['pills']
                                        : SizedBox(),
                                    gb.li[widget.date]['discharge'] != null &&
                                            gb.li[widget.date]['bloodflow'] ==
                                                null
                                        ? gb.li[widget.date]['discharge']
                                        : SizedBox(),
                                    gb.li[widget.date]['notes'] != null
                                        ? gb.li[widget.date]['notes']
                                        : SizedBox(),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    gb.li[widget.date]['intimacy'] != null
                                        ? gb.li[widget.date]['intimacy']
                                        : SizedBox(),
                                    gb.li[widget.date]['mns'] != null
                                        ? gb.li[widget.date]['mns']
                                        : SizedBox(),
                                    gb.li[widget.date]['tests'] != null
                                        ? gb.li[widget.date]['tests']
                                        : SizedBox(),
                                  ],
                                ),
                              ],
                            ),
                          )
                        : gb.li[widget.date].length > 4
                            ? Padding(
                                padding: const EdgeInsets.fromLTRB(7, 0, 5, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        gb.li[widget.date]['bloodflow'] != null
                                            ? gb.li[widget.date]['bloodflow']
                                            : SizedBox(),
                                        gb.li[widget.date]['pills'] != null &&
                                                gb.li[widget.date]
                                                        ['bloodflow'] ==
                                                    null
                                            ? gb.li[widget.date]['pills']
                                            : SizedBox(),
                                        gb.li[widget.date]['discharge'] !=
                                                    null &&
                                                gb.li[widget.date]
                                                        ['bloodflow'] ==
                                                    null
                                            ? gb.li[widget.date]['discharge']
                                            : SizedBox(),
                                        gb.li[widget.date]['tests'] != null
                                            ? gb.li[widget.date]['tests']
                                            : SizedBox(),
                                        gb.li[widget.date]['notes'] != null
                                            ? gb.li[widget.date]['notes']
                                            : SizedBox(),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        gb.li[widget.date]['intimacy'] != null
                                            ? gb.li[widget.date]['intimacy']
                                            : SizedBox(),
                                        gb.li[widget.date]['mns'] != null
                                            ? gb.li[widget.date]['mns']
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
                                    gb.li[widget.date]['intimacy'] != null
                                        ? gb.li[widget.date]['intimacy']
                                        : SizedBox(),
                                    gb.li[widget.date]['mns'] != null
                                        ? gb.li[widget.date]['mns']
                                        : SizedBox(),
                                    gb.li[widget.date]['bloodflow'] != null
                                        ? gb.li[widget.date]['bloodflow']
                                        : SizedBox(),
                                    gb.li[widget.date]['pills'] != null &&
                                            gb.li[widget.date]['bloodflow'] ==
                                                null
                                        ? gb.li[widget.date]['pills']
                                        : SizedBox(),
                                    gb.li[widget.date]['discharge'] != null &&
                                            gb.li[widget.date]['bloodflow'] ==
                                                null
                                        ? gb.li[widget.date]['discharge']
                                        : SizedBox(),
                                    gb.li[widget.date]['tests'] != null
                                        ? gb.li[widget.date]['tests']
                                        : SizedBox(),
                                    gb.li[widget.date]['notes'] != null
                                        ? gb.li[widget.date]['notes']
                                        : SizedBox(),
                                  ],
                                ),
                              ),

                ///
                gb.lop2[widget.date] == 1 && gb.lop[widget.date] != true
                    // &&
                    // gb.lop2[widget.date] != true
                    ? Container(
                        width:
                            gb.lop2[widget.date.add(Duration(days: 1))] == 1 ||
                                    gb.lop2[widget.date
                                            .subtract(Duration(days: 1))] ==
                                        1
                                ? 67
                                : 27,
                        height: 1,
                        color: Colors.red,
                        margin:
                            //edit this
                            gb.li[widget.date].length == 0
                                ? EdgeInsets.fromLTRB(0, 12, 0, 0)
                                : EdgeInsets.fromLTRB(0, 0, 0, 0),
                      )
                    : SizedBox(),
                //////
                gb.lop3[widget.date] == 1 && gb.lop[widget.date] != true
                    // &&
                    // gb.lop3[widget.date] != true &&
                    // gb.lop2[widget.date] != true
                    ? Container(
                        width:
                            gb.lop3[widget.date.add(Duration(days: 1))] == 1 ||
                                    gb.lop3[widget.date
                                            .subtract(Duration(days: 1))] ==
                                        1
                                ? 67
                                : 27,
                        height: 3,
                        color: Colors.red,
                        margin:
                            //edit this
                            gb.li[widget.date].length == 0
                                ? EdgeInsets.fromLTRB(0, 12, 0, 0)
                                : EdgeInsets.fromLTRB(0, 0, 0, 0),
                      )
                    : SizedBox(),
                ///////
                gb.lop[widget.date] == true
                    ? Container(
                        width: gb.lop[widget.date.add(Duration(days: 1))] ==
                                    true ||
                                gb.lop[widget.date
                                        .subtract(Duration(days: 1))] ==
                                    true
                            ? 67
                            : 27,
                        height: 2,
                        color: Colors.red,
                        margin:
                            //edit this
                            gb.li[widget.date].length == 0
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
                  // height: 22.5,
                  // width: 24,
                  height: widget.isSelected ||
                          (gb.pq == null && gb.qr == widget.date)
                      ? 23.5
                      : 22.5,
                  width: widget.isSelected ||
                          (gb.pq == null && gb.qr == widget.date)
                      ? 25
                      : 24,
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
                        fontSize: 19,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                  ),
                ),
                gb.li[widget.date].length == 1
                    ? Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 10, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            gb.li[widget.date]['bloodflow'] != null
                                ? gb.li[widget.date]['bloodflow']
                                : SizedBox(),
                            gb.li[widget.date]['pills'] != null &&
                                    gb.li[widget.date]['bloodflow'] == null
                                ? gb.li[widget.date]['pills']
                                : SizedBox(),
                            gb.li[widget.date]['discharge'] != null &&
                                    gb.li[widget.date]['bloodflow'] == null
                                ? gb.li[widget.date]['discharge']
                                : SizedBox(),
                            gb.li[widget.date]['tests'] != null
                                ? gb.li[widget.date]['tests']
                                : SizedBox(),
                            gb.li[widget.date]['notes'] != null
                                ? gb.li[widget.date]['notes']
                                : SizedBox(),
                            gb.li[widget.date]['intimacy'] != null
                                ? gb.li[widget.date]['intimacy']
                                : SizedBox(),
                            gb.li[widget.date]['mns'] != null
                                ? gb.li[widget.date]['mns']
                                : SizedBox(),
                          ],
                        ),
                      )
                    : gb.li[widget.date].length >= 4
                        ? Padding(
                            padding: const EdgeInsets.fromLTRB(7, 0, 5, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    gb.li[widget.date]['bloodflow'] != null
                                        ? gb.li[widget.date]['bloodflow']
                                        : SizedBox(),
                                    gb.li[widget.date]['pills'] != null &&
                                            gb.li[widget.date]['bloodflow'] ==
                                                null
                                        ? gb.li[widget.date]['pills']
                                        : SizedBox(),
                                    gb.li[widget.date]['discharge'] != null &&
                                            gb.li[widget.date]['bloodflow'] ==
                                                null
                                        ? gb.li[widget.date]['discharge']
                                        : SizedBox(),
                                    gb.li[widget.date]['tests'] != null
                                        ? gb.li[widget.date]['tests']
                                        : SizedBox(),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    gb.li[widget.date]['intimacy'] != null
                                        ? gb.li[widget.date]['intimacy']
                                        : SizedBox(),
                                    gb.li[widget.date]['notes'] != null
                                        ? gb.li[widget.date]['notes']
                                        : SizedBox(),
                                    gb.li[widget.date]['mns'] != null
                                        ? gb.li[widget.date]['mns']
                                        : SizedBox(),
                                  ],
                                ),
                              ],
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.fromLTRB(7, 0, 5, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                gb.li[widget.date]['bloodflow'] != null
                                    ? gb.li[widget.date]['bloodflow']
                                    : SizedBox(),
                                gb.li[widget.date]['pills'] != null &&
                                        gb.li[widget.date]['bloodflow'] == null
                                    ? gb.li[widget.date]['pills']
                                    : SizedBox(),
                                gb.li[widget.date]['discharge'] != null &&
                                        gb.li[widget.date]['bloodflow'] == null
                                    ? gb.li[widget.date]['discharge']
                                    : SizedBox(),
                                gb.li[widget.date]['tests'] != null
                                    ? gb.li[widget.date]['tests']
                                    : SizedBox(),
                                gb.li[widget.date]['notes'] != null
                                    ? gb.li[widget.date]['notes']
                                    : SizedBox(),
                                gb.li[widget.date]['intimacy'] != null
                                    ? gb.li[widget.date]['intimacy']
                                    : SizedBox(),
                                gb.li[widget.date]['mns'] != null
                                    ? gb.li[widget.date]['mns']
                                    : SizedBox(),
                              ],
                            ),
                          ),

                //
                gb.lop2[widget.date] == 1
                    //&& gb.lop[widget.date] != true
                    //&&
                    //gb.lop2[widget.date] != true
                    ? Container(
                        width:
                            gb.lop2[widget.date.add(Duration(days: 1))] == 1 ||
                                    gb.lop2[widget.date
                                            .subtract(Duration(days: 1))] ==
                                        1
                                ? 67
                                : 27,
                        height: 1,
                        color: Colors.red,
                        margin:
                            //edit this
                            gb.li[widget.date].length == 0
                                ? EdgeInsets.fromLTRB(0, 12, 0, 0)
                                : EdgeInsets.fromLTRB(0, 0, 0, 0),
                      )
                    : SizedBox(),
                //////
                gb.lop3[widget.date] == 1 && gb.lop[widget.date] != true
                    // &&
                    // gb.lop3[widget.date] != true &&
                    // gb.lop2[widget.date] != true
                    ? Container(
                        width:
                            gb.lop3[widget.date.add(Duration(days: 1))] == 1 ||
                                    gb.lop3[widget.date
                                            .subtract(Duration(days: 1))] ==
                                        1
                                ? 67
                                : 27,
                        height: 3,
                        color: Colors.red,
                        margin:
                            //edit this
                            gb.li[widget.date].length == 0
                                ? EdgeInsets.fromLTRB(0, 12, 0, 0)
                                : EdgeInsets.fromLTRB(0, 0, 0, 0),
                      )
                    : SizedBox(),
                ///////

                /////////
                // gb.lop[widget.date] == true
                //     ? Container(
                //         width: gb.lop[widget.date.add(Duration(days: 1))] ==
                //                     true ||
                //                 gb.lop[widget.date
                //                         .subtract(Duration(days: 1))] ==
                //                     true
                //             ? 67
                //             : 27,
                //         height: 2,
                //         color: Colors.red,
                //         margin:
                //             //edit this
                //             gb.li[widget.date].length == 0
                //                 ? EdgeInsets.fromLTRB(0, 12, 0, 0)
                //                 : EdgeInsets.fromLTRB(0, 0, 0, 0),
                //       )
                //     : SizedBox(),
                //////////////////////

                ///
                // Spacer(),
                // gb.lop2[widget.date] == 1

                //     ? Column(
                //         children: [
                //           Container(
                //             width:
                //                 gb.lop2[widget.date.add(Duration(days: 1))] ==
                //                             1 ||
                //                         gb.lop2[widget.date
                //                                 .subtract(Duration(days: 1))] ==
                //                             1
                //                     ? 67
                //                     : 27,
                //             height: 1,
                //             color: Colors.red,
                //             margin:
                //                 //edit this
                //                 gb.li[widget.date].length == 0
                //                     ? EdgeInsets.fromLTRB(0, 12, 0, 0)
                //                     : EdgeInsets.fromLTRB(0, 0, 0, 0),
                //           ),
                //           SizedBox(height: 2),
                //         ],
                //       )

                //     : SizedBox(),
              ],
            ),
          );
  }
}

Widget WeekDayView(BuildContext context) {
  return Container(
    margin: EdgeInsets.fromLTRB(16, 5, 15, 4),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 8,
          height: 21,
          //MediaQuery.of(context).size.height / 12,
          child: Center(
            child: Text(
              'S',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 8,
          height: 21,
          //MediaQuery.of(context).size.height / 12,
          child: Center(
            child: Text(
              'M',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 8,
          height: 21,
          // MediaQuery.of(context).size.height / 12,
          child: Center(
            child: Text(
              'T',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 8,
          height: 21,
          //MediaQuery.of(context).size.height / 12,
          child: Center(
            child: Text(
              'W',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 8,
          height: 21,
          //MediaQuery.of(context).size.height / 12,
          child: Center(
            child: Text(
              'T',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 8,
          height: 21,
          //MediaQuery.of(context).size.height / 12,
          child: Center(
            child: Text(
              'F',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 8,
          height: 21,
          //MediaQuery.of(context).size.height / 12,
          child: Center(
            child: Text(
              'S',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        // Container(
        //   width: MediaQuery.of(context).size.width / 8,
        //   height: 21,
        //   //MediaQuery.of(context).size.height / 12,
        //   child: Center(
        //     child: Text(
        //       'S',
        //       style: TextStyle(
        //         fontSize: 18.0,
        //         fontWeight: FontWeight.w600,
        //       ),
        //     ),
        //   ),
        // ),
      ],
    ),
  );
}

typedef MonthBuilder = Widget Function(
    BuildContext context, int month, int year);
typedef DayBuilder = Widget Function(BuildContext context, DateTime date,
    {bool isSelected
    //, Map<dynamic, dynamic> icons
    });
typedef PeriodChanged = void Function(DateTime minDate, DateTime maxDate);
