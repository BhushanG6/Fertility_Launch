import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'three_bars.dart';
import 'package:polygon_clipper/polygon_border.dart';
import 'package:flutter/cupertino.dart';
import 'dart:core';
import 'regirrlogs.dart';
import 'regular_p.dart';
import 'irregular.dart';
import 'initimacy.dart';
import 'pills.dart';
import 'flow.dart';
import 'notesgrid.dart';
import 'discharge.dart';
import 'testpreg.dart';
import 'testovul.dart';
import 'moods.dart';
import 'flowcontrol.dart';
var notedata;
void main() {
  runApp(MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.black,
        accentColor: Colors.grey,
      ),
      debugShowCheckedModeBanner: false,
      home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

final FlowController fController = new FlowController();

class _MyAppState extends State<MyApp> {
  _MyAppState() {
    this.lvl = [0, 0, 0];
  }

  var times = ['X 0', 'X 0', 'X 0', 'X 0', 'X 0'];
  var intimacy = [];
  var pills = [
    ['taken', '-'],
    ['missed', '-'],
    ['double', '-'],
    ['late', '-']
  ];
  var tests = [
    ['Pregnancy', '-'],
    ['Ovulation', '-'],
  ];
  var gradclrs = [
    [Color.fromRGBO(255, 166, 166, 0.7), Color.fromRGBO(255, 149, 149, 0.07)],
    [Color.fromRGBO(253, 255, 139, 0.7), Color.fromRGBO(253, 255, 154, 0.21)],
    [Color.fromRGBO(46, 154, 215, 0.7), Color.fromRGBO(236, 236, 236, 0.42)]
  ];

  void initState() {
    this.monthmap = fController.monthmap;
    this.weekmap = fController.weekmap;
    getdata();
  }

  var flowdata, lvl;
  var monthmap, weekmap;
  
  int lcount = -1, mcount = -1, hcount = -1, scount = -1;
  getdata() async {
    //Flow
    await fController
        .fetchNotif(
            "https://project31-heroku.herokuapp.com/api/v11/user/patient/flows/asdfwer12423525as")
        .then((value) {
      setState(() {
        flowdata = value['data'];

        for (int i = 0; i < flowdata.length; i++) {
          lcount = flowdata[flowdata.length - 1]['lightCount'];
          mcount = flowdata[flowdata.length - 1]['mediumCount'];
          hcount = flowdata[flowdata.length - 1]['heavyCount'];
          scount = flowdata[flowdata.length - 1]['spottingCount'];
          this.lvl = [hcount, mcount, lcount];
        }
      });
    });
//Notes
await fController
        .fetchNotif(
            "https://project31-heroku.herokuapp.com/api/v11/user/patient/notes/asdfwer12423525as")
        .then((value) {
      setState(() {
        notedata = value['data'];

      });
    });
    //Ovulation
    await fController
        .fetchNotif(
            "https://project31-heroku.herokuapp.com/api/v11/user/patient/allovulation/asdfwer12423525as")
        .then((value) {
      setState(() {
        String date1, date2;
        flowdata = value['data'];
        String strDate = flowdata[flowdata.length - 1]["Date"];
        DateTime todayDate = DateTime.parse(strDate);
        date1 = todayDate.day.toString() +
            " " +
            weekmap[todayDate.weekday].toString() +
            ", ";
        date2 = monthmap[todayDate.month].toString() +
            " " +
            (todayDate.year).toString().substring(2);

        tests[1][1] = date1 + date2;
      });
    });

    //Pregnancy
    await fController
        .fetchNotif(
            "https://project31-heroku.herokuapp.com/api/v11/user/patient/allpregnancy/asdfwer12423525as")
        .then((value) {
      setState(() {
        String date1, date2;
        flowdata = value['data'];
        String strDate = flowdata[flowdata.length - 1]["Date"];
        DateTime todayDate = DateTime.parse(strDate);
        date1 = todayDate.day.toString() +
            " " +
            weekmap[todayDate.weekday].toString() +
            ", ";
        date2 = monthmap[todayDate.month].toString() +
            " " +
            (todayDate.year).toString().substring(2);

        tests[0][1] = date1 + date2;
        print("Test:$tests");
      });
    });
    //Pills
    await fController
        .fetchNotif(
            "https://project31-heroku.herokuapp.com/api/v11/user/patient/pills/asdfwer12423525as")
        .then((value) {
      setState(() {
        String date1, date2;
        flowdata = value['data'];
        for (int i = flowdata.length - 1; i >= 0; i--) {
          String strDate = flowdata[i]["pillDate"];
          DateTime todayDate = DateTime.parse(strDate);
          date1 = todayDate.day.toString() +
              " " +
              weekmap[todayDate.weekday].toString() +
              ", ";
          date2 = monthmap[todayDate.month].toString() +
              " " +
              (todayDate.year).toString().substring(2);

          if (flowdata[i]['taken'] == true) {
            if (pills[0][1] == '-') {
              pills[0][1] = date1 + date2;
            }
          } if (flowdata[i]['missed'] == true) {
            if (pills[1][1] == '-') {
              pills[1][1] = date1 + date2;
            }
          } if (flowdata[i]['double'] == true) if (pills[2][1] == '-') {
            pills[2][1] = date1 + date2;
          } if (flowdata[i]['late'] == true) if (pills[3][1] == '-') {
            pills[3][1] = date1 + date2;
          }
        }
      });
    });

    //Discharge

    await fController
        .fetchNotif(
            "https://project31-heroku.herokuapp.com/api/v11/user/patient/allDischarge/asdfwer12423525as")
        .then((value) {
      setState(() {
        flowdata = value['data'];
        var dcount = 0, scount = 0, ccount = 0, wcount = 0, ecount = 0;
        for (int i = 0; i < flowdata.length; i++) {
          if (flowdata[i]['dry'] == true)
            dcount = dcount + 1;
          else if (flowdata[i]['sticky'] == true)
            scount = scount + 1;
          else if (flowdata[i]['creamy'] == true)
            ccount = ccount + 1;
          else if (flowdata[i]['watery'] == true)
            wcount = wcount + 1;
          else
            ecount = ecount + 1;
        }
        times = [
          'X ' + dcount.toString(),
          'X ' + scount.toString(),
          'X ' + ccount.toString(),
          'X ' + wcount.toString(),
          'X ' + ecount.toString()
        ];
      });
    });

    //Intimacy
    await fController
        .fetchNotif(
            "https://project31-heroku.herokuapp.com/api/v11/user/patient/allIntimacy/asdfwer12423525as")
        .then((value) {
      setState(() {
        flowdata = value['data'];
        //['March', 'x198', 'x5']
        String date2;

        //Generating the list
        var monthInti = {};
        int m, tpc;
        for (int i = flowdata.length - 1; i >= 0; i--) {
          if (flowdata[i]['protected'] == true) {
            m = 1;
            tpc = flowdata[i]['protectedCount'];
          } else {
            m = 0;
            tpc = flowdata[i]['unProtectedCount'];
          }
          print("TPC:$tpc");
          String strDate = flowdata[i]["Date"];
          DateTime todayDate = DateTime.parse(strDate);

          date2 = monthmap[todayDate.month].toString();
          if (monthInti.containsKey(date2)) {
            monthInti[date2][m] = monthInti[date2][m] + tpc;
          } else if (monthInti.length <= 3) {
            monthInti[date2] = [0, 0];
            monthInti[date2][m] = monthInti[date2][m] + tpc;
          }
        }
        print("Initiamcy recent months are:$monthInti");
        for (var k in monthInti.keys) {
          intimacy.add([
            k,
            "X" + monthInti[k][0].toString(),
            "X" + monthInti[k][1].toString()
          ]);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double boxwidth = width - 65;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            
            children: [
               Icon(
      Icons.arrow_downward,
      color: Colors.black,
      size: 24.0,
     
    ),
              Expanded(
                              child: Container(
                    child: SingleChildScrollView(
                      dragStartBehavior: DragStartBehavior.start,
                        //scrollDirection: Axis.vertical,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, top: 30, bottom: 40.0),
                                child: Text('Reports',
                                    style: TextStyle(
                                        fontSize: 28.0, fontWeight: FontWeight.w600)),
                              ),
                              FlatButton(
                                padding: EdgeInsets.all(0),
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Text('Moods & Symptoms',
                                          style: TextStyle(
                                              fontSize: 22.0,
                                              fontWeight: FontWeight.w500)),
                                    ),
                                    SizedBox(
                                      height: 7.0,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 0, bottom: 35),
                                      child: Text('Your mostly logged activity',
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w500)),
                                    ),
                                  ],
                                ),
                                onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MoodsPage()),
                                ),
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: <Widget>[
                                    for (int i = 0; i < 24; i++) CommonCards(),
                                    SizedBox(
                                      width: 20,
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20, top: 40),
                                child: Text('Averages',
                                    style: TextStyle(
                                        fontSize: 22.0, fontWeight: FontWeight.w500)),
                              ),
                              SizedBox(
                                height: 7.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20, bottom: 35),
                                child: Text('Your mostly logged feels and struggles',
                                    style: TextStyle(
                                        fontSize: 15.0, fontWeight: FontWeight.w400)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20, right: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      width: boxwidth / 2,
                                      height: 120.0,
                                      decoration: BoxDecoration(
                                          color: Color(0xffB45FDC),
                                          borderRadius: BorderRadius.circular(12.0)),
                                      child: Stack(
                                        alignment: Alignment.topLeft,
                                        children: <Widget>[
                                          Text('Cycle',
                                              style: TextStyle(
                                                  fontSize: 24.0,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.white)),
                                          Container(
                                            margin: EdgeInsets.only(top: 40),
                                            child: Text('Your cycles are going good',
                                                style: TextStyle(
                                                    fontSize: 15.0,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color(0xffD1D1D1))),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: 70),
                                            child: Row(
                                              children: <Widget>[
                                                Expanded(child: SizedBox()),
                                                Text('29d',
                                                    style: TextStyle(
                                                        fontSize: 22.0,
                                                        fontWeight: FontWeight.w500,
                                                        color: Colors.white)),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: boxwidth / 2,
                                      height: 120.0,
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: Color(0xffCD5454),
                                          borderRadius: BorderRadius.circular(12.0)),
                                      child: Stack(
                                        alignment: Alignment.topLeft,
                                        children: <Widget>[
                                          Text('Period',
                                              style: TextStyle(
                                                  fontSize: 24.0,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.white)),
                                          Container(
                                            margin: EdgeInsets.only(top: 40),
                                            child: Text('Your average has changed',
                                                style: TextStyle(
                                                    fontSize: 15.0,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color(0xffD1D1D1))),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: 70),
                                            child: Row(
                                              children: <Widget>[
                                                Expanded(child: SizedBox()),
                                                Text('5d',
                                                    style: TextStyle(
                                                        fontSize: 22.0,
                                                        fontWeight: FontWeight.w500,
                                                        color: Colors.white)),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20, top: 40),
                                child: Text('Phases',
                                    style: TextStyle(
                                        fontSize: 22.0, fontWeight: FontWeight.w500)),
                              ),
                              SizedBox(
                                height: 7.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20, bottom: 30),
                                child: Text('Your mostly logged feels and struggles',
                                    style: TextStyle(
                                        fontSize: 15.0, fontWeight: FontWeight.w400)),
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 20,
                                    ),
                                    for (var gr in gradclrs) GradientCards(gr),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20, right: 20),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    FlatButton(
                                      padding: EdgeInsets.all(0.0),
                                      onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ReIrLogs(context)),
                                      ),
                                      child: Text('Regular',
                                          style: TextStyle(
                                              fontSize: 22.0,
                                              fontWeight: FontWeight.w500)),
                                    ),
                                    Container(
                                      width: 80,
                                      height: 80,
                                      child: FloatingActionButton(
                                        backgroundColor: Colors.grey[300],
                                        elevation: 0,
                                        shape: PolygonBorder(
                                          sides: 8,
                                          borderRadius: 5.0,
                                          rotate: 0.0,
                                        ),
                                        onPressed: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ReIrLogs(context)),
                                        ),
                                        child: Text('V/S',
                                            style: TextStyle(
                                                fontSize: 25.0,
                                                fontWeight: FontWeight.w500)),
                                      ),
                                    ),
                                    FlatButton(
                                      padding: EdgeInsets.all(0.0),
                                      onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ReIrLogs(context)),
                                      ),
                                      child: Text('ir Regular',
                                          style: TextStyle(
                                              fontSize: 22.0,
                                              fontWeight: FontWeight.w500)),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20.0, 0, 10, 20),
                                child: FlatButton(
                                  padding: EdgeInsets.all(0.0),
                                  onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => RegularPeriod()),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'Regular Periods',
                                        style: TextStyle(
                                            fontSize: 18.0,
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
                                                  ReIrLogs(context)),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                color: Color(0xff4A4A4A),
                                height: 0.3,
                                margin: EdgeInsets.only(left: 20, bottom: 20),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20.0, 0, 10, 20),
                                child: FlatButton(
                                  padding: EdgeInsets.all(0.0),
                                  onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => IrRegularPeriod()),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'ir Regular Periods',
                                        style: TextStyle(
                                            fontSize: 18.0,
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
                                                  ReIrLogs(context)),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                color: Color(0xff4A4A4A),
                                height: 0.3,
                                margin: EdgeInsets.only(left: 20, bottom: 20),
                              ),
                              Container(
                                child: FlatButton(
                                  padding: EdgeInsets.all(0.0),
                                  onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FlowPage(context)),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(left: 20, top: 20),
                                        child: Text('Flow and Discharge',
                                            style: TextStyle(
                                                fontSize: 22.0,
                                                fontWeight: FontWeight.w500)),
                                      ),
                                      SizedBox(
                                        height: 7.0,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 20.0),
                                        child: Text(
                                            'your logs from the very beginning of your period',
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.w400)),
                                      ),
                                      BarCards(lvl, 150),
                                    ],
                                  ),
                                ),
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: FlatButton(
                                  padding: EdgeInsets.all(0),
                                  onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DischargePage(context)),
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      SizedBox(
                                        width: 20,
                                      ),
                                      for (var m in times)
                                        Container(
                                          margin: EdgeInsets.only(right: 20, top: 41),
                                          child: Row(
                                            children: <Widget>[
                                              Container(
                                                margin: EdgeInsets.only(right: 10),
                                                width: 68.0,
                                                height: 68.0,
                                                decoration: BoxDecoration(
                                                    color: Colors.grey[400],
                                                    borderRadius:
                                                        BorderRadius.circular(68.0)),
                                              ),
                                              Text(m,
                                                  style: TextStyle(
                                                      fontSize: 22.0,
                                                      fontWeight: FontWeight.w500)),
                                            ],
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                              FlatButton(
                                padding: EdgeInsets.all(0),
                                onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => IntimacyTab(context)),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 20, top: 40),
                                      child: Text('Intimacy',
                                          style: TextStyle(
                                              fontSize: 22.0,
                                              fontWeight: FontWeight.w500)),
                                    ),
                                    SizedBox(
                                      height: 7.0,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 20, bottom: 40),
                                      child: Text(
                                          'your mostly logged feels and struggles',
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w400)),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.fromLTRB(26, 11, 26, 11),
                                    margin: EdgeInsets.only(left: 20.0, bottom: 37),
                                    height: 50.0,
                                    width: (width - 85) / 2,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12.0),
                                        color: Color.fromRGBO(226, 226, 226, 0.5)),
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
                                    margin: EdgeInsets.only(right: 20.0, bottom: 37),
                                    height: 50.0,
                                    width: (width - 85) / 2,
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
                              for (var initem in intimacy) EntryRow(initem),
                              FlatButton(
                                padding: EdgeInsets.all(0.0),
                                onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PillsTab(context)),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 20, top: 10),
                                      child: Text('Pills',
                                          style: TextStyle(
                                              fontSize: 22.0,
                                              fontWeight: FontWeight.w500)),
                                    ),
                                    SizedBox(
                                      height: 7.0,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 20, bottom: 40),
                                      child: Text('This log is of your current month',
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w400)),
                                    ),
                                  ],
                                ),
                              ),
                              for (var p in pills) EntryRow(p),
                              Padding(
                                padding: const EdgeInsets.only(left: 20, top: 10),
                                child: Text('Test',
                                    style: TextStyle(
                                        fontSize: 22.0, fontWeight: FontWeight.w500)),
                              ),
                              SizedBox(
                                height: 7.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20, bottom: 40),
                                child: Text('your mostly logged feels and struggles',
                                    style: TextStyle(
                                        fontSize: 15.0, fontWeight: FontWeight.w400)),
                              ),
                              FlatButton(
                                  padding: EdgeInsets.all(0.0),
                                  onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PregTestPage(context)),
                                      ),
                                  child: EntryRow(tests[0])),
                              FlatButton(
                                  padding: EdgeInsets.all(0.0),
                                  onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                OvulTestPage(context)),
                                      ),
                                  child: EntryRow(tests[1])),
                              FlatButton(
                                padding: EdgeInsets.all(0.0),
                                onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Notes()),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 20, top: 10),
                                      child: Text('Notes',
                                          style: TextStyle(
                                              fontSize: 22.0,
                                              fontWeight: FontWeight.w500)),
                                    ),
                                    SizedBox(
                                      height: 7.0,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 20, bottom: 40),
                                      child: Text(
                                          'your mostly logged feels and struggles',
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w400)),
                                    ),
                                  ],
                                ),
                              ),
                            ]))),
              ),
            ],
          ),
        ));
  }
}

