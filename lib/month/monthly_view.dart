import 'package:flutter/cupertino.dart';

import '../new_widgets/first_slide.dart';
import '../slideScreen/firstScreen.dart';
import '../slideScreen/secondScreen.dart';
import '../widgets/bottom_navbar.dart';
import 'package:intl/intl.dart';
import '../sections/sections.dart';
import 'package:swipedetector/swipedetector.dart';
import '../Settings/theme.dart';
import '../widgets/bottom_navbar.dart';
import 'package:provider/provider.dart';
import '../widgets/bottom_card.dart';
import 'package:flutter/material.dart';
import '../sections/sections.dart';
import '../globals.dart' as globals;

import '../Settings/globals.dart' as settings_globals;
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:swipedetector/swipedetector.dart';
import '../new_widgets/new_widgets.dart';
import 'package:flutter/material.dart';
import './monthly_style.dart';
<<<<<<< HEAD
import 'cards/constants.dart';
import 'cards/pageone.dart';
import 'cards/pagetwo.dart';
import 'cards/provider.dart/card_provider.dart';
=======
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
import 'monthly_calendar.dart';
import '../globals.dart' as globals;
import 'package:flutter_swiper/flutter_swiper.dart';

bool lala2 = true;

class UniqueCard {
  final CardType type;
  //final Color col;
  final String heading;
  final String heading2;
  final Widget content;
  final double maxDragHeight;

  const UniqueCard({
    @required this.heading,
    this.type,
    this.heading2,
    @required this.content,
    @required this.maxDragHeight,

    //this.col
  });
}

// stuff to render on each card
class CardContent extends StatefulWidget {
  final String heading;
  final String heading2;
  final Widget child;

  CardContent({@required this.heading, this.child, this.heading2});

  @override
  _CardContentState createState() => _CardContentState();
}

