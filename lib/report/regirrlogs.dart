import 'dart:ui';
import 'package:flutter/material.dart';
import 'two_bars.dart';
import 'listItems.dart';
import 'package:underline_indicator/underline_indicator.dart';
import 'daterange.dart';
import 'flowcontrol.dart';

class ReIrLogs extends StatefulWidget {
  var contx;
  ReIrLogs(contx) {
    this.contx = contx;
  }
  @override
  _ReIrLogsState createState() => _ReIrLogsState(contx);
}

class _ReIrLogsState extends State<ReIrLogs>
    with SingleTickerProviderStateMixin {
  Color clr = Colors.black;
  final controller = PageController();
  var moodlog = [];
  var clrlist = [
    Colors.black,
    Colors.black,
    Colors.red[400],
  ];
  var labels = ['All', 'Regular', 'Irregular'];
  var tabs = [
    Tab(text: " All "),
    Tab(
      text: ' Regular ',
    ),
    Tab(
      text: ' ir Regular ',
    ),
  ];

  String description =
      "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium. Totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. ";

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
      if (m[4] == labels[val] || labels[val] == 'All') {
        filList.add(m);
      }
    }
    return filList;
  }

  var textScaleFactor;
  var p2, contx;
  var scrollController = ScrollController();
  final FlowController fController = new FlowController();
  List<List<List<String>>> listTabs = [];
  List<List<double>> listwidths = [];
  var tsf, w, flowdata;
  List<String> latestprot, latestunprot;
  var doneloading, weekmap, monthmap;
  int totalprcnt, totalunprcnt;

  getdata() async {
    await fController
        .fetchNotif(
            "https://project31-heroku.herokuapp.com/api/v11/user/patient/regAndIrregs/asdfwe424sd5as")
        .then((value) {
      setState(() {
        flowdata = value['data'];
        String flow, date1, date2, days, strDate;

        //Latest type of period

        strDate = flowdata[flowdata.length - 1]["actualStartDate"];
        DateTime todayDate = DateTime.parse(strDate);
        date1 = todayDate.day.toString() +
            " " +
            monthmap[todayDate.month].toString();
        date2 = ", " + (todayDate.year).toString().substring(2);
        if (flowdata[flowdata.length - 1]['regular'] == true)
          latestprot = [date1, date2];
        else
          latestunprot = [date1, date2];

        this.totalprcnt = flowdata[flowdata.length - 1]['regularCount'];
        this.totalunprcnt = flowdata[flowdata.length - 1]['irregularCount'];

        //Generating the list
        var prefix = ['On time', 'before by ', 'late by '];

        for (int i = 0; i < flowdata.length; i++) {
          if (flowdata[i]['regular'] == true)
            flow = 'Regular';
          else if (flowdata[i]['irregular'] == true) flow = 'Irregular';
          String periodmessage;

          String strPDate = flowdata[i]["predictedStartDate"];
          String strADate = flowdata[i]["actualStartDate"];
          DateTime predDate = DateTime.parse(strPDate);
          DateTime actDate = DateTime.parse(strADate);
          if (actDate.compareTo(predDate) > 0) {
            periodmessage = prefix[2] + flowdata[i]["diffInDate"].toString();
          } else if (actDate.compareTo(predDate) < 0) {
            periodmessage = prefix[1] + flowdata[i]["diffInDate"].toString();
          } else {
            periodmessage = prefix[0] + flowdata[i]["diffInDate"].toString();
          }
          date1 = actDate.day.toString() +
              " " +
              weekmap[actDate.weekday].toString() +
              ", ";
          date2 = monthmap[actDate.month].toString() +
              " " +
              (actDate.year).toString().substring(2);
          days = flowdata[i]["diffInDate"].toString() + " d";
          this.moodlog.add([periodmessage, date1, date2, days, flow]);
        }
        print("____________------____________-----_____________");
        print(moodlog);
        listTabs = [
          filter(0),
          filter(1),
          filter(2),
        ];
        listwidths = [
          bigText(listTabs[0], tsf, w),
          bigText(listTabs[1], tsf, w),
          bigText(listTabs[2], tsf, w),
        ];
        doneloading = true;
      });
    });
  }

  _ReIrLogsState(contx) {
    this.contx = contx;
    this.latestprot = ['', ''];
    this.latestunprot = ['', ''];
    this.totalprcnt = 0;
    this.totalunprcnt = 0;
  }

  @override
  void initState() {
    super.initState();
    this.monthmap = fController.monthmap;
    this.weekmap = fController.weekmap;
    getdata();
    this.tsf = MediaQuery.of(contx).textScaleFactor;
    this.w = MediaQuery.of(contx).size.width;
    _controller = TabController(length: 3, vsync: this)
      ..addListener(() {
        setState(() {
          indicatorColor = clrlist[_controller.index];
        });
      });
  }

  Size getSize(String text, BuildContext context) {
    Size size = (TextPainter(
            text: TextSpan(
                text: text,
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.w700)),
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
                getSize('Regular', context).longestSide +
                getSize('ir Regular', context).longestSide)) /
        2;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: headerheight(2) + 15),
              child: DefaultTabController(
                length: 3,
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
                      ],
                    ),
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) => [
                      SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, top: 66, bottom: 50.0),
                              child: Text(
                                  'your mostly logged feels and struggles',
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w400)),
                            ),
                            TwoBars(
                                [totalprcnt, totalunprcnt],
                                170,
                                [latestprot, latestunprot],
                                Color(0xffFF6262),
                                Color(0xff8BFF62),
                                'Regular',
                                'ir Regular'),
                            SizedBox(
                              height: 60,
                            ),
                            DateRangePick()
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
                              preferredSize: Size.fromHeight(50),
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
                                            labelPadding: EdgeInsets.only(
                                                left: tabSpaceX / 2,
                                                right: tabSpaceX / 2),
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
              height: headerheight(2) + 75,
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
                            child: Text('Regular & \nIrregular',
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
