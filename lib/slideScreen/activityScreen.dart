import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../month/monthly_calendar.dart';
import 'package:intl/intl.dart';
import '../globals.dart' as globals;

class AddMore extends StatefulWidget {
  final int month;
  final int year;
  AddMore(this.month, this.year);
//  static const routeName = '/add';
  @override
  _AddMoreState createState() => _AddMoreState();
}

class _AddMoreState extends State<AddMore> {
  final double _initFabHeight = 150.0;
  double _fabHeight;
  double _panelHeightOpen;
  double _panelHeightClosed;

  @override
  void initState() {
    super.initState();

    _fabHeight =
        //MediaQuery.of(context).size.height / 3;
        _initFabHeight;
  }

  @override
  Widget build(BuildContext context) {
    _panelHeightOpen = MediaQuery.of(context).size.height * 1;
    _panelHeightClosed = MediaQuery.of(context).size.height * .50;
    return Material(
      color: Colors.white,
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          SlidingUpPanel(
            isDraggable: false,
            padding: EdgeInsets.only(
              top: 20,
              bottom: 0,
            ),
            color: Color.fromRGBO(138, 93, 54, 1),
            maxHeight: _panelHeightOpen,
            minHeight: _panelHeightClosed,
            body: _body(),
            panelBuilder: (sc) => _panel(sc),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
            ),
            onPanelSlide: (double pos) => setState(
              () {
                _fabHeight = pos * (_panelHeightOpen - _panelHeightClosed) +
                    _initFabHeight;
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _panel(ScrollController sc) {
    return Activity('Steps');
  }

  Widget _body() {
    String formatDate(DateTime date) => new DateFormat("d").format(date);
    int date = int.parse(formatDate(DateTime.now())) - 1;

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
    int daysInMonth = daysPerMonth(widget.year)[widget.month - 1];
    print(widget.month);
    return MonthlyCalendar(
      minDate: DateTime(widget.year, widget.month, 1),
      maxDate: DateTime(widget.year, widget.month, daysInMonth),
      month: widget.month,
      year: widget.year,
    );
  }
}

class Activity extends StatefulWidget {
  String name;

  Activity(
    this.name,
  );

  @override
  _ActivityState createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  //ScrollController sc;
  int month;
  int year;
  IconData icon;

  @override
  Widget build(BuildContext context) {
    var index = 0;
    List<Activity> _activity = [
      Activity('Steps'),
      Activity('Running'),
      Activity('Swimming'),
      Activity('Yoga'),
      Activity('Cycling'),
      Activity('Gym '),
    ];

    return Container(
        padding: EdgeInsets.all(9),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0))),
        child: SingleChildScrollView(
          child: Column(
            // scrollDirection: Axis.vertical,
            // controller: sc,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '   Activity',
                style: TextStyle(
                  color: Color.fromRGBO(150, 68, 31, 1),
                  fontSize: 23,
                  fontWeight: FontWeight.w500,
                ),
                //textAlign: TextAlign.justify,
              ),
              // Icon(_activity[index].icon),

              GestureDetector(
                child: InkWell(
                  onTap: () {
                    globals.onTappedSteps = !globals.onTappedSteps;
                    setState(() {
                      Navigator.pop(context);
                    });
                  },
                  child: globals.onTappedSteps
                      ? ListTile(
                          //contentPadding: EdgeInsets.fromLTRB(10, 8, 8, 8),
                          title: Text(
                            _activity[index++].name,
                            style: TextStyle(
                              //fontSize: 17,
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(150, 68, 31, 1),
                            ),
                          ),
                          trailing: Icon(
                            Icons.check,
                            color: Colors.black,
                          ),
                        )
                      : ListTile(
                          //contentPadding: EdgeInsets.fromLTRB(10, 8, 8, 8),
                          title: Text(
                            _activity[index++].name,
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(150, 68, 31, 1),
                            ),
                          ),
                        ),
                ),
              ),

              Divider(
                height: 0,
                thickness: 2,
              ),
              GestureDetector(
                child: InkWell(
                  onTap: () {
                    globals.onTappedRunning = !globals.onTappedRunning;
                    setState(() {
                      Navigator.pop(context);
                    });
                  },
                  child: globals.onTappedRunning
                      ? ListTile(
                          title: Text(
                            _activity[index++].name,
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(150, 68, 31, 1),
                            ),
                          ),
                          trailing: Icon(
                            Icons.check,
                            color: Colors.black,
                          ),
                        )
                      : ListTile(
                          title: Text(
                            _activity[index++].name,
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(150, 68, 31, 1),
                            ),
                          ),
                        ),
                ),
              ),
              Divider(
                height: 0,
                thickness: 2,
              ),
              GestureDetector(
                child: InkWell(
                  onTap: () {
                    globals.onTappedSwimming = !globals.onTappedSwimming;
                    setState(() {
                      Navigator.pop(context);
                    });
                  },
                  child: globals.onTappedSwimming
                      ? ListTile(
                          title: Text(
                            _activity[index++].name,
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(150, 68, 31, 1),
                            ),
                          ),
                          trailing: Icon(
                            Icons.check,
                            color: Colors.black,
                          ),
                        )
                      : ListTile(
                          title: Text(
                            _activity[index++].name,
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(150, 68, 31, 1),
                            ),
                          ),
                        ),
                ),
              ),
              Divider(
                height: 0,
                thickness: 2,
              ),
              GestureDetector(
                child: InkWell(
                  onTap: () {
                    globals.onTappedYoga = !globals.onTappedYoga;
                    setState(() {
                      Navigator.pop(context);
                    });
                  },
                  child: globals.onTappedYoga
                      ? ListTile(
                          title: Text(
                            _activity[index++].name,
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(150, 68, 31, 1),
                            ),
                          ),
                          trailing: Icon(
                            Icons.check,
                            color: Colors.black,
                          ),
                        )
                      : ListTile(
                          title: Text(
                            _activity[index++].name,
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(150, 68, 31, 1),
                            ),
                          ),
                        ),
                ),
              ),
              Divider(
                height: 0,
                thickness: 2,
              ),
              GestureDetector(
                child: InkWell(
                  onTap: () {
                    globals.onTappedCycling = !globals.onTappedCycling;
                    setState(() {
                      Navigator.pop(context);
                    });
                  },
                  child: globals.onTappedCycling
                      ? ListTile(
                          title: Text(
                            _activity[index++].name,
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(150, 68, 31, 1),
                            ),
                          ),
                          trailing: Icon(
                            Icons.check,
                            color: Colors.black,
                          ),
                        )
                      : ListTile(
                          title: Text(
                            _activity[index++].name,
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(150, 68, 31, 1),
                            ),
                          ),
                        ),
                ),
              ),
              Divider(
                height: 0,
                thickness: 2,
              ),
              GestureDetector(
                child: InkWell(
                  onTap: () {
                    globals.onTappedGym = !globals.onTappedGym;
                    setState(() {
                      Navigator.pop(context);
                    });
                  },
                  child: globals.onTappedGym
                      ? ListTile(
                          title: Text(
                            _activity[index].name,
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(150, 68, 31, 1),
                            ),
                          ),
                          trailing: Icon(
                            Icons.check,
                            color: Colors.black,
                          ),
                        )
                      : ListTile(
                          title: Text(
                            'Gym',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(150, 68, 31, 1),
                            ),
                          ),
                        ),
                ),
              ),
              Divider(
                height: 0,
                thickness: 2,
              ),
            ],
          ),
        ));
  }
}
