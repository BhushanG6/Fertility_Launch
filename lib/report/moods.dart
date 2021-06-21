import 'package:flutter/material.dart';
import 'moodcalander.dart';
import 'package:flutter/services.dart';
import 'flowcontrol.dart';
import 'three_bars.dart';

class MoodsPage extends StatefulWidget {
  @override
  _MoodsPageState createState() => _MoodsPageState();
}

final FlowController fController = new FlowController();

class _MoodsPageState extends State<MoodsPage> {
  var moodbars, doneloading;
  List<List<String>> moodlog;
  _MoodsPageState() {
    this.moodlog = [];
    this.moodbars = {};
    this.doneloading = false;
  }
  @override
  void initState() {
    super.initState();
    this.monthmap = fController.monthmap;
    this.weekmap = fController.weekmap;
    getdata();
  }

  var flowdata, monthmap, weekmap;
  int sum;
  var alllogs = [];
  var most = {}, common = {}, rarer = {};
  void seperate(moodbars) {
    print("In seperate:$moodbars");
    for (var k in moodbars.keys) {
      sum = 0;
      for (var j in moodbars[k]) {
        sum = sum + j;
      }
      alllogs.add([k, sum]);
    }

    int minimum = 9999999, maximum = 0;
    for (var e in alllogs) {
      if (e[1] > maximum) maximum = e[1];
      if (e[1] < minimum) minimum = e[1];
    }
    print("Minimum:$minimum|Maximum:$maximum");
    var divsion = (maximum - minimum) / 3;
    for (var v in alllogs) {
      if (v[1] < divsion + minimum)
        rarer[v[0]] = moodbars[v[0]];
      else if (v[1] < divsion * 2 + minimum)
        common[v[0]] = moodbars[v[0]];
      else if (v[1] <= maximum) most[v[0]] = moodbars[v[0]];
    }
    if (common.isEmpty) {
      print("Performing exchange!");
      common = rarer;
      rarer = {};
    }
    print("Seperated elements are:\n$most,\n$common,\n$rarer");
  }

  void routine(i, flow, mood) {
    var date1, date2, tym;
    String strDate = flowdata[i]["date"];
    print("________Date:$strDate");
    DateTime todayDate = DateTime.parse(strDate);
    date1 = todayDate.day.toString() +
        " " +
        weekmap[todayDate.weekday].toString() +
        ", ";
    date2 = monthmap[todayDate.month].toString() +
        " " +
        (todayDate.year).toString().substring(2);
    tym = todayDate.hour.toString() + ":" + todayDate.minute.toString();
    int m;
    if (flow == 'Usual')
      m = 1;
    else if (flow == 'Moderate')
      m = 2;
    else
      m = 3;
    if (moodbars.containsKey(mood)) {
      moodbars[mood][m - 1]++;
    } else {
      moodbars[mood] = [0, 0, 0];
      moodbars[mood][m - 1]++;
    }

    this.moodlog.add([flow, date1, date2, tym, mood]);
  }

  getdata() async {
    await fController
        .fetchNotif(
            "https://project31-heroku.herokuapp.com/api/v11/user/patient/moods/asdfwer12423525as")
        .then((value) {
      setState(() {
        flowdata = value['data'];
        print("Moods dat:$flowdata");
        String flow, mood;

        //Generating the list

        var lvlsymtom = {1: 'Usual', 2: 'Moderate', 3: 'High'};
        for (int i = 0; i < flowdata.length; i++) {
          for (var k in flowdata[i].keys) {
            if (flowdata[i][k] != 0 &&
                k != "_id" &&
                k != "patientId" &&
                k != "date" &&
                k != "__v") {
              flow = lvlsymtom[flowdata[i][k]];
              mood = k;
              routine(i, flow, mood);
            }
          }
        }
        print("____________------____________-----_____________");
        print(moodlog);
        seperate(moodbars);

        doneloading = true;
      });
    });
  }

  //[high,medium,usual] for each mood
  var moodlvl = [
    [124, 94, 49],
    [99, 130, 34],
    [3, 55, 100],
    [23, 67, 34]
  ];
  List<String> comm = ['path1', 'path2', 'path3', 'path4', 'path5'];
  List<String> rare = ['path1', 'path2', 'path3', 'path4', 'path5'];
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: doneloading == false
                ? Center(child: Text("Loading.."))
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 40, 0, 0),
                        child: IconButton(
                          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text('Moods &\nSymptoms',
                            style: TextStyle(
                                fontSize: 22.0, fontWeight: FontWeight.w500)),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text('your mostly logged feels and struggles',
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.w400)),
                      ),
                      for (var v in most.keys)
                        FlatButton(
                            padding: EdgeInsets.all(0),
                            onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MoodDetails(
                                          most[v],
                                          'your mostly logged feels and struggles',
                                          context,
                                          v,
                                          moodlog)),
                                ),
                            child: BarCards(moodbars[v], 268)),
                      common.isEmpty
                          ? SizedBox()
                          : Padding(
                              padding:
                                  const EdgeInsets.only(top: 50.0, left: 20.0),
                              child: Text('Your Commons',
                                  style: TextStyle(
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.w500)),
                            ),
                      SizedBox(
                        height: 7.0,
                      ),
                      common.isEmpty
                          ? SizedBox()
                          : Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text('your common logs.',
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w400)),
                            ),
                      common.isEmpty
                          ? SizedBox()
                          : Padding(
                              padding: const EdgeInsets.only(top: 30.0),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    for (var c in comm) CommonCards(),
                                  ],
                                ),
                              ),
                            ),
                      for (var v in common.keys)
                        FlatButton(
                            padding: EdgeInsets.all(0),
                            onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MoodDetails(
                                          common[v],
                                          'your common logs.',
                                          context,
                                          v,
                                          moodlog)),
                                ),
                            child: BarCards(moodbars[v], 268)),
                      rarer.isEmpty
                          ? SizedBox()
                          : Padding(
                              padding:
                                  const EdgeInsets.only(top: 53.0, left: 20.0),
                              child: Text("Your Rare's",
                                  style: TextStyle(
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.w500)),
                            ),
                      SizedBox(
                        height: 7.0,
                      ),
                      rarer.isEmpty
                          ? SizedBox()
                          : Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text(
                                  'This is rare with you,sometimes do enjoy this feelings.',
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w400)),
                            ),
                      rarer.isEmpty
                          ? SizedBox()
                          : Padding(
                              padding: const EdgeInsets.only(top: 30.0),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    for (var r in rare) CommonCards(),
                                  ],
                                ),
                              ),
                            ),
                      for (var v in rarer.keys)
                        FlatButton(
                            padding: EdgeInsets.all(0),
                            onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MoodDetails(
                                          rarer[v],
                                          'This is rare with you,sometimes do enjoy this feelings.',
                                          context,
                                          v,
                                          moodlog)),
                                ),
                            child: BarCards(moodbars[v], 268)),
                      SizedBox(
                        height: 50.0,
                      )
                    ],
                  ),
          ),
        ),
      ),
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
      width: 69.0,
      height: 69.0,
      margin: EdgeInsets.only(right: 15.0, left: 15.0),
      decoration: BoxDecoration(
          color: Colors.grey[500], borderRadius: BorderRadius.circular(20.0)),
    );
  }
}
