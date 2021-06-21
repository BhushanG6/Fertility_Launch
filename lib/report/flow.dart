import 'dart:ui';
import 'flowcontrol.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:date_format/date_format.dart';
import 'paragraph.dart';
import 'three_bars.dart';
import 'listItems.dart';

import 'package:underline_indicator/underline_indicator.dart';

class FlowPage extends StatefulWidget {
  var contx;
  FlowPage(contx) {
    this.contx = contx;
  }
  @override
  _FlowPageState createState() => _FlowPageState(contx);
}

class _FlowPageState extends State<FlowPage>
    with SingleTickerProviderStateMixin {
  final FlowController fController = new FlowController();
  Color clr = Colors.black;
  final controller = PageController();

  var labels = ['All', 'Light', 'Medium', 'Heavy', 'Spotting'];
  var clrlist = [
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
      text: ' Light ',
    ),
    Tab(
      text: ' Medium ',
    ),
    Tab(
      text: ' Heavy ',
    ),
    Tab(
      text: ' Spotting ',
    ),
  ];

  String description =
      "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusan tium dolorem que laudantium. Totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. ";

  var lvl;
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
      c1 = textsize(tsf, l[3], 18.0, FontWeight.w600);
      if (a < a1) a = a1;
      if (b < b1) b = b1;
      if (c < c1) c = c1;
    }
    var contWidths = [a, b, c];
    double padd =
        (width - (contWidths[0] + contWidths[1] + contWidths[2] + 65)) / 2;
    contWidths.add(padd);

    return contWidths;
  }

  Future<List<List<String>>> moodl;
  List<List<String>> moodlog = [];
  List<List<String>> filter(val) {
    print("filter started...");
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

  var tsf, w, flowdata, weekmap, monthmap;
  var doneloading = false;
  bool spotvalue;
  int lcount = -1, mcount = -1, hcount = -1, scount = -1;
  getdata() async {
    await fController
        .fetchNotif(
            "https://project31-heroku.herokuapp.com/api/v11/user/patient/flows/asdfwer12423525as")
        .then((value) {
      setState(() {
        flowdata = value['data'];

        for (int i = 0; i < flowdata.length; i++) {
          String flow, date1, date2, tym;

          lcount = flowdata[flowdata.length - 1]['lightCount'];
          mcount = flowdata[flowdata.length - 1]['mediumCount'];
          hcount = flowdata[flowdata.length - 1]['heavyCount'];
          scount = flowdata[flowdata.length - 1]['spottingCount'];
          this.lvl = [hcount, mcount, lcount];
          if (flowdata[i]['light'] == true)
            flow = 'Light';
          else if (flowdata[i]['medium'] == true)
            flow = 'Medium';
          else if (flowdata[i]['spotting'] == true)
            flow = 'Spotting';
          else
            flow = 'Heavy';

          spotvalue = flowdata[i]['spotting'];

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
          this.moodlog.add([flow, date1, date2, tym, spotvalue.toString()]);
        }
        print("____________------____________-----_____________");
        print(moodlog);
        listTabs = [filter(0), filter(1), filter(2), filter(3), filter(4)];
        listwidths = [
          bigText(listTabs[0], tsf, w),
          bigText(listTabs[1], tsf, w),
          bigText(listTabs[2], tsf, w),
          bigText(listTabs[3], tsf, w),
          bigText(listTabs[4], tsf, w)
        ];
        doneloading = true;
      });
    });
  }

  _FlowPageState(contx) {
    this.contx = contx;
  }

  @override
  void initState() {
    this.monthmap = fController.monthmap;
    this.weekmap = fController.weekmap;
    getdata();
    super.initState();
    this.tsf = MediaQuery.of(contx).textScaleFactor;
    this.w = MediaQuery.of(contx).size.width - 20;
    this.lvl = [0, 0, 0];
    this.flowtype = [false, false, false, false];
    print("in here:__________________________________");

    _controller = TabController(length: 5, vsync: this)
      ..addListener(() {
        setState(() {
          indicatorColor = clrlist[_controller.index];
          var val = _controller.index;
        });
      });
  }

  Size getSize(String text, BuildContext context) {
    Size size = (TextPainter(
            text: TextSpan(
                text: text,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
            maxLines: 1,
            textScaleFactor: MediaQuery.of(context).textScaleFactor,
            textDirection: TextDirection.ltr)
          ..layout())
        .size;
    //getSize(notifValue,context).longestSide
    return size;
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

  var tabSpaceX;
  Widget build(BuildContext context) {
    tabSpaceX = (MediaQuery.of(context).size.width -
            (20 +
                20 +
                getSize('All', context).longestSide +
                getSize('Light', context).longestSide +
                getSize('Medium', context).longestSide +
                getSize('Heavy', context).longestSide)) /
        3;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: headerheight(1) + 40),
              child: DefaultTabController(
                length: 4,
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
                              padding: const EdgeInsets.only(left: 20, top: 37),
                              child: Text(
                                  'your mostly logged feels and struggles',
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w400)),
                            ),
                            ////
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 35, 20, 0),
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
                                        width: 48.0,
                                        height: 105.0,
                                        margin: EdgeInsets.only(bottom: 7.0),
                                        decoration: BoxDecoration(
                                            color: Color(0xffC4C4C4),
                                            borderRadius:
                                                BorderRadius.circular(23.0)),
                                        child: FlatButton(
                                            onPressed: () {
                                              changeflow(0);
                                            },
                                            child: Text("------",
                                                style: TextStyle(
                                                    color: Color(0xffC4C4C4)))),
                                      ),
                                      Text(
                                        'Light',
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
                                        width: 48.0,
                                        height: 105.0,
                                        margin: EdgeInsets.only(bottom: 7.0),
                                        decoration: BoxDecoration(
                                            color: Color(0xffC4C4C4),
                                            borderRadius:
                                                BorderRadius.circular(23.0)),
                                        child: FlatButton(
                                            onPressed: () {
                                              changeflow(1);
                                            },
                                            child: Text("------",
                                                style: TextStyle(
                                                    color: Color(0xffC4C4C4)))),
                                      ),
                                      Text(
                                        'Medium',
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
                                        width: 48.0,
                                        height: 105.0,
                                        margin: EdgeInsets.only(bottom: 7.0),
                                        decoration: BoxDecoration(
                                            color: Color(0xffC4C4C4),
                                            borderRadius:
                                                BorderRadius.circular(23.0)),
                                        child: FlatButton(
                                            onPressed: () {
                                              changeflow(2);
                                            },
                                            child: Text("------",
                                                style: TextStyle(
                                                    color: Color(0xffC4C4C4)))),
                                      ),
                                      Text(
                                        'Heavy',
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
                                        width: 48.0,
                                        height: 105.0,
                                        margin: EdgeInsets.only(bottom: 7.0),
                                        decoration: BoxDecoration(
                                            color: Color(0xffC4C4C4),
                                            borderRadius:
                                                BorderRadius.circular(23.0)),
                                        child: FlatButton(
                                            onPressed: () {
                                              changeflow(3);
                                            },
                                            child: Text("------",
                                                style: TextStyle(
                                                    color: Color(0xffC4C4C4)))),
                                      ),
                                      Text(
                                        'Spotting',
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
                            lvl == [0, 0, 0]
                                ? BarCards(lvl, 160)
                                : BarCards(lvl, 160),
                            GetPara(description),
                            SizedBox(
                              height: 20,
                            )
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
                            child: Text('Flow',
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
