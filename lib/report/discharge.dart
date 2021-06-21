import 'dart:ui';

import 'package:flutter/material.dart';
import 'paragraph.dart';
import 'daterange.dart';
import 'listItems.dart';
import 'flowcontrol.dart';
import 'package:underline_indicator/underline_indicator.dart';

class DischargePage extends StatefulWidget {
  var contx;
  DischargePage(contx) {
    this.contx = contx;
  }
  @override
  _DischargePageState createState() => _DischargePageState(contx);
}

class _DischargePageState extends State<DischargePage>
    with SingleTickerProviderStateMixin {
  Color clr = Colors.black;
  final controller = PageController();
  var moodlog = [];
  var labels = ['All', 'Dry', 'Sticky', 'Creamy', 'Watery', 'EggWhite'];
  var clrlist = [
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
  ];
  var tabs = [
    Tab(
      text: " All ",
    ),
    Tab(
      text: ' Dry ',
    ),
    Tab(
      text: ' Sticky ',
    ),
    Tab(
      text: ' Creamy ',
    ),
    Tab(
      text: ' Watery ',
    ),
    Tab(
      text: ' EggWhite ',
    ),
  ];
  String description =
      "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium. Totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. ";

  List<bool> flowtype = [];

  void changeflow(int ind) {
    setState(() {
      //flowtype[flowtype.indexOf(true)] = false;
      flowtype[ind] = !flowtype[ind];
    });
  }

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
      c1 = textsize(tsf, l[3], 17.0, FontWeight.w600);
      if (a < a1) a = a1;
      if (b < b1) b = b1;
      if (c < c1) c = c1;
    }
    var contWidths = [a, b, c];
    double padd =
        (width - (contWidths[0] + contWidths[1] + contWidths[2] + 40)) / 2;
    contWidths.add(padd);
    print("_______$contWidths");
    return contWidths;
  }

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
  var p2, contx, cirdia;
  var scrollController = ScrollController();
  final FlowController fController = new FlowController();
  List<List<List<String>>> listTabs = [];
  List<List<double>> listwidths = [];
  var tsf, w, flowdata;

  var doneloading, weekmap, monthmap;

  getdata() async {
    await fController
        .fetchNotif(
            "https://project31-heroku.herokuapp.com/api/v11/user/patient/allDischarge/asdfwer12423525as")
        .then((value) {
      setState(() {
        flowdata = value['data'];

        for (int i = 0; i < flowdata.length; i++) {
          String flow, date1, date2, tym;

          if (flowdata[i]['dry'] == true)
            flow = 'Dry';
          else if (flowdata[i]['sticky'] == true)
            flow = 'Sticky';
          else if (flowdata[i]['creamy'] == true)
            flow = 'Creamy';
          else if (flowdata[i]['watery'] == true)
            flow = 'Watery';
          else
            flow = 'EggWhite';

          String strDate = flowdata[i]["Date"];
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
        }
        print("____________------____________-----_____________");
        print(moodlog);
        listTabs = [
          filter(0),
          filter(1),
          filter(2),
          filter(3),
          filter(4),
          filter(5)
        ];
        listwidths = [
          bigText(listTabs[0], tsf, w),
          bigText(listTabs[1], tsf, w),
          bigText(listTabs[2], tsf, w),
          bigText(listTabs[3], tsf, w),
          bigText(listTabs[4], tsf, w),
          bigText(listTabs[5], tsf, w)
        ];
        doneloading = true;
      });
    });
  }

  _DischargePageState(contx) {
    this.contx = contx;
  }

  @override
  void initState() {
    super.initState();
    this.monthmap = fController.monthmap;
    this.weekmap = fController.weekmap;
    getdata();
    this.tsf = MediaQuery.of(contx).textScaleFactor;
    this.w = MediaQuery.of(contx).size.width;
    this.cirdia = (w - 45) / 5;

    this.flowtype = [false, false, false, false, false];
    _controller = TabController(length: 6, vsync: this)
      ..addListener(() {
        setState(() {
          indicatorColor = clrlist[_controller.index];
          var val = _controller.index;
        });
      });
  }

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
                length: 6,
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
                        doneloading == true
                            ? ListItems(listTabs[5], listwidths[5])
                            : Center(child: Text("Loading...")),
                      ],
                    ),
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) => [
                      SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 37),
                              child: Text(
                                  'your mostly logged feels and struggles',
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w400)),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        width: cirdia,
                                        height: cirdia,
                                        margin: EdgeInsets.only(bottom: 7.0),
                                        decoration: BoxDecoration(
                                            color: Color(0xffC4C4C4),
                                            borderRadius:
                                                BorderRadius.circular(cirdia)),
                                        child: FlatButton(
                                            onPressed: () {
                                              changeflow(0);
                                            },
                                            child: Text("------",
                                                style: TextStyle(
                                                    color: Color(0xffC4C4C4)))),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Dry',
                                          style: TextStyle(
                                              color: flowtype[0] == true
                                                  ? Colors.black
                                                  : Colors.white,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 110,
                                      ),
                                      Container(
                                        width: cirdia,
                                        height: cirdia,
                                        margin: EdgeInsets.only(
                                          bottom: 7.0,
                                        ),
                                        decoration: BoxDecoration(
                                            color: Color(0xffC4C4C4),
                                            borderRadius:
                                                BorderRadius.circular(cirdia)),
                                        child: FlatButton(
                                            onPressed: () {
                                              changeflow(1);
                                            },
                                            child: Text("------",
                                                style: TextStyle(
                                                    color: Color(0xffC4C4C4)))),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Watery',
                                          style: TextStyle(
                                              color: flowtype[1] == true
                                                  ? Colors.black
                                                  : Colors.white,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        width: cirdia,
                                        height: cirdia,
                                        margin: EdgeInsets.only(bottom: 7.0),
                                        decoration: BoxDecoration(
                                            color: Color(0xffC4C4C4),
                                            borderRadius:
                                                BorderRadius.circular(cirdia)),
                                        child: FlatButton(
                                            onPressed: () {
                                              changeflow(2);
                                            },
                                            child: Text("------",
                                                style: TextStyle(
                                                    color: Color(0xffC4C4C4)))),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Sticky',
                                          style: TextStyle(
                                              color: flowtype[2] == true
                                                  ? Colors.black
                                                  : Colors.white,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 110,
                                      ),
                                      Container(
                                        width: cirdia,
                                        height: cirdia,
                                        margin: EdgeInsets.only(bottom: 7.0),
                                        decoration: BoxDecoration(
                                            color: Color(0xffC4C4C4),
                                            borderRadius:
                                                BorderRadius.circular(cirdia)),
                                        child: FlatButton(
                                            onPressed: () {
                                              changeflow(3);
                                            },
                                            child: Text("------",
                                                style: TextStyle(
                                                    color: Color(0xffC4C4C4)))),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Eggwhite',
                                          style: TextStyle(
                                              color: flowtype[3] == true
                                                  ? Colors.black
                                                  : Colors.white,
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        width: cirdia,
                                        height: cirdia,
                                        margin: EdgeInsets.only(bottom: 7.0),
                                        decoration: BoxDecoration(
                                            color: Color(0xffC4C4C4),
                                            borderRadius:
                                                BorderRadius.circular(cirdia)),
                                        child: FlatButton(
                                            onPressed: () {
                                              changeflow(4);
                                            },
                                            child: Text("------",
                                                style: TextStyle(
                                                    color: Color(0xffC4C4C4)))),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Creamy',
                                          style: TextStyle(
                                              color: flowtype[4] == true
                                                  ? Colors.black
                                                  : Colors.white,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            GetPara(description),
                            SizedBox(
                              height: 30,
                            ),
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
                            child: Text('Discharge',
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