class _CardContentState extends State<CardContent> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: double.infinity,
        color: Color.fromRGBO(138, 93, 54, 1),
        // decoration: BoxDecoration(
        //   border: Border(top: BorderSide(color: col)),
        // ),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SwipeDetector(
                onSwipeRight: () {
                  setState(() {
                    lala2 = true;
                  });

                  print(lala2.toString());
                },
                child: Row(
                  children: [
                    Text.rich(
                      TextSpan(
                          text: widget.heading,
                          style: TextStyle(color: Colors.white, fontSize: 21),
                          children: <InlineSpan>[
                            // TextSpan(
                            //   text: heading,
                            //   style: TextStyle(color: Colors.white, fontSize: 21),
                            // ),
                            TextSpan(
                              text: ' ${widget.heading2}',
                              style: TextStyle(
                                  color: widget.heading == 'Blood' &&
                                          Theme.of(context).brightness ==
                                              Brightness.dark
                                      ? Color.fromRGBO(208, 2, 27, 1)
                                      : widget.heading == 'Vaginal' &&
                                              Theme.of(context).brightness ==
                                                  Brightness.dark
                                          ? Color.fromRGBO(74, 144, 226, 1)
                                          : Colors.white,
                                  fontSize: 21),
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 22.0),
              widget.child ?? Container(),
              SizedBox(height: 22.0),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomContainer extends StatelessWidget {
  final bool trackUser;
  final double height;
  final Widget child;
  final bool hasBorder;
  final Color col;
  const BottomContainer(
      {Key key,
      this.trackUser,
      this.height,
      this.child,
      this.hasBorder,
      this.col})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        child: Container(
            padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 21.0),
            child: child),
        height: height,
        decoration: BoxDecoration(
          color: Color.fromRGBO(138, 93, 54, 1),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          border: hasBorder ? Border.all(color: col) : null,
        ),
      ),
    );
  }
}

class MonthlyView extends StatefulWidget {
  static const routeName = '/monthlyView';
  final int month;
  final int year;
  bool valu;
  MonthlyView({this.month, this.year, this.valu});
  @override
  _MonthlyViewState createState() => _MonthlyViewState();
}

class _MonthlyViewState extends State<MonthlyView> {
  bool value = false;

  void sheet() {
    showModalBottomSheet(
        // isDismissible: false,
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? Colors.white
            : Colors.black,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        )),
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.all(9),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0))),
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              children: [
                Text(
                  '   Activity',
                  style: TextStyle(
                    color: Color.fromRGBO(150, 68, 31, 1),
                    fontSize: 23,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      globals.onTappedSteps = !globals.onTappedSteps;
                      Navigator.pop(context);
                    });
                  },
                  child: globals.onTappedSteps
                      ? ListTile(
                          //contentPadding: EdgeInsets.fromLTRB(10, 8, 8, 8),
                          title: Text(
                            'Steps',
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
                            'Steps',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(150, 68, 31, 1),
                            ),
                          ),
                        ),
                ),
                Divider(
                  height: 0,
                  thickness: 2,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      globals.onTappedRunning = !globals.onTappedRunning;
                      Navigator.pop(context);
                    });
                  },
                  child: globals.onTappedRunning
                      ? ListTile(
                          //contentPadding: EdgeInsets.fromLTRB(10, 8, 8, 8),
                          title: Text(
                            'Running',
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
                            'Running',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(150, 68, 31, 1),
                            ),
                          ),
                        ),
                ),
                Divider(
                  height: 0,
                  thickness: 2,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      globals.onTappedSwimming = !globals.onTappedSwimming;
                      Navigator.pop(context);
                    });
                  },
                  child: globals.onTappedSwimming
                      ? ListTile(
                          //contentPadding: EdgeInsets.fromLTRB(10, 8, 8, 8),
                          title: Text(
                            'Swimming',
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
                            'Swimming',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(150, 68, 31, 1),
                            ),
                          ),
                        ),
                ),
                Divider(
                  height: 0,
                  thickness: 2,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      globals.onTappedYoga = !globals.onTappedYoga;
                      Navigator.pop(context);
                    });
                  },
                  child: globals.onTappedYoga
                      ? ListTile(
                          //contentPadding: EdgeInsets.fromLTRB(10, 8, 8, 8),
                          title: Text(
                            'Yoga',
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
                            'Yoga',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(150, 68, 31, 1),
                            ),
                          ),
                        ),
                ),
                Divider(
                  height: 0,
                  thickness: 2,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      globals.onTappedCycling = !globals.onTappedCycling;
                      Navigator.pop(context);
                    });
                  },
                  child: globals.onTappedCycling
                      ? ListTile(
                          //contentPadding: EdgeInsets.fromLTRB(10, 8, 8, 8),
                          title: Text(
                            'Cycling',
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
                            'Cycling',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(150, 68, 31, 1),
                            ),
                          ),
                        ),
                ),
                Divider(
                  height: 0,
                  thickness: 2,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      globals.onTappedGym = !globals.onTappedGym;
                      Navigator.pop(context);
                    });
                  },
                  child: globals.onTappedGym
                      ? ListTile(
                          //contentPadding: EdgeInsets.fromLTRB(10, 8, 8, 8),
                          title: Text(
                            'Gym',
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
                            'Gym',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(150, 68, 31, 1),
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
          );
        });
  }

  final bool isActive = false;

  final int index = 0;

  var sc;

  Widget cardcontent({String heading, String heading2, Widget child}) {
    return Material(
      child: Container(
        width: double.infinity,
        color: Color.fromRGBO(138, 93, 54, 1),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SwipeDetector(
                onSwipeRight: () {
                  setState(() {
                    lala2 = true;
                  });

                  print(lala2.toString());
                },
                child: Row(
                  children: [
                    Text.rich(
                      TextSpan(
                          text: heading,
                          style: TextStyle(color: Colors.white, fontSize: 21),
                          children: <InlineSpan>[
                            // TextSpan(
                            //   text: heading,
                            //   style: TextStyle(color: Colors.white, fontSize: 21),
                            // ),
                            TextSpan(
                              text: ' $heading2',
                              style: TextStyle(
                                  color: heading == 'Blood' &&
                                          Theme.of(context).brightness ==
                                              Brightness.dark
                                      ? Color.fromRGBO(208, 2, 27, 1)
                                      : heading == 'Vaginal' &&
                                              Theme.of(context).brightness ==
                                                  Brightness.dark
                                          ? Color.fromRGBO(74, 144, 226, 1)
                                          : Colors.white,
                                  fontSize: 21),
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 22.0),
              child ?? Container(),
              SizedBox(height: 22.0),
            ],
          ),
        ),
      ),
    );
  }

  List<UniqueCard> previousHideCards = [];
  // function to divide bottom half of screen among every card equally
  List<Widget> _bottomCardsList(
      {@required double maxHeight,
      @required List<UniqueCard> cards,
      List<String> hideCards = const []}) {
    // print('In bottomcards. hide cards: $hideCards');

    if (hideCards.isNotEmpty) {
      hideCards.forEach((cardToHide) {
        cards.removeWhere((card) => card.heading == cardToHide);
      });
    }

    int cardNumber = 0;
    double dividedHeight = maxHeight / cards.length;
    double height = dividedHeight;
    List<BottomCard> bottomCardsList = [];

    cards.forEach((card) {
      cardNumber += 1;
      // print('${card.heading} ${card.content}');
      bottomCardsList.add(
        BottomCard(
          type: card.type,
          height: height,
          maxDragHeight: card.maxDragHeight.toDouble(),
          child: cardcontent(
            heading: card.heading,
            heading2: card.heading2,
            child: card.content,
          ),
          hasBorder: cardNumber != cards.length,
          col: Theme.of(context).brightness == Brightness.light
              ? Colors.white
              : card.type == CardType.BloodFlow
                  ? Color.fromRGBO(208, 2, 27, 1)
                  : card.type == CardType.Discharge
                      ? Color.fromRGBO(74, 144, 226, 1)
                      : card.type == CardType.Tests
                          ? Color.fromRGBO(189, 16, 224, 1)
                          : card.type == CardType.Notes
                              ? Color.fromRGBO(245, 166, 35, 1)
                              : card.type == CardType.Pills
                                  ? Color.fromRGBO(80, 227, 194, 1)
                                  : Colors.black,
        ),
      );
      height += dividedHeight;
      // print(height);
    });

    bottomCardsList = bottomCardsList.reversed.toList();
    //bottomCardsList.add(BottomNavbar(currentIndex: 3,));
    return bottomCardsList;
  }

  List<String> hideCardsList = [];
  void _onHorizontalDragStartHandler(DragStartDetails details) {
    setState(() {
      globals.lala = true;
    });
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => mp.MyHomePage()),
    // );
  }

  Widget _body() {
    String formatDate(DateTime date) => new DateFormat("d").format(date);
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
    return MonthlyCalendar(
//      minDate: DateTime.now().subtract(Duration(days: date)),
//      maxDate: DateTime.now().add(Duration(days: daysInMonth)),
      minDate: DateTime(widget.year, widget.month, 1),
      maxDate: DateTime(widget.year, widget.month, daysInMonth),
      month: widget.month,
      year: widget.year,
    );
  }

  bool abcd;
  List<Widget> lp;
  void initState() {
    super.initState();
    // , SecondScreen()
    //lp = [FirstScreen(widget.month, widget.year)];
  }

  @override
  void didUpdateWidget(MonthlyView oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.valu != widget.valu) {
      abcd = widget.valu;
      //_months = dp.DateUtils2.extractWeeks(widget.minDate, widget.maxDate);
      // _minDate = widget.minDate.removeTime();
      // _maxDate = widget.maxDate.removeTime();

    }
    // setState(() {
    //   if (gb.lop[gb.pq] == null) {
    //     gb.lop[gb.pq] = false;
    //   }
    // });
  }

  // bool value = false;

  // final bool isActive = false;

  // final int index = 0;

  // var sc;

  @override
  Widget build(BuildContext context) {
    String formatDate(DateTime date) => new DateFormat("d").format(date);
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
<<<<<<< HEAD
    double height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final cardp = Provider.of<CardProvider>(context);

    height = height / 2 +
        (cardp.openedCardIndex == -1 ? 0 : height / 6) -
        kBottomNavigationBarHeight;

    print(height);
    return Scaffold(
      body: Stack(
        children: [
          SwipeDetector(
            child: MonthlyCalendar(
              minDate: DateTime(widget.year, widget.month, 1),
              maxDate: DateTime(
                  widget.year,
                  widget.month,
                  DateTime(widget.year, widget.month,
                                  daysPerMonth(widget.year)[widget.month - 1])
                              .weekday ==
                          7
                      // ||DateTime(widget.year, widget.month,
                      //         daysPerMonth(widget.year)[widget.month - 1]).subtract(Duration(days:2))
                      //     .weekday ==
                      // 7
                      ? daysInMonth + 1
                      : daysInMonth),
              month: widget.month,
              year: widget.year,
            ),
            onSwipeRight: () {
              setState(() {
                lala2 = true;
              });
            },
            onSwipeLeft: () {
              setState(() {
                lala2 = false;
              });
            },
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedContainer(
              duration: kDuration,
              height: height,
              child: OverflowBox(
                maxWidth: width,
                child: PageView(
                  children: [
                    PageOne(),
                    PageTwo(),
                  ],
                ),
              ),
            ),
          ),
          //         //SecondScreen(),
          //SecondScreen(),
          // Positioned(
          //   bottom: 1,
          //   left: 0,
          //   right: 0,
          //   child: BottomNavbar(
          //     currentIndex: 3,
          //   ),
          // ),
        ],
      ),
      bottomNavigationBar: Container(
          height: kBottomNavigationBarHeight,
          child: BottomNavigationBar(
            elevation: 0,
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.black,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.circle),
                label: "Element",
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.lightbulb), label: "Element"),
              BottomNavigationBarItem(icon: Icon(Icons.mail), label: "Element"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.import_contacts), label: "Element"),
              BottomNavigationBarItem(
                  backgroundColor: Colors.orange,
                  icon: Icon(Icons.square_foot),
                  label: "Element"),
            ],
          )),
    );
  }
}