class GradientCards extends StatelessWidget {
  var grclr;
  GradientCards(var grclr) {
    this.grclr = grclr;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(15, 20, 15, 10),
        margin: EdgeInsets.only(right: 20),
        height: 255,
        width: 130,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            gradient: LinearGradient(
                stops: [0.1, 1],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [grclr[0], grclr[1]])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 10),
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Colors.grey[300]),
            ),
            Text('Fertile',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600)),
            Text('Phase',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w400)),
            SizedBox(
              height: 20.0,
            ),
            RichText(
              text: TextSpan(
                style: TextStyle(color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                      text: '17 ',
                      style: TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 24.0)),
                  TextSpan(
                      text: 'Feb ',
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 24.0)),
                  TextSpan(
                      text: 'to\n',
                      style: TextStyle(
                          fontWeight: FontWeight.w300, fontSize: 24.0)),
                  TextSpan(
                      text: '23 ',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
                  TextSpan(
                      text: 'Feb',
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 24.0)),
                ],
              ),
            ),
          ],
        ));
  }
}

class HorizonLine extends StatelessWidget {
  const HorizonLine({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff4A4A4A),
      height: 1,
      margin: EdgeInsets.only(left: 20, bottom: 30, right: 20, top: 8),
    );
  }
}

class EntryRow extends StatelessWidget {
  var initem;
  int l;
  EntryRow(var initem) {
    this.initem = initem;
    this.l = initem.length;
    print(initem);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 0, 10, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                initem[0],
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w400),
              ),
              Expanded(child: SizedBox()),
              l != 2
                  ? Container(
                      width: 80,
                      margin: EdgeInsets.only(
                        right: 15,
                      ),
                      padding: EdgeInsets.fromLTRB(9, 4, 9, 3),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Color.fromRGBO(196, 196, 196, 0.3),
                      ),
                      child: Text(
                        initem[1],
                        style: TextStyle(
                            fontSize: 22.0, fontWeight: FontWeight.w400),
                      ),
                    )
                  : SizedBox(),
              l != 2
                  ? Text(
                      '|',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w900),
                    )
                  : SizedBox(),
              Container(
                width: l == 2 ? 180 : 85,
                margin: EdgeInsets.only(
                  left: l == 2 ? 0 : 15,
                ),
                padding: EdgeInsets.fromLTRB(9, 4, 9, 3),
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.white,
                ),
                child: Text(
                  l == 2 ? initem[1] : initem[2],
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        ),
        HorizonLine(),
      ],
    );
  }
}

class CommonCards extends StatelessWidget {
  const CommonCards({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 79.0,
      height: 79.0,
      margin: EdgeInsets.only(
        left: 20.0,
      ),
      decoration: BoxDecoration(
          color: Colors.grey[500], borderRadius: BorderRadius.circular(20.0)),
    );
  }
}
