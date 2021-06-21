import 'dart:ui';
import 'package:flutter/material.dart';
import 'listItems.dart';
import 'daterange.dart';
import 'package:underline_indicator/underline_indicator.dart';
import 'paragraph.dart';
import 'flowcontrol.dart';

class PregTestPage extends StatefulWidget {
  var contx;
  PregTestPage(contx) {
    this.contx = contx;
  }

  @override
  _PregTestPageState createState() => _PregTestPageState(contx);
}

class _PregTestPageState extends State<PregTestPage>
    with SingleTickerProviderStateMixin {
  Color clr = Colors.black;
  final controller = PageController();

  var moodlog = [
    ['Positive', '20 Fri,', 'Apr 21', '09:21'],
    ['Positive', '23 Wed,', 'Jan 21', '23:31'],
    ['Negative ', '23 Mon,', 'Sept 21', '20:11'],
    ['Negative', '25 Sat,', 'Mar 22', '09:21'],
    ['Positive', '20 Fri,', 'Apr 21', '09:21'],
    ['Positive', '23 Wed,', 'Jan 21', '23:31'],
    ['Negative', '23 Mon,', 'Sept 21', '20:11'],
    ['Negative', '25 Sat,', 'Mar 22', '09:21'],
    ['Positive', '20 Fri,', 'Apr 21', '09:21'],
    ['Positive', '23 Wed,', 'Jan 21', '23:31'],
    ['Negative', '23 Mon,', 'Sept 21', '20:11'],
    ['Negative', '25 Sat,', 'Mar 22', '09:21'],
    ['Positive', '20 Fri,', 'Apr 21', '09:21'],
    ['Positive', '23 Wed,', 'Jan 21', '23:31'],
    ['Negative', '23 Mon,', 'Sept 21', '20:11'],
    ['Negative', '25 Sat,', 'Mar 22', '09:21'],
    ['Positive', '20 Fri,', 'Apr 21', '09:21'],
    ['Positive', '23 Wed,', 'Jan 21', '23:31'],
    ['Negative', '23 Mon,', 'Sept 21', '20:11'],
    ['Negative', '25 Sat,', 'Mar 22', '09:21'],
  ];
  var labels = ['All', 'Positive', 'Negative'];
  var clrlist = [
    Colors.black,
    Colors.black,
    Colors.black,
  ];
  var tabs = [
    Tab(text: " All "),
    Tab(
      text: ' Positive ',
    ),
    Tab(
      text: ' Negative ',
    ),
  ];

  String description =
      "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusan tium dolorem que laudantium. Totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. ";

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
    //print("_______$contWidths");
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
            "https://project31-heroku.herokuapp.com/api/v11/user/patient/allpregnancy/asdfwer12423525as")
        .then((value) {
      setState(() {
        flowdata = value['data'];

        for (int i = 0; i < flowdata.length; i++) {
          String flow, date1, date2, tym;

          if (flowdata[i]['positive'] == true)
            flow = 'Positive';
          else
            flow = 'Negative';
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
        listTabs = [filter(0), filter(1), filter(2)];
        listwidths = [
          bigText(listTabs[0], tsf, w),
          bigText(listTabs[1], tsf, w),
          bigText(listTabs[2], tsf, w),
        ];
        doneloading = true;
      });
    });
  }

  _PregTestPageState(contx) {
    this.contx = contx;
  }

  @override
  void initState() {
    super.initState();
    this.monthmap = fController.monthmap;
    this.weekmap = fController.weekmap;
    this.tsf = MediaQuery.of(contx).textScaleFactor;
    this.w = MediaQuery.of(contx).size.width;
    this.flowtype = [false, false];
    getdata();
    _controller = TabController(length: 3, vsync: this)
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
              padding: EdgeInsets.only(top: headerheight(1) + 40),
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
                              padding: const EdgeInsets.only(left: 20, top: 35),
                              child: Text(
                                  'your mostly logged feels and struggles',
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w400)),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                      flowtype[0] == true
                                          ? Text(
                                              'Positive',
                                              style: TextStyle(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.w400),
                                            )
                                          : Text(
                                              'Positive',
                                              style: TextStyle(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.white),
                                            )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 78,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        width: 60.0,
                                        height: 60.0,
                                        margin: EdgeInsets.only(
                                          bottom: 7.0,
                                        ),
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
                                      flowtype[1] == true
                                          ? Text(
                                              'Negative',
                                              style: TextStyle(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.w400),
                                            )
                                          : Text(
                                              'Negative',
                                              style: TextStyle(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.white),
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
                            child: Text('Pregnancy Test',
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