// Old code

// lala2 == true
        //     ? SlidingUpPanel(
        //         //body: _body(),
        //         isDraggable: true,
        //         color: Colors.transparent,
        //         boxShadow: null,
        //         maxHeight: MediaQuery.of(context).size.height,
        //         minHeight:
        //             // DateTime(widget.year, widget.month,
        //             //                     daysPerMonth(widget.year)[widget.month - 1])
        //             //                 .weekday ==
        //             //             7
        //             //             ||
        //             ((DateTime(widget.year, widget.month, 1).weekday == 5 ||
        //                         DateTime(widget.year, widget.month, 1)
        //                                 .weekday ==
        //                             6) &&
        //                     (DateTime(
        //                                     widget.year,
        //                                     widget.month,
        //                                     daysPerMonth(
        //                                         widget.year)[widget.month - 1])
        //                                 .weekday ==
        //                             1 ||
        //                         DateTime(
        //                                     widget.year,
        //                                     widget.month,
        //                                     daysPerMonth(
        //                                         widget.year)[widget.month - 1])
        //                                 .weekday ==
        //                             7))
        //                 ? MediaQuery.of(context).size.height / 2.09 + 24
        //                 : MediaQuery.of(context).size.height / 2 + 24,
        //         parallaxEnabled: false,
        //         parallaxOffset: 1,
        //         panelBuilder: (sc) {
        //           final controller = PageController(
        //             keepPage: false,
        //             initialPage: 0,
        //           );
        //           return MediaQuery.removeViewInsets(
        //             removeBottom: true,
        //             context: context,
        //             removeTop: true,
        //             child:
        //                 // Swiper(
        //                 //   itemBuilder: (BuildContext context, int index) {
        //                 //     return FirstScreen(widget.month, widget.year);
        //                 //     // Image.network("http://via.placeholder.com/350x150",fit: BoxFit.fill,);
        //                 //   },
        //                 //   itemCount: 1,
        //                 //   pagination: new SwiperPagination(),
        //                 //   control: new SwiperControl(),
        //                 // ),
        //                 //lp
        //                 //Swiper(child: FirstScreen(widget.month, widget.year)),
        //                 PageView(
        //               scrollDirection: Axis.horizontal,
        //               pageSnapping: true,
        //               controller: controller,
        //               children: [
        //                 Container(
        //                   decoration: BoxDecoration(
        //                     shape: BoxShape.rectangle,
        //                     borderRadius: BorderRadius.only(
        //                       topLeft: Radius.circular(18.0),
        //                       topRight: Radius.circular(18.0),
        //                     ),
        //                   ),
        //                   child: Container(
        //                     height: MediaQuery.of(context).size.height / 2.5,
        //                     decoration: BoxDecoration(
        //                       borderRadius: BorderRadius.only(
        //                           //  topLeft: Radius.circular(24.0),
        //                           //  topRight: Radius.circular(24.0),
        //                           ),
        //                     ),
        //                     //change heres
        //                     child: Scaffold(
        //                       backgroundColor: Colors.transparent,
        //                       body: Container(
        //                         decoration: BoxDecoration(
        //                           color: Color.fromRGBO(138, 93, 54, 1),
        //                           //Colors.brown,
        //                           borderRadius: BorderRadius.only(
        //                             topLeft: Radius.circular(30.0),
        //                             topRight: Radius.circular(30.0),
        //                           ),
        //                         ),
        //                         child: ListView(
        //                           controller: sc,
        //                           children: <Widget>[
        //                             Padding(
        //                               padding: const EdgeInsets.only(top: 0),
        //                               child: Row(
        //                                 mainAxisAlignment:
        //                                     MainAxisAlignment.start,
        //                                 children: <Widget>[
        //                                   Container(
        //                                     height: MediaQuery.of(context)
        //                                             .size
        //                                             .height *
        //                                         .15,
        //                                     width: MediaQuery.of(context)
        //                                             .size
        //                                             .width *
        //                                         .75,
        //                                     child: Text(
        //                                       "\n Hello Friend, How was today?\n Was there any sort of trouble\n you faced today with this....",
        //                                       style: TextStyle(
        //                                         color: Colors.white,
        //                                         fontSize: 20.0,
        //                                         fontWeight: FontWeight.w400,
        //                                       ),
        //                                       textAlign: TextAlign.center,
        //                                     ),
        //                                   ),
        //                                   Container(
        //                                     width: MediaQuery.of(context)
        //                                             .size
        //                                             .width *
        //                                         .25,
        //                                     child: Column(
        //                                       children: [
        //                                         SizedBox(
        //                                           height: 20,
        //                                         ),
        //                                         Transform.rotate(
        //                                           angle: -3.14 / 2,
        //                                           child: Transform.scale(
        //                                             scale: 1,
        //                                             child: CupertinoSwitch(
        //                                               activeColor:
        //                                                   Color.fromRGBO(
        //                                                       176, 17, 17, 1),
        //                                               trackColor:
        //                                                   Color.fromRGBO(
        //                                                       176, 17, 17, 1),
        //                                               // inactiveThumbColor: Colors.white,
        //                                               // inactiveTrackColor: Colors.white,
        //                                               //activeColor: Colors.white,
        //                                               // materialTapTargetSize
        //                                               //     MaterialTapTargetSize.padded,
        //                                               value:
        //                                                   // widget.valu == null
        //                                                   //     ? value
        //                                                   //     : abcd,
        //                                                   globals.lop[globals
        //                                                               .pq] ==
        //                                                           null
        //                                                       ? value
        //                                                       : globals.lop[
        //                                                           globals.pq],
        //                                               onChanged: (v) =>
        //                                                   setState(() {
        //                                                 globals.lop[
        //                                                     globals
        //                                                         .pq] = !globals
        //                                                     .lop[globals.pq];
        //                                                 value = v;
        //                                                 //                                   Timer(
        //                                                 //   Duration(seconds: 2),
        //                                                 //   ()  {

        //                                                 //   },
        //                                                 // );
        //                                               }),
        //                                             ),
        //                                           ),
        //                                         ),
        //                                         SizedBox(
        //                                           height: 10,
        //                                         ),
        //                                         globals.lop[globals.pq] ==
        //                                                     false ||
        //                                                 globals.lop[
        //                                                         globals.pq] ==
        //                                                     null
        //                                             ? Text(
        //                                                 '\t\t\tLOG\n\tPeriod',
        //                                                 style: TextStyle(
        //                                                   color: Colors.white,
        //                                                   fontWeight:
        //                                                       FontWeight.w400,
        //                                                   fontSize: 14,
        //                                                 ),
        //                                               )
        //                                             : Text(
        //                                                 '\t\tCancel\n\tPeriod',
        //                                                 textAlign:
        //                                                     TextAlign.center,
        //                                                 style: TextStyle(
        //                                                   color: Colors.white,
        //                                                   fontWeight:
        //                                                       FontWeight.w400,
        //                                                   fontSize: 14,
        //                                                 ),
        //                                               ),
        //                                       ],
        //                                     ),
        //                                   ),
        //                                 ],
        //                               ),
        //                             ),
        //                             Padding(
        //                               padding: const EdgeInsets.only(
        //                                 left: 17,
        //                               ),
        //                               child: Stack(
        //                                 children: <Widget>[
        //                                   Positioned(
        //                                     child: Container(
        //                                       width: 40.0,
        //                                       height: 40.0,
        //                                       margin: EdgeInsets.symmetric(
        //                                         horizontal: 2.0,
        //                                       ),
        //                                       decoration: BoxDecoration(
        //                                         shape: BoxShape.circle,
        //                                         image: DecorationImage(
        //                                           fit: BoxFit.cover,
        //                                           image: AssetImage(
        //                                               'assets/images/user1.jpg'),
        //                                         ),
        //                                       ),
        //                                     ),
        //                                   ),
        //                                   new Positioned(
        //                                     left: 30.0,
        //                                     child: Container(
        //                                       width: 40.0,
        //                                       height: 40.0,
        //                                       margin: EdgeInsets.symmetric(
        //                                         horizontal: 2.0,
        //                                       ),
        //                                       decoration: BoxDecoration(
        //                                         shape: BoxShape.circle,
        //                                         image: DecorationImage(
        //                                           fit: BoxFit.cover,
        //                                           image: AssetImage(
        //                                               'assets/images/user0.jpg'),
        //                                         ),
        //                                       ),
        //                                     ),
        //                                   ),
        //                                   new Positioned(
        //                                     left: 60.0,
        //                                     child: Container(
        //                                       width: 40.0,
        //                                       height: 40.0,
        //                                       margin: EdgeInsets.symmetric(
        //                                         horizontal: 2.0,
        //                                       ),
        //                                       decoration: BoxDecoration(
        //                                         shape: BoxShape.circle,
        //                                         image: DecorationImage(
        //                                           fit: BoxFit.cover,
        //                                           image: AssetImage(
        //                                               'assets/images/user1.jpg'),
        //                                         ),
        //                                       ),
        //                                     ),
        //                                   ),
        //                                   new Positioned(
        //                                     left: 90.0,
        //                                     child: Container(
        //                                       width: 40.0,
        //                                       height: 40.0,
        //                                       margin: EdgeInsets.symmetric(
        //                                         horizontal: 2.0,
        //                                       ),
        //                                       decoration: BoxDecoration(
        //                                         shape: BoxShape.circle,
        //                                         image: DecorationImage(
        //                                           fit: BoxFit.cover,
        //                                           image: AssetImage(
        //                                               'assets/images/user0.jpg'),
        //                                         ),
        //                                       ),
        //                                     ),
        //                                   ),
        //                                   new Positioned(
        //                                     left: 120.0,
        //                                     child: Container(
        //                                       width: 40.0,
        //                                       height: 40.0,
        //                                       margin: EdgeInsets.symmetric(
        //                                         horizontal: 2.0,
        //                                       ),
        //                                       decoration: BoxDecoration(
        //                                         shape: BoxShape.circle,
        //                                         image: DecorationImage(
        //                                           fit: BoxFit.cover,
        //                                           image: AssetImage(
        //                                               'assets/images/user1.jpg'),
        //                                         ),
        //                                       ),
        //                                     ),
        //                                   ),
        //                                   new Positioned(
        //                                     left: 150.0,
        //                                     child: Container(
        //                                       width: 40.0,
        //                                       height: 40.0,
        //                                       margin: EdgeInsets.symmetric(
        //                                         horizontal: 2.0,
        //                                       ),
        //                                       decoration: BoxDecoration(
        //                                         shape: BoxShape.circle,
        //                                         image: DecorationImage(
        //                                           fit: BoxFit.cover,
        //                                           image: AssetImage(
        //                                               'assets/images/user0.jpg'),
        //                                         ),
        //                                       ),
        //                                     ),
        //                                   ),
        //                                 ],
        //                               ),
        //                             ),
        //                             SizedBox(
        //                               height: 30.0,
        //                             ),
        //                             Center(
        //                               child: SingleChildScrollView(
        //                                 scrollDirection: Axis.horizontal,
        //                                 child: Row(
        //                                   crossAxisAlignment:
        //                                       CrossAxisAlignment.center,
        //                                   mainAxisAlignment:
        //                                       MainAxisAlignment.center,
        //                                   children: [
        //                                     globals.onTappedSteps
        //                                         ? Column(
        //                                             children: [
        //                                               Container(
        //                                                 alignment:
        //                                                     Alignment.center,
        //                                                 padding:
        //                                                     const EdgeInsets
        //                                                         .only(
        //                                                   left: 12.0,
        //                                                   right: 12.0,
        //                                                 ),
        //                                                 child: Icon(
        //                                                   Icons.directions_walk,
        //                                                   color: Colors.white,
        //                                                   size: 30,
        //                                                 ),
        //                                               ),
        //                                               SizedBox(
        //                                                 height: 5,
        //                                               ),
        //                                               Text(
        //                                                 '\t252\nSteps',
        //                                                 style: TextStyle(
        //                                                   color: Colors.white,
        //                                                 ),
        //                                               ),
        //                                             ],
        //                                           )
        //                                         : SizedBox(
        //                                             width: 0,
        //                                           ),
        //                                     globals.onTappedRunning
        //                                         ? Column(
        //                                             children: [
        //                                               Container(
        //                                                 padding:
        //                                                     const EdgeInsets
        //                                                         .only(
        //                                                   left: 12.0,
        //                                                   right: 12.0,
        //                                                 ),
        //                                                 child: Icon(
        //                                                   Icons.directions_run,
        //                                                   color: Colors.white,
        //                                                   size: 30,
        //                                                 ),
        //                                               ),
        //                                               SizedBox(
        //                                                 height: 5,
        //                                               ),
        //                                               Text(
        //                                                 'Run',
        //                                                 style: TextStyle(
        //                                                   color: Colors.white,
        //                                                 ),
        //                                               ),
        //                                             ],
        //                                           )
        //                                         : SizedBox(
        //                                             width: 0,
        //                                           ),
        //                                     globals.onTappedSwimming
        //                                         ? Column(
        //                                             children: [
        //                                               Container(
        //                                                 padding:
        //                                                     const EdgeInsets
        //                                                         .only(
        //                                                   left: 12.0,
        //                                                   right: 12.0,
        //                                                 ),
        //                                                 child: Icon(
        //                                                   Icons.wallpaper,
        //                                                   color: Colors.white,
        //                                                   size: 30,
        //                                                 ),
        //                                               ),
        //                                               SizedBox(
        //                                                 height: 5,
        //                                               ),
        //                                               Text(
        //                                                 'Swim',
        //                                                 style: TextStyle(
        //                                                   color: Colors.white,
        //                                                 ),
        //                                               ),
        //                                             ],
        //                                           )
        //                                         : SizedBox(
        //                                             width: 0,
        //                                           ),
        //                                     globals.onTappedYoga
        //                                         ? Column(
        //                                             children: [
        //                                               Container(
        //                                                 padding:
        //                                                     const EdgeInsets
        //                                                         .only(
        //                                                   left: 12.0,
        //                                                   right: 12.0,
        //                                                 ),
        //                                                 child: Icon(
        //                                                   Icons
        //                                                       .accessibility_new,
        //                                                   color: Colors.white,
        //                                                   size: 30,
        //                                                 ),
        //                                               ),
        //                                               SizedBox(
        //                                                 height: 5,
        //                                               ),
        //                                               Text(
        //                                                 'Yoga',
        //                                                 style: TextStyle(
        //                                                   color: Colors.white,
        //                                                 ),
        //                                               ),
        //                                             ],
        //                                           )
        //                                         : SizedBox(
        //                                             width: 0,
        //                                           ),
        //                                     globals.onTappedCycling
        //                                         ? Column(
        //                                             children: [
        //                                               Container(
        //                                                 padding:
        //                                                     const EdgeInsets
        //                                                         .only(
        //                                                   left: 12.0,
        //                                                   right: 12.0,
        //                                                 ),
        //                                                 child: Icon(
        //                                                   Icons.directions_bike,
        //                                                   color: Colors.white,
        //                                                   size: 30,
        //                                                 ),
        //                                               ),
        //                                               SizedBox(
        //                                                 height: 5,
        //                                               ),
        //                                               Text(
        //                                                 'Cycling',
        //                                                 style: TextStyle(
        //                                                   color: Colors.white,
        //                                                 ),
        //                                               ),
        //                                             ],
        //                                           )
        //                                         : SizedBox(
        //                                             width: 0,
        //                                           ),
        //                                     globals.onTappedGym
        //                                         ? Column(
        //                                             children: [
        //                                               Container(
        //                                                 padding:
        //                                                     const EdgeInsets
        //                                                         .only(
        //                                                   left: 12.0,
        //                                                   right: 12.0,
        //                                                 ),
        //                                                 child: Icon(
        //                                                   Icons.donut_small,
        //                                                   color: Colors.white,
        //                                                   size: 30,
        //                                                 ),
        //                                               ),
        //                                               SizedBox(
        //                                                 height: 5,
        //                                               ),
        //                                               Text(
        //                                                 'Gym',
        //                                                 style: TextStyle(
        //                                                   color: Colors.white,
        //                                                 ),
        //                                               ),
        //                                             ],
        //                                           )
        //                                         : SizedBox(
        //                                             width: 0,
        //                                           ),
        //                                     GestureDetector(
        //                                       onTap: () {
        //                                         sheet();
        //                                         //here
        //                                         // Navigator.push(
        //                                         //   context,
        //                                         //   MaterialPageRoute(
        //                                         //       builder: (context) =>
        //                                         //           AddMore(widget.month, widget.year)),
        //                                         // );
        //                                       },
        //                                       child: Container(
        //                                         padding: const EdgeInsets.only(
        //                                           left: 12.0,
        //                                           right: 12.0,
        //                                         ),
        //                                         child: Icon(
        //                                           Icons.add,
        //                                           color: Colors.white,
        //                                           size: 30,
        //                                         ),
        //                                       ),
        //                                     ),
        //                                   ],
        //                                 ),
        //                               ),
        //                             ),
        //                             SizedBox(
        //                               height: 40,
        //                             ),
        //                             Row(
        //                               mainAxisAlignment:
        //                                   MainAxisAlignment.center,
        //                               children: [
        //                                 Container(
        //                                   width: 10.0,
        //                                   height: 10.0,
        //                                   margin: EdgeInsets.symmetric(
        //                                       vertical: 10.0, horizontal: 2.0),
        //                                   decoration: BoxDecoration(
        //                                     shape: BoxShape.circle,
        //                                     color: Colors.white,
        //                                   ),
        //                                 ),
        //                                 SizedBox(
        //                                   width: 4,
        //                                 ),
        //                                 Container(
        //                                   width: 10.0,
        //                                   height: 10.0,
        //                                   margin: EdgeInsets.symmetric(
        //                                       vertical: 10.0, horizontal: 2.0),
        //                                   decoration: BoxDecoration(
        //                                       shape: BoxShape.circle,
        //                                       border: Border.all(
        //                                           color: Colors.white)),
        //                                 ),
        //                               ],
        //                             ),
        //                             settings_globals.sw == true
        //                                 ? InkWell(
        //                                     onTap: () {
        //                                       print('Inside Inimacy');
        //                                       print('${globals.pq}');
        //                                       globals.li[globals.pq].addAll({
        //                                         'intimacy':
        //                                             globals.icons['intimacy']
        //                                       });
        //                                       print('Done');
        //                                       print(
        //                                           '${globals.li[globals.pq]['intimacy']}');
        //                                     },
        //                                     child: Container(
        //                                       height: 60,
        //                                       padding: EdgeInsets.only(
        //                                           left: 21.0,
        //                                           //right: 30.0,
        //                                           top: 14.0),
        //                                       width: MediaQuery.of(context)
        //                                           .size
        //                                           .width,
        //                                       decoration: BoxDecoration(
        //                                         borderRadius: BorderRadius.only(
        //                                           topLeft: Radius.circular(24),
        //                                           topRight: Radius.circular(24),
        //                                         ),
        //                                         color: Color.fromRGBO(
        //                                             138, 93, 54, 1),
        //                                         border: Border.all(
        //                                             color: Colors.white),
        //                                       ),
        //                                       child: Text('Intimacy',
        //                                           style: TextStyle(
        //                                               fontSize: 20,
        //                                               fontWeight:
        //                                                   FontWeight.w400,
        //                                               color: Colors.white)),
        //                                       // BottomCard(
        //                                       //   //type: card.type,
        //                                       //   height: 60,
        //                                       //   maxDragHeight: 0,
        //                                       //   //card.maxDragHeight.toDouble(),
        //                                       //   child: cardcontent(
        //                                       //     heading: 'Intimacy',
        //                                       //     heading2: 'card.heading2',
        //                                       //     child: SizedBox(),
        //                                       //   ),
        //                                       //   hasBorder: true,
        //                                       //   col: Theme.of(context)
        //                                       //               .brightness ==
        //                                       //           Brightness.light
        //                                       //       ? Colors.white
        //                                       //       : Color.fromRGBO(
        //                                       //           208, 2, 27, 1),
        //                                       // ),
        //                                     ),
        //                                   )
        //                                 : SizedBox(),
        //                           ],
        //                         ),
        //                       ),
        //                     ),
        //                   ),
        //                 ),
        //                 GestureDetector(
        //                   // onHorizontalDragStart: _onHorizontalDragStartHandler,
        //                   onDoubleTap: () {
        //                     setState(() {
        //                       hideCardsList.isEmpty
        //                           ? hideCardsList.add('Tests')
        //                           : hideCardsList.clear();
        //                       print(hideCardsList);
        //                     });
        //                   },
        //                   child: ChangeNotifierProvider<HeightTracker>(
        //                     create: (_) => HeightTracker(),
        //                     child: Padding(
        //                       padding: const EdgeInsets.only(bottom: 50),
        //                       child: Stack(
        //                         // define the cards
        //                         children: _bottomCardsList(
        //                             maxHeight:
        //                                 (MediaQuery.of(context).size.height /
        //                                         2) -
        //                                     20,
        //                             hideCards: hideCardsList,
        //                             cards: [
        //                               UniqueCard(
        //                                 heading: 'Pills',
        //                                 heading2: '',
        //                                 type: CardType.Pills,
        //                                 content: Pills(),
        //                                 maxDragHeight: 150.0,
        //                               ),
        //                               UniqueCard(
        //                                 heading: 'Notes',
        //                                 heading2: '',
        //                                 type: CardType.Notes,
        //                                 content: Notes(),
        //                                 maxDragHeight: 200.0,
        //                               ),
        //                               UniqueCard(
        //                                 heading: 'Tests',
        //                                 heading2: '',
        //                                 type: CardType.Tests,
        //                                 content: Tests(),
        //                                 maxDragHeight: 100.0,
        //                               ),
        //                               UniqueCard(
        //                                 heading: 'Vaginal',
        //                                 heading2: 'Discharge',
        //                                 type: CardType.Discharge,
        //                                 content: null,
        //                                 maxDragHeight: 150.0,
        //                               ),
        //                               UniqueCard(
        //                                 heading: 'Blood',
        //                                 heading2: 'Flow',
        //                                 type: CardType.BloodFlow,
        //                                 content: Transform.translate(
        //                                   child: BloodFlow(),
        //                                   offset: Offset(0, 10),
        //                                 ),
        //                                 maxDragHeight: 255.0,
        //                               ),
        //                             ]),
        //                       ),
        //                     ),
        //                   ),
        //                 ),
        //                 //FirstScreen(widget.month, widget.year)),
        //               ],
        //             ),
        //           );
        //         },
        //         borderRadius: BorderRadius.only(
        //             topLeft: Radius.circular(24.0),
        //             topRight: Radius.circular(24.0)),
        //       )
        //     : Container(),
