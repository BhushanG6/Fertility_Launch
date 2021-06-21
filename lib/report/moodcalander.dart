import 'dart:ui';

import 'package:flutter/material.dart';
import 'listItems.dart';
import 'three_bars.dart';
import 'paragraph.dart';
import 'package:underline_indicator/underline_indicator.dart';

class MoodDetails extends StatefulWidget {
  var q, lvl, contx, mood, moodlog;
  MoodDetails(lvl, q, contx, mood, moodlog) {
    this.q = q;
    this.lvl = lvl;
    this.contx = contx;
    this.mood = mood;
    this.moodlog = moodlog;
  }
  @override
  _MoodDetailsState createState() =>
      _MoodDetailsState(q, lvl, contx, mood, moodlog);
}

class _MoodDetailsState extends State<MoodDetails>
    with SingleTickerProviderStateMixin {
  Color clr = Colors.black;
  final controller = PageController();
  /*
  var moodlog = [
    ['Usual', '09 Wed, ', 'Jan 20', '20:01'],
    ['Moderate', '23 Wed, ', 'Sept 21', '09:21'],
    ['High', '28 Fri, ', 'Feb 21', '12:20'],
    ['Usual', '23 Mon, ', 'Jan 22', '21:00'],
    ['Moderate', '23 Wed, ', 'Apr 21', '23:21'],
    ['High', '11 Sat, ', 'Jan 20', '20:09'],
    ['Usual', '23 Wed, ', 'Mar 21', '07:32'],
    ['Usual', '09 Wed, ', 'Jan 20', '20:01'],
    ['Moderate', '23 Wed, ', 'Sept 21', '09:21'],
    ['High', '28 Fri, ', 'Feb 21', '12:20'],
    ['Usual', '23 Mon, ', 'Jan 22', '21:00'],
    ['Moderate', '23 Wed, ', 'Apr 21', '23:21'],
    ['High', '11 Sat, ', 'Jan 20', '20:09'],
    ['Usual', '23 Wed, ', 'Mar 21', '07:32'],
    ['Usual', '09 Wed, ', 'Jan 20', '20:01'],
    ['Moderate', '23 Wed, ', 'Sept 21', '09:21'],
    ['High', '28 Fri, ', 'Feb 21', '12:20'],
    ['Usual', '23 Mon, ', 'Jan 22', '21:00'],
    ['Moderate', '23 Wed, ', 'Apr 21', '23:21'],
    ['High', '11 Sat, ', 'Jan 20', '20:09'],
    ['Usual', '23 Wed, ', 'Mar 21', '07:32'],
  ];
  */
  var labels = ['All', 'Usual', 'Moderate', 'High'];
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
      text: ' Usual ',
    ),
    Tab(
      text: ' Moderate ',
    ),
    Tab(
      text: ' High ',
    ),
  ];

  String description =
      "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusan tium dolorem que laudant ium. Totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. ";

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
    contWidths.add(padd)
    
    ;
    print("_______$contWidths");
    return contWidths;
  }

  List<List<String>> filter(val) {
    List<List<String>> filList = [];
    for (List<String> m in moodlog) {
      if (m[4] == mood) {
        if (m[0] == labels[val] || labels[val] == 'All') {
          filList.add(m);
        }
      }
    }
    return filList;
  }

  var textScaleFactor;
  var p2, contx;
  var scrollController = ScrollController();
  var q, lvl;
  List<List<List<String>>> listTabs = [];
  List<List<double>> listwidths = [];
  var tsf, w, mood, moodlog, totcount;
  _MoodDetailsState(q, lvl, contx, mood, moodlog) {
    this.q = q;
    this.lvl = lvl;
    this.mood = mood;
    this.moodlog = moodlog;
    this.totcount = 0;
    this.contx = contx;
    listTabs = [filter(0), filter(1), filter(2), filter(3)];
    this.tsf = MediaQuery.of(contx).textScaleFactor;
    this.w = MediaQuery.of(contx).size.width;
    for (List<String> m in moodlog) {
      if (m[4] == mood) {
        totcount = totcount + 1;
      }
    }
    listwidths = [
      bigText(listTabs[0], tsf, w),
      bigText(listTabs[1], tsf, w),
      bigText(listTabs[2], tsf, w),
      bigText(listTabs[3], tsf, w)
    ];
  }

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this)
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

  var tabSpaceX;
  Widget build(BuildContext context) {
    tabSpaceX = (MediaQuery.of(context).size.width -
            (20 +
                20 +
                getSize('All', context).longestSide +
                getSize('Usual', context).longestSide +
                getSize('Moderate', context).longestSide +
                getSize('High', context).longestSide)) /
        3;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: headerheight(2) + 15),
              child: DefaultTabController(
                length: 4,
                child: SafeArea(
                  child: NestedScrollView(
                    controller: scrollController,
                    scrollDirection: Axis.vertical,
                    body: TabBarView(
                      controller: _controller,
                      children: [
                        ListItems(listTabs[0], listwidths[0]),
                        ListItems(listTabs[1], listwidths[1]),
                        ListItems(listTabs[2], listwidths[2]),
                        ListItems(listTabs[3], listwidths[3])
                      ],
                    ),
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) => [
                      SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, top: 62, right: 20),
                              child: Text(q,
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w400)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Container(
                                    width: 88.0,
                                    height: 88.0,
                                    margin:
                                        EdgeInsets.only(left: 20.0, right: 18),
                                    decoration: BoxDecoration(
                                        color: Colors.grey[500],
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 10.0),
                                    child: RichText(
                                      text: TextSpan(
                                        style: TextStyle(color: Colors.black),
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: mood,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 24.0)),
                                          TextSpan(
                                              text: '\n' + totcount.toString(),
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            BarCards(lvl, 170),
                            GetPara(description)
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
                          padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
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
                            child: Text('Moods & \nSymptoms',
                                style: TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black)),
                          ),
                        ),
                        SizedBox(
                          height: 07.0,
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
