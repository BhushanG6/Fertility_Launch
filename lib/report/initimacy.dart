import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'daterange.dart';
import 'listItems.dart';
import 'two_bars.dart';
import 'package:underline_indicator/underline_indicator.dart';
import 'paragraph.dart';
import 'flowcontrol.dart';

class IntimacyTab extends StatefulWidget {
  var contx;
  IntimacyTab(contx) {
    this.contx = contx;
  }
  @override
  _IntimacyTabState createState() => _IntimacyTabState(contx);
}

class _IntimacyTabState extends State<IntimacyTab>
    with SingleTickerProviderStateMixin {
  Color clr = Colors.black;
  final controller = PageController();
  String description =
      "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusan tium dolorem que laudantium. Totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. ";

  var moodlog = [
    ['Ovulation', '24 Fri,', 'Jul 21', 'x 3', 'p'],
    ['Folicular', '20 Sat,', 'Aug 21', 'x 21', 'u'],
    ['Period', '09 Wed,', 'Jan 21', 'x 8', 'u'],
    ['Ovulation', '07 Wed,', 'Sept 21', 'x 560', 'p'],
    ['Leutal', '11 Wed,', 'Apr 21', 'x 6', 'p'],
    ['Period', '08 Wed,', 'Feb 21', 'x 53', 'u'],
    ['Fertile', '23 Wed,', 'Jan 21', 'x 8', 'u'],
    ['Leutal', '08 Wed,', 'Jan 21', 'x 6', 'p'],
    ['Period', '23 Wed,', 'Jan 21', 'x 53', 'u'],
    ['Fertile', '23 Wed,', 'Jan 21', 'x 8', 'u'],
    ['Ovulation', '24 Fri,', 'Jul 21', 'x 3', 'p'],
    ['Folicular', '20 Sat,', 'Aug 21', 'x 21', 'u'],
    ['Period', '09 Wed,', 'Jan 21', 'x 8', 'u'],
    ['Ovulation', '07 Wed,', 'Sept 21', 'x 56', 'p'],
    ['Leutal', '11 Wed,', 'Apr 21', 'x 6', 'p'],
    ['Period', '08 Wed,', 'Feb 21', 'x 53', 'u'],
    ['Fertile', '23 Wed,', 'Jan 21', 'x 8', 'u'],
    ['Leutal', '08 Wed,', 'Jan 21', 'x 6', 'p'],
    ['Period', '23 Wed,', 'Jan 21', 'x 53', 'u'],
    ['Fertile', '23 Wed,', 'Jan 21', 'x 8', 'u'],
    ['Ovulation', '24 Fri,', 'Jul 21', 'x 3', 'p'],
    ['Folicular', '20 Sat,', 'Aug 21', 'x 21', 'u'],
    ['Period', '09 Wed,', 'Jan 21', 'x 8', 'u'],
    ['Ovulation', '07 Wed,', 'Sept 21', 'x 56', 'p'],
    ['Leutal', '11 Wed,', 'Apr 21', 'x 6', 'p'],
    ['Period', '08 Wed,', 'Feb 21', 'x 53', 'u'],
    ['Fertile', '23 Wed,', 'Jan 21', 'x 8', 'u'],
    ['Leutal', '08 Wed,', 'Jan 21', 'x 6', 'p'],
    ['Period', '23 Wed,', 'Jan 21', 'x 53', 'u'],
    ['Fertile', '23 Wed,', 'Jan 21', 'x 8', 'u'],
  ];
  var labels = ['All', 'Folicular', 'Ovulation', 'Leutal', 'Period'];
  var clrlist = [
    Colors.black,
    Colors.black,
    Color(0xff007AFF),
    Color(0xffFC6186),
    Color(0xffFFCA42),
    Color(0xffFF6262)
  ];
  var tabs = [
    Tab(text: " All "),
    Tab(
      text: ' Folicular ',
    ),
    Tab(
      text: ' Ovulation ',
    ),
    Tab(
      text: ' Leutal ',
    ),
    Tab(
      text: ' Period ',
    ),
  ];

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
  List<String> latestprot, latestunprot;
  var doneloading, weekmap, monthmap;
  int totalprcnt, totalunprcnt;

  getdata() async {
    await fController
        .fetchNotif(
            "https://project31-heroku.herokuapp.com/api/v11/user/patient/allIntimacy/asdfwer12423525as")
        .then((value) {
      setState(() {
        flowdata = value['data'];
        String flow, date1, date2, protstat, cnt, strDate;

        //Latest type of intimacy

        strDate = flowdata[flowdata.length - 1]["Date"];
        DateTime todayDate = DateTime.parse(strDate);
        date1 = todayDate.day.toString() +
            " " +
            monthmap[todayDate.month].toString();
        date2 = ", " + (todayDate.year).toString().substring(2);
        if (flowdata[flowdata.length - 1]['protected'] == true)
          latestprot = [date1, date2];
        else
          latestunprot = [date1, date2];

        //Generating the list
        int tupc = 0;
        int tpc = 0;

        for (int i = 0; i < flowdata.length; i++) {
          if (flowdata[i]['folicular'] == true)
            flow = 'Folicular';
          else if (flowdata[i]['leutal'] == true)
            flow = 'Leutal';
          else if (flowdata[i]['ovulation'] == true)
            flow = 'Ovulation';
          else
            flow = 'Period';

          String strDate = flowdata[i]["Date"];
          DateTime todayDate = DateTime.parse(strDate);
          date1 = todayDate.day.toString() +
              " " +
              weekmap[todayDate.weekday].toString() +
              ", ";
          date2 = monthmap[todayDate.month].toString() +
              " " +
              (todayDate.year).toString().substring(2);
          if (flowdata[i]['protected'] == true) {
            protstat = 'p';
            tpc = tpc + flowdata[i]['protectedCount'];
            cnt = "x " + flowdata[i]['protectedCount'].toString();
          } else {
            protstat = 'u';
            tupc = tupc + flowdata[i]['unProtectedCount'];
            cnt = "x " + flowdata[i]['unProtectedCount'].toString();
          }
          this.totalprcnt = tpc;
          this.totalunprcnt = tupc;
          this.moodlog.add([flow, date1, date2, cnt, protstat]);
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

  _IntimacyTabState(contx) {
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
    _controller = TabController(length: 5, vsync: this)
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
                              padding: const EdgeInsets.only(
                                  left: 20, top: 35, bottom: 0.0),
                              child: Text(
                                  'your mostly logged feels and struggles',
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w400)),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.fromLTRB(26, 11, 26, 11),
                                  margin:
                                      EdgeInsets.only(left: 20.0, bottom: 37),
                                  height: 50.0,
                                  width: (w - 105) / 2,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                      color:
                                          Color.fromRGBO(226, 226, 226, 0.5)),
                                  child: Text(
                                    'Protected',
                                    style: TextStyle(
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Icon(CupertinoIcons.heart_solid,
                                    color: Colors.pink[600], size: 44.0),
                                Container(
                                  padding: EdgeInsets.all(11),
                                  margin:
                                      EdgeInsets.only(right: 20.0, bottom: 37),
                                  height: 50.0,
                                  width: (w - 85) / 2,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                    color: Colors.white,
                                  ),
                                  child: Text(
                                    'Unprotected',
                                    style: TextStyle(
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 40.0,
                            ),
                            TwoBars(
                                [totalprcnt, totalunprcnt],
                                170,
                                [latestprot, latestunprot],
                                Color(0xffFF6262),
                                Color(0xff007AFF),
                                'Protected',
                                'Unprotected'),
                            SizedBox(
                              height: 40.0,
                            ),
                            //dropbox

                            DateRangePick(),
                            GetPara(description),
                            SizedBox(
                              height: 10,
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
                            child: Text('Intimacy',
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