=======

    return Stack(
      children: [
        SwipeDetector(
          child: MonthlyCalendar(
            minDate: DateTime(widget.year, widget.month, 1),
            maxDate: DateTime(
                widget.year,
                widget.month,
                DateTime(widget.year, widget.month,
                                daysPerMonth(widget.year)[widget.month - 1])
                            .weekday ==
                        7
                    // ||DateTime(widget.year, widget.month,
                    //         daysPerMonth(widget.year)[widget.month - 1]).subtract(Duration(days:2))
                    //     .weekday ==
                    // 7
                    ? daysInMonth + 1
                    : daysInMonth),
            month: widget.month,
            year: widget.year,
          ),
          onSwipeRight: () {
            setState(() {
              lala2 = true;
            });
          },
          onSwipeLeft: () {
            setState(() {
              lala2 = false;
            });
          },
        ),
        lala2 == true
            ? SlidingUpPanel(
                //body: _body(),
                isDraggable: true,
                color: Colors.transparent,
                boxShadow: null,
                maxHeight: MediaQuery.of(context).size.height,
                minHeight:
                    // DateTime(widget.year, widget.month,
                    //                     daysPerMonth(widget.year)[widget.month - 1])
                    //                 .weekday ==
                    //             7
                    //             ||
                    ((DateTime(widget.year, widget.month, 1).weekday == 5 ||
                                DateTime(widget.year, widget.month, 1)
                                        .weekday ==
                                    6) &&
                            (DateTime(
                                            widget.year,
                                            widget.month,
                                            daysPerMonth(
                                                widget.year)[widget.month - 1])
                                        .weekday ==
                                    1 ||
                                DateTime(
                                            widget.year,
                                            widget.month,
                                            daysPerMonth(
                                                widget.year)[widget.month - 1])
                                        .weekday ==
                                    7))
                        ? MediaQuery.of(context).size.height / 2.09 + 24
                        : MediaQuery.of(context).size.height / 2 + 24,
                parallaxEnabled: false,
                parallaxOffset: 1,
                panelBuilder: (sc) {
                  final controller = PageController(
                    keepPage: false,
                    initialPage: 0,
                  );
                  return MediaQuery.removeViewInsets(
                    removeBottom: true,
                    context: context,
                    removeTop: true,
                    child:
                        // Swiper(
                        //   itemBuilder: (BuildContext context, int index) {
                        //     return FirstScreen(widget.month, widget.year);
                        //     // Image.network("http://via.placeholder.com/350x150",fit: BoxFit.fill,);
                        //   },
                        //   itemCount: 1,
                        //   pagination: new SwiperPagination(),
                        //   control: new SwiperControl(),
                        // ),
                        //lp
                        //Swiper(child: FirstScreen(widget.month, widget.year)),
                        PageView(
                      scrollDirection: Axis.horizontal,
                      controller: controller,
                      children: [
                        SwipeDetector(
                          onSwipeLeft: () {
                            setState(() {
                              lala2 = false;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(18.0),
                                topRight: Radius.circular(18.0),
                              ),
                            ),
                            child: Container(
                              height: MediaQuery.of(context).size.height / 2.5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    //  topLeft: Radius.circular(24.0),
                                    //  topRight: Radius.circular(24.0),
                                    ),
                              ),
                              //change heres
                              child: Scaffold(
                                backgroundColor: Colors.transparent,
                                body: Container(
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(138, 93, 54, 1),
                                    //Colors.brown,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30.0),
                                      topRight: Radius.circular(30.0),
                                    ),
                                  ),
                                  child: ListView(
                                    controller: sc,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(top: 0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .15,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .75,
                                              child: Text(
                                                "\n Hello Friend, How was today?\n Was there any sort of trouble\n you faced today with this....",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .25,
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Transform.rotate(
                                                    angle: -3.14 / 2,
                                                    child: Transform.scale(
                                                      scale: 1,
                                                      child: CupertinoSwitch(
                                                        activeColor:
                                                            Color.fromRGBO(
                                                                176, 17, 17, 1),
                                                        trackColor:
                                                            Color.fromRGBO(
                                                                176, 17, 17, 1),
                                                        // inactiveThumbColor: Colors.white,
                                                        // inactiveTrackColor: Colors.white,
                                                        //activeColor: Colors.white,
                                                        // materialTapTargetSize
                                                        //     MaterialTapTargetSize.padded,
                                                        value:
                                                            // widget.valu == null
                                                            //     ? value
                                                            //     : abcd,
                                                            globals.lop[globals
                                                                        .pq] ==
                                                                    null
                                                                ? value
                                                                : globals.lop[
                                                                    globals.pq],
                                                        onChanged: (v) =>
                                                            setState(() {
                                                          globals.lop[
                                                                  globals.pq] =
                                                              !globals.lop[
                                                                  globals.pq];
                                                          value = v;
                                                          //                                   Timer(
                                                          //   Duration(seconds: 2),
                                                          //   ()  {

                                                          //   },
                                                          // );
                                                        }),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  globals.lop[globals.pq] ==
                                                              false ||
                                                          globals.lop[
                                                                  globals.pq] ==
                                                              null
                                                      ? Text(
                                                          '\t\t\tLOG\n\tPeriod',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 14,
                                                          ),
                                                        )
                                                      : Text(
                                                          '\t\tCancel\n\tPeriod',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 17,
                                        ),
                                        child: Stack(
                                          children: <Widget>[
                                            Positioned(
                                              child: Container(
                                                width: 40.0,
                                                height: 40.0,
                                                margin: EdgeInsets.symmetric(
                                                  horizontal: 2.0,
                                                ),
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: AssetImage(
                                                        'assets/images/user1.jpg'),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            new Positioned(
                                              left: 30.0,
                                              child: Container(
                                                width: 40.0,
                                                height: 40.0,
                                                margin: EdgeInsets.symmetric(
                                                  horizontal: 2.0,
                                                ),
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: AssetImage(
                                                        'assets/images/user0.jpg'),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            new Positioned(
                                              left: 60.0,
                                              child: Container(
                                                width: 40.0,
                                                height: 40.0,
                                                margin: EdgeInsets.symmetric(
                                                  horizontal: 2.0,
                                                ),
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: AssetImage(
                                                        'assets/images/user1.jpg'),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            new Positioned(
                                              left: 90.0,
                                              child: Container(
                                                width: 40.0,
                                                height: 40.0,
                                                margin: EdgeInsets.symmetric(
                                                  horizontal: 2.0,
                                                ),
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: AssetImage(
                                                        'assets/images/user0.jpg'),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            new Positioned(
                                              left: 120.0,
                                              child: Container(
                                                width: 40.0,
                                                height: 40.0,
                                                margin: EdgeInsets.symmetric(
                                                  horizontal: 2.0,
                                                ),
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: AssetImage(
                                                        'assets/images/user1.jpg'),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            new Positioned(
                                              left: 150.0,
                                              child: Container(
                                                width: 40.0,
                                                height: 40.0,
                                                margin: EdgeInsets.symmetric(
                                                  horizontal: 2.0,
                                                ),
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: AssetImage(
                                                        'assets/images/user0.jpg'),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30.0,
                                      ),
                                      Center(
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              globals.onTappedSteps
                                                  ? Column(
                                                      children: [
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                            left: 12.0,
                                                            right: 12.0,
                                                          ),
                                                          child: Icon(
                                                            Icons
                                                                .directions_walk,
                                                            color: Colors.white,
                                                            size: 30,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          '\t252\nSteps',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  : SizedBox(
                                                      width: 0,
                                                    ),
                                              globals.onTappedRunning
                                                  ? Column(
                                                      children: [
                                                        Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                            left: 12.0,
                                                            right: 12.0,
                                                          ),
                                                          child: Icon(
                                                            Icons
                                                                .directions_run,
                                                            color: Colors.white,
                                                            size: 30,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          'Run',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  : SizedBox(
                                                      width: 0,
                                                    ),
                                              globals.onTappedSwimming
                                                  ? Column(
                                                      children: [
                                                        Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                            left: 12.0,
                                                            right: 12.0,
                                                          ),
                                                          child: Icon(
                                                            Icons.wallpaper,
                                                            color: Colors.white,
                                                            size: 30,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          'Swim',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  : SizedBox(
                                                      width: 0,
                                                    ),
                                              globals.onTappedYoga
                                                  ? Column(
                                                      children: [
                                                        Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                            left: 12.0,
                                                            right: 12.0,
                                                          ),
                                                          child: Icon(
                                                            Icons
                                                                .accessibility_new,
                                                            color: Colors.white,
                                                            size: 30,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          'Yoga',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  : SizedBox(
                                                      width: 0,
                                                    ),
                                              globals.onTappedCycling
                                                  ? Column(
                                                      children: [
                                                        Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                            left: 12.0,
                                                            right: 12.0,
                                                          ),
                                                          child: Icon(
                                                            Icons
                                                                .directions_bike,
                                                            color: Colors.white,
                                                            size: 30,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          'Cycling',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  : SizedBox(
                                                      width: 0,
                                                    ),
                                              globals.onTappedGym
                                                  ? Column(
                                                      children: [
                                                        Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                            left: 12.0,
                                                            right: 12.0,
                                                          ),
                                                          child: Icon(
                                                            Icons.donut_small,
                                                            color: Colors.white,
                                                            size: 30,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          'Gym',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  : SizedBox(
                                                      width: 0,
                                                    ),
                                              GestureDetector(
                                                onTap: () {
                                                  sheet();
                                                  //here
                                                  // Navigator.push(
                                                  //   context,
                                                  //   MaterialPageRoute(
                                                  //       builder: (context) =>
                                                  //           AddMore(widget.month, widget.year)),
                                                  // );
                                                },
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    left: 12.0,
                                                    right: 12.0,
                                                  ),
                                                  child: Icon(
                                                    Icons.add,
                                                    color: Colors.white,
                                                    size: 30,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 40,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 10.0,
                                            height: 10.0,
                                            margin: EdgeInsets.symmetric(
                                                vertical: 10.0,
                                                horizontal: 2.0),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Container(
                                            width: 10.0,
                                            height: 10.0,
                                            margin: EdgeInsets.symmetric(
                                                vertical: 10.0,
                                                horizontal: 2.0),
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    color: Colors.white)),
                                          ),
                                        ],
                                      ),
                                      settings_globals.sw == true
                                          ? InkWell(
                                              onTap: () {
                                                print('Inside Inimacy');
                                                print('${globals.pq}');
                                                globals.li[globals.pq].addAll({
                                                  'intimacy':
                                                      globals.icons['intimacy']
                                                });
                                                print('Done');
                                                print(
                                                    '${globals.li[globals.pq]['intimacy']}');
                                              },
                                              child: Container(
                                                height: 60,
                                                padding: EdgeInsets.only(
                                                    left: 21.0,
                                                    //right: 30.0,
                                                    top: 14.0),
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(24),
                                                    topRight:
                                                        Radius.circular(24),
                                                  ),
                                                  color: Color.fromRGBO(
                                                      138, 93, 54, 1),
                                                  border: Border.all(
                                                      color: Colors.white),
                                                ),
                                                child: Text('Intimacy',
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Colors.white)),
                                                // BottomCard(
                                                //   //type: card.type,
                                                //   height: 60,
                                                //   maxDragHeight: 0,
                                                //   //card.maxDragHeight.toDouble(),
                                                //   child: cardcontent(
                                                //     heading: 'Intimacy',
                                                //     heading2: 'card.heading2',
                                                //     child: SizedBox(),
                                                //   ),
                                                //   hasBorder: true,
                                                //   col: Theme.of(context)
                                                //               .brightness ==
                                                //           Brightness.light
                                                //       ? Colors.white
                                                //       : Color.fromRGBO(
                                                //           208, 2, 27, 1),
                                                // ),
                                              ),
                                            )
                                          : SizedBox(),
                                    ],
                                  ),
                                ),
                                
                              ),
                            ),
                          ),
                        ),
                        //FirstScreen(widget.month, widget.year)),
                      ],
                    ),
                  );
                },
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.0),
                    topRight: Radius.circular(24.0)),
              )
            : GestureDetector(
                onHorizontalDragStart: _onHorizontalDragStartHandler,
                onDoubleTap: () {
                  setState(() {
                    hideCardsList.isEmpty
                        ? hideCardsList.add('Tests')
                        : hideCardsList.clear();
                    print(hideCardsList);
                  });
                },
                child: ChangeNotifierProvider<HeightTracker>(
                  create: (_) => HeightTracker(),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: Stack(
                      // define the cards
                      children: _bottomCardsList(
                          maxHeight:
                              (MediaQuery.of(context).size.height / 2) - 20,
                          hideCards: hideCardsList,
                          cards: [
                            UniqueCard(
                              heading: 'Pills',
                              heading2: '',
                              type: CardType.Pills,
                              content: Pills(),
                              maxDragHeight: 150.0,
                            ),
                            UniqueCard(
                              heading: 'Notes',
                              heading2: '',
                              type: CardType.Notes,
                              content: Notes(),
                              maxDragHeight: 200.0,
                            ),
                            UniqueCard(
                              heading: 'Tests',
                              heading2: '',
                              type: CardType.Tests,
                              content: Tests(),
                              maxDragHeight: 100.0,
                            ),
                            UniqueCard(
                              heading: 'Vaginal',
                              heading2: 'Discharge',
                              type: CardType.Discharge,
                              content: null,
                              maxDragHeight: 150.0,
                            ),
                            UniqueCard(
                              heading: 'Blood',
                              heading2: 'Flow',
                              type: CardType.BloodFlow,
                              content: Transform.translate(
                                child: BloodFlow(),
                                offset: Offset(0, 10),
                              ),
                              maxDragHeight: 255.0,
                            ),
                          ]),
                    ),
                  ),
                ),
              ),
        //SecondScreen(),
        //SecondScreen(),
        // Positioned(
        //   bottom: 1,
        //   left: 0,
        //   right: 0,
        //   child: BottomNavbar(
        //     currentIndex: 3,
        //   ),
        // ),
      ],
    );
  }
}
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
