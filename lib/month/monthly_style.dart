import '../widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:intl/intl.dart';
import 'package:swipedetector/swipedetector.dart';
import 'monthly_calendar.dart';
import '../slideScreen/firstScreen.dart';
import '../slideScreen/secondScreen.dart';

class SlideUpPage extends StatefulWidget {
  final int month;
  final int year;
  SlideUpPage(this.month, this.year);
  @override
  _SlideUpPageState createState() => _SlideUpPageState();
}

class _SlideUpPageState extends State<SlideUpPage> {
  final double _initFabHeight = 120.0;
  double _fabHeight;
  double _panelHeightOpen;
  double _panelHeightClosed;
  double _maxHeight;
  double _minHeight;
  double _screenHeight;

  int month;
  int year;
  bool isFirstScreen = true;

  @override
  void initState() {
    super.initState();

    _fabHeight = _initFabHeight;
  }

  @override
  Widget build(BuildContext context) {
    _screenHeight = MediaQuery.of(context).size.height;
    //change here
    //_panelHeightOpen = MediaQuery.of(context).size.height * 0.48;
    _panelHeightOpen = MediaQuery.of(context).size.height * 0.90;

    _panelHeightClosed = MediaQuery.of(context).size.height * 0.48;

    _maxHeight = _screenHeight;
    _minHeight = _panelHeightClosed;

    // _panelHeightOpen = MediaQuery.of(context).size.height * 0.70;
    return Material(
      color: Colors.white,
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          SlidingUpPanel(
            isDraggable: true,
            color: Colors.transparent,
            boxShadow: null,
            maxHeight:
                // _maxHeight,
                isFirstScreen ? _maxHeight : _panelHeightClosed,
            //_panelHeightOpen,
            minHeight:
                //  _minHeight,
                isFirstScreen ? _panelHeightClosed : _panelHeightClosed,
            //_panelHeightOpen,
            parallaxEnabled: false,
            parallaxOffset: 1,
            body: _body(),
            // SwipeDetector(
            //   child: _body(),
            //   onSwipeRight: () {
            //     setState(() {
            //       isFirstScreen = true;
            //     });
            //   },
            // ),
            panelBuilder: (sc) {
              final controller = PageController(
                keepPage: false,
                initialPage: 0,
              );
              return MediaQuery.removeViewInsets(
                removeBottom: true,
                context: context,
                removeTop: true,
                child: PageView(
                  onPageChanged: (page) {
                    print(page);
                    if (page == 1) {
                      print('In SecondScreen()');
                      // puts a delay to inhibit abrupt height change
                      Future.delayed(Duration(milliseconds: 500), () {
                        // isFirstScreen = false;
                        setState(() {
                          isFirstScreen = false;
                        });
                      });
                    } else {
                      print('In FirstScreen()');
                      setState(() {
                        _maxHeight = _screenHeight / 2;
                        isFirstScreen = true;
                      });
                    }
                    print(isFirstScreen);
                  },
                  scrollDirection: Axis.horizontal,
                  controller: controller,
                  children: [
                    FirstScreen(widget.month, widget.year),
                    // Positioned(
                    //   left: 0,
                    //   right: 0,
                    //   bottom: 0,
                    //   child: BottomNavbar(
                    //     currentIndex: 3,
                    //   ),
                    // ),
                    SecondScreen(),
                    //
                    // CustomSheet(),
                  ],
                ),
              );
            },
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.0),
                topRight: Radius.circular(24.0)),
            // onPanelSlide: (double pos) => setState(() {
            //   // print('slide: $pos');

            //   _fabHeight = pos * (_panelHeightOpen - _panelHeightClosed) +
            //       _initFabHeight;
            // }),
          ),
          Positioned(
            bottom: 1,
            left: 0,
            right: 0,
            child: BottomNavbar(
              currentIndex: 3,
            ),
          ),
        ], //svg icon size : 25
      ),
      //Spacer(),

      //   ],
      // ),
    );
  }

  Widget _panel(ScrollController sc) {
    int x = 0;
    final controller = PageController(
      initialPage: x,
    );
    return MediaQuery.removeViewInsets(
      removeBottom: true,
      context: context,
      removeTop: true,
      child: PageView(
        onPageChanged: (page) {
          setState(() {
            print(page);
            isFirstScreen = page == 0 ? true : false;
          });
        },
        scrollDirection: Axis.horizontal,
        controller: controller,
        children: [
          FirstScreen(widget.month, widget.year),
          // Positioned(
          //   left: 0,
          //   right: 0,
          //   bottom: 0,
          //   child: BottomNavbar(
          //     currentIndex: 3,
          //   ),
          // ),

          SecondScreen(),

          // CustomSheet(),
        ],
      ),
    );
  }

  // Widget which renders monthly calender.
  Widget _body() {
    String formatDate(DateTime date) => new DateFormat("d").format(date);
//    print(formatDate(DateTime.now()));
    // int date = int.parse(formatDate(DateTime.now())) - 1;
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
          // 32,
          // isLeapYear(year) ? 30 : 29,
          // 32,
          // 31,
          // 32,
          // 31,
          // 32,
          // 32,
          // 31,
          // 32,
          // 31,
          // 32,
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
    return MonthlyCalendar(
//      minDate: DateTime.now().subtract(Duration(days: date)),
//      maxDate: DateTime.now().add(Duration(days: daysInMonth)),
      minDate: DateTime(widget.year, widget.month, 1),
      maxDate: DateTime(widget.year, widget.month, daysInMonth),
      month: widget.month,
      year: widget.year,
    );
  }
}
