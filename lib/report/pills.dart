import 'dart:ui';

import 'package:flutter/material.dart';
import 'pillsreminder.dart';
import 'listItems.dart';
import 'daterange.dart';
import 'flowcontrol.dart';
import 'package:underline_indicator/underline_indicator.dart';

class PillsTab extends StatefulWidget {
  var contx;
  PillsTab(contx) {
    this.contx = contx;
  }

  @override
  _PillsTabState createState() => _PillsTabState(contx);
}

class _PillsTabState extends State<PillsTab>
    with SingleTickerProviderStateMixin {
  Color clr = Colors.black;
  final controller = PageController();
  var reminder = [
    ['Black Mamba', '5 days', '21-24Jan, 21'],
    ['Dur hoja sanam', '5 days', '21-24Jan, 21'],
    ['App late kar diye sanam', '5 days', '21-24Jan, 21'],
    ['Black Mamba', '4 days', '21-24Jan, 21'],
    ['Dur hoja sanam', '6 days', '21-24Jan, 21'],
    ['Black Mamba', '5 days', '21-24Jan, 21'],
    ['Dur hoja sanam', '7 days', '21-24Jan, 21'],
    ['Black Mamba', '5 days', '21-24Jan, 21'],
    ['Dur hoja sanam', '3 days', '21-24Jan, 21'],
    ['Black Mamba', '5 days', '21-24Jan, 21'],
    ['App late kar diye sanam', '5 days', '21-24Jan, 21'],
    ['Dur hoja sanam', '7 days', '21-24Jan, 21'],
    ['Black Mamba', '1 days', '21-24Jan, 21'],
    ['Dur hoja sanam', '5 days', '21-24Jan, 21'],
    ['Black Mamba', '5 days', '21-24Jan, 21'],
    ['Dur hoja sanam', '5 days', '21-24Jan, 21'],
  ];
  var moodlog = [
    ['Taken', '02 Fri,', 'Feb 21', '23:21'],
    ['Missed', '23 Wed,', 'Jan 21', '23:21'],
    ['Late', '13 Thur,', 'Apr 21', '23:21'],
    ['Double', '22 Sat,', 'Jan 20', '23:21'],
    ['Taken', '23 Sun,', 'Sept 21', '23:21'],
    ['Late', '23 Wed,', 'Jan 21', '23:21'],
    ['Taken', '02 Fri,', 'Feb 21', '23:21'],
    ['Missed', '23 Wed,', 'Jan 21', '23:21'],
    ['Late', '13 Thur,', 'Apr 21', '23:21'],
    ['Double', '22 Sat,', 'Jan 20', '23:21'],
    ['Taken', '23 Sun,', 'Sept 21', '23:21'],
    ['Late', '23 Wed,', 'Jan 21', '23:21'],
    ['Taken', '02 Fri,', 'Feb 21', '23:21'],
    ['Missed', '23 Wed,', 'Jan 21', '23:21'],
    ['Late', '13 Thur,', 'Apr 21', '23:21'],
    ['Double', '22 Sat,', 'Jan 20', '23:21'],
    ['Taken', '23 Sun,', 'Sept 21', '23:21'],
    ['Late', '23 Wed,', 'Jan 21', '23:21'],
    ['Taken', '02 Fri,', 'Feb 21', '23:21'],
    ['Missed', '23 Wed,', 'Jan 21', '23:21'],
    ['Late', '13 Thur,', 'Apr 21', '23:21'],
    ['Double', '22 Sat,', 'Jan 20', '23:21'],
    ['Taken', '23 Sun,', 'Sept 21', '23:21'],
    ['Late', '23 Wed,', 'Jan 21', '23:21'],
  ];
  var labels = ['All', 'Taken', 'Double', 'Missed', 'Late'];
  var clrlist = [
    Colors.black,
    Colors.black,
    Color(0xff007AFF),
    Color(0xffFC6186),
    Color(0xffFFCA42)
  ];
  var tabs = [
    Tab(
      text: " All ",
    ),
    Tab(
      text: ' taken ',
    ),
    Tab(
      text: ' double ',
    ),
    Tab(
      text: ' missed ',
    ),
    Tab(
      text: ' late ',
    ),
  ];

  String description =
      "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusan tium dolorem que laudantium. Totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. ";

  Color indicatorColor = Colors.black;

  TabController _controller;

  double textsize(tsf, entry, siz, fweigt) {
    Size A = (TextPainter(
            text: TextSpan(
                text: entry,
                style: TextStyle(fontSize: siz, fontWeight: fweigt)),
            maxLines: 1,
            textScaleFactor: tsf,
            textDirection: TextDirection.ltr)
          ..layout())
        .size;
    return A.width;
  }

  List<double> bigText(flist, tsf, width) {
    double a = 0.0, b = 0.0, c = 0.0;
    double a1, b1, c1;
    for (var l in flist) {
      a1 = textsize(tsf, l[0], 17.0, FontWeight.w400);
      b1 = textsize(tsf, l[1], 17.0, FontWeight.w500) +
          textsize(tsf, l[2], 17.0, FontWeight.w400);
      c1 = textsize(tsf, l[3], 18.0, FontWeight.w600);
      if (a < a1) a = a1;
      if (b < b1) b = b1;
      if (c < c1) c = c1;
    }
    var contWidths = [a, b, c];
    double padd =
        (width - (contWidths[0] + contWidths[1] + contWidths[2] + 65)) / 2;
    contWidths.add(padd);
    print("_______$contWidths");
    return contWidths;
  }

  var numrem = [];

  List<List<String>> filter(val) {
    List<List<String>> filList = [];
    for (var m in moodlog) {
      if (m[0] == labels[val] || labels[val] == 'All') {
        filList.add(m);
      }
    }
    return filList;
  }

  var textScaleFactor;
  var p2, contx;
  var scrollController = ScrollController();
  List<List<List<String>>> listTabs = [];
  List<List<double>> listwidths = [];

  final FlowController fController = new FlowController();
  var tsf, w, flowdata;
  var monthmap, weekmap;
  var doneloading;

  getdata() async {
    await fController
        .fetchNotif(
            "https://project31-heroku.herokuapp.com/api/v11/user/patient/pills/asdfwer12423525as")
        .then((value) {
      setState(() {
        flowdata = value['data'];

        for (int i = 0; i < flowdata.length; i++) {
          String flow, date1, date2, tym;

          if (flowdata[i]['taken'] == true)
            flow = 'Taken';
          else if (flowdata[i]['double'] == true)
            flow = 'Double';
          else if (flowdata[i]['missed'] == true)
            flow = 'Missed';
          else
            flow = 'Late';
          String strDate = flowdata[i]["pillDate"];
          DateTime todayDate = DateTime.parse(strDate);
          date1 = todayDate.day.toString() +
              " " +
              weekmap[todayDate.weekday].toString() +
              ", ";
          date2 = monthmap[todayDate.month].toString() +
              " " +
              (todayDate.year).toString().substring(2);
          tym = todayDate.hour.toString() + ":" + todayDate.minute.toString();
          this.moodlog.add([flow, date1, date2, tym]);

          //Reminders
          var pillname = flowdata[i]['pillName'];
          strDate = flowdata[i]["reminderStartDate"];
          var remSDate = DateTime.parse(strDate);
          strDate = flowdata[i]["reminderEndDate"];
          var remEDate = DateTime.parse(strDate);
          String rdate = remSDate.day.toString() +
              "-" +
              remEDate.day.toString() +
              monthmap[remEDate.month].toString() +
              ", " +
              (remEDate.year).toString().substring(2);
          String dur =
              remEDate.difference(remSDate).inDays.toString() + " days";
          this.reminder.add([pillname, dur, rdate]);
        }
        print("____________------____________-----_____________");
        print(flowdata.length);
        int n = 3;
        if (flowdata.length < 3) n = flowdata.length;
        for (int i = 0; i < n; i++) {
          numrem.add(i);
        }

        listTabs = [
          filter(0),
          filter(1),
          filter(2),
          filter(3),
          filter(4),
        ];
        ;
        listwidths = [
          bigText(listTabs[0], tsf, w),
          bigText(listTabs[1], tsf, w),
          bigText(listTabs[2], tsf, w),
          bigText(listTabs[3], tsf, w),
          bigText(listTabs[4], tsf, w),
        ];
        doneloading = true;
      });
    });
  }

  _PillsTabState(contx) {
    this.contx = contx;
  }
  void changeflow(int ind) {
    setState(() {
      //flowtype[flowtype.indexOf(true)] = false;
      flowtype[ind] = !flowtype[ind];
    });
  }

  var pillcircles = ['path1', 'path2', 'path3', 'path4'];
  List<bool> flowtype = [];
  double headerheight(lines) {
    Size size = (TextPainter(
            text: TextSpan(
                text: 'M',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
            maxLines: 1,
            textScaleFactor: MediaQuery.of(context).textScaleFactor,
            textDirection: TextDirection.ltr)
          ..layout())
        .size;
    return size.height * lines;
  }

  @override
  void initState() {
    super.initState();
    getdata();
    this.monthmap = fController.monthmap;
    this.weekmap = fController.weekmap;
    this.tsf = MediaQuery.of(contx).textScaleFactor;
    this.w = MediaQuery.of(contx).size.width;
    this.flowtype = [false, false, false, false];
    _controller = TabController(length: 5, vsync: this)
      ..addListener(() {
        setState(() {
          indicatorColor = clrlist[_controller.index];
          var val = _controller.index;
        });
      });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: headerheight(1) + 40),
              child: DefaultTabController(
                length: 5,
                child: SafeArea(
                  child: NestedScrollView(
                    controller: scrollController,
                    scrollDirection: Axis.vertical,
                    body: TabBarView(
                      controller: _controller,
                      children: [
                        doneloading == true
                            ? ListItems(listTabs[0], listwidths[0])
                            : Center(
                                child: Text(
                                "Loading...",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              )),
                        doneloading == true
                            ? ListItems(listTabs[1], listwidths[1])
                            : Center(child: Text("Loading...")),
                        doneloading == true
                            ? ListItems(listTabs[2], listwidths[2])
                            : Center(child: Text("Loading...")),
                        doneloading == true
                            ? ListItems(listTabs[3], listwidths[3])
                            : Center(child: Text("Loading...")),
                        doneloading == true
                            ? ListItems(listTabs[4], listwidths[4])
                            : Center(child: Text("Loading...")),
                      ],
                    ),
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) => [
                      SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 35),
                              child: Text(
                                  'your mostly logged feels and struggles',
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w400)),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(20, 40, 20, 40),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        width: 60.0,
                                        height: 60.0,
                                        margin: EdgeInsets.only(bottom: 7.0),
                                        decoration: BoxDecoration(
                                            color: Color(0xffC4C4C4),
                                            borderRadius:
                                                BorderRadius.circular(60.0)),
                                        child: FlatButton(
                                            onPressed: () {
                                              changeflow(0);
                                            },
                                            child: Text("------",
                                                style: TextStyle(
                                                    color: Color(0xffC4C4C4)))),
                                      ),
                                      Text(
                                        'Taken',
                                        style: TextStyle(
                                            color: flowtype[0] == true
                                                ? Colors.black
                                                : Colors.white,
                                            fontSize: 17.0,
                                            fontWeight: FontWeight.w400),
                                      )
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        width: 60.0,
                                        height: 60.0,
                                        margin: EdgeInsets.only(bottom: 7.0),
                                        decoration: BoxDecoration(
                                            color: Color(0xffC4C4C4),
                                            borderRadius:
                                                BorderRadius.circular(60.0)),
                                        child: FlatButton(
                                            onPressed: () {
                                              changeflow(1);
                                            },
                                            child: Text("------",
                                                style: TextStyle(
                                                    color: Color(0xffC4C4C4)))),
                                      ),
                                      Text(
                                        'Double',
                                        style: TextStyle(
                                            color: flowtype[1] == true
                                                ? Colors.black
                                                : Colors.white,
                                            fontSize: 17.0,
                                            fontWeight: FontWeight.w400),
                                      )
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        width: 60.0,
                                        height: 60.0,
                                        margin: EdgeInsets.only(bottom: 7.0),
                                        decoration: BoxDecoration(
                                            color: Color(0xffC4C4C4),
                                            borderRadius:
                                                BorderRadius.circular(60.0)),
                                        child: FlatButton(
                                            onPressed: () {
                                              changeflow(2);
                                            },
                                            child: Text("------",
                                                style: TextStyle(
                                                    color: Color(0xffC4C4C4)))),
                                      ),
                                      Text(
                                        'Missed',
                                        style: TextStyle(
                                            color: flowtype[2] == true
                                                ? Colors.black
                                                : Colors.white,
                                            fontSize: 17.0,
                                            fontWeight: FontWeight.w400),
                                      )
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        width: 60.0,
                                        height: 60.0,
                                        margin: EdgeInsets.only(bottom: 7.0),
                                        decoration: BoxDecoration(
                                            color: Color(0xffC4C4C4),
                                            borderRadius:
                                                BorderRadius.circular(60.0)),
                                        child: FlatButton(
                                            onPressed: () {
                                              changeflow(3);
                                            },
                                            child: Text("------",
                                                style: TextStyle(
                                                    color: Color(0xffC4C4C4)))),
                                      ),
                                      Text(
                                        'Late',
                                        style: TextStyle(
                                            color: flowtype[3] == true
                                                ? Colors.black
                                                : Colors.white,
                                            fontSize: 17.0,
                                            fontWeight: FontWeight.w400),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, right: 20.0, bottom: 7.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Reminders',
                                    style: TextStyle(
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  IconButton(
                                      icon: Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.black,
                                      ),
                                      onPressed: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    PillReminder(reminder)),
                                          ))
                                ],
                              ),
                            ),
                            Container(
                                margin:
                                    EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 53.0),
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
                                      height: 10.0,
                                    ),
                                    for (var i in numrem)
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 20.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              width: 180.0,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Container(
                                                    width: 180.0,
                                                    child: Text(reminder[i][0],
                                                        style: TextStyle(
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 17.0,
                                                        )),
                                                  ),
                                                  SizedBox(
                                                    height: 5.0,
                                                  ),
                                                  Text(reminder[i][1],
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xff454545),
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w400)),
                                                ],
                                              ),
                                            ),
                                            Text(
                                              reminder[i][2],
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

                            //dropbox
                            DateRangePick(),
                          ],
                        ),
                      ),
                      SliverAppBar(
                          floating: false,
                          titleSpacing: 0.0,
                          backgroundColor: Color.fromRGBO(255, 255, 255, 0.6),
                          pinned: true,
                          elevation: 0.0,
                          leading: null,
                          automaticallyImplyLeading: false,
                          flexibleSpace: ClipRect(
                              child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                      sigmaX: 6.0, sigmaY: 4.0),
                                  child: Container(
                                      child: null,
                                      alignment: Alignment.bottomCenter,
                                      color: Colors.transparent))),
                          bottom: PreferredSize(
                              preferredSize: Size.fromHeight(30),
                              child: ClipRect(
                                  child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 6.0, sigmaY: 4.0),
                                      child: Container(
                                        alignment: Alignment.bottomCenter,
                                        color: Colors.transparent,
                                        child: TabBar(
                                            controller: _controller,
                                            labelColor: indicatorColor,
                                            unselectedLabelColor: Colors.black,
                                            unselectedLabelStyle: TextStyle(
                                                fontSize: 17.0,
                                                fontWeight: FontWeight.w300),
                                            labelStyle: TextStyle(
                                                fontSize: 19.0,
                                                fontWeight: FontWeight.w700),
                                            indicator: UnderlineIndicator(
                                                strokeCap: StrokeCap
                                                    .round, // Set your line endings.
                                                borderSide: BorderSide(
                                                  color: indicatorColor,
                                                  width: 7,
                                                ),
                                                insets:
                                                    EdgeInsets.only(bottom: 0)),
                                            indicatorSize:
                                                TabBarIndicatorSize.label,
                                            indicatorWeight: 4.0,
                                            labelPadding: kTabLabelPadding,
                                            isScrollable: true,
                                            tabs: tabs),
                                      ))))),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              //color: Colors.yellow,
              height: headerheight(1) + 75,
              child: AppBar(
                  elevation: 0,
                  leading: null,
                  automaticallyImplyLeading: false,
                  backgroundColor: Color.fromRGBO(255, 255, 255, 0.6),
                  flexibleSpace: ClipRect(
                      child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 4.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 25, 0, 0),
                          child: IconButton(
                            icon:
                                Icon(Icons.arrow_back_ios, color: Colors.black),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ),
                        Container(
                          width: double.maxFinite,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text('Pills',
                                style: TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black)),
                          ),
                        ),
                      ],
                    ),
                  ))),
            ),
          ],
        ),
      ),
    );
  }
}
