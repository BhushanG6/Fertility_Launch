// library upcloud.globals;

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

String p12;
bool onTappedSteps = false;
bool onTappedRunning = false;
bool onTappedSwimming = false;
bool onTappedYoga = false;
bool onTappedCycling = false;
bool onTappedGym = false;
List<DateTime> selectedDates = [];
List<DateTime> red = [];
List<DateTime> blue = [];
List<String> dates = [
  "",
  "Jan",
  "Feb",
  "Mar",
  "Apr",
  "May",
  "Jun",
  "Jul",
  "Aug",
  "Sep",
  "Oct",
  "Nov",
  "Dec"
];
DateTime pq;

DateTime qr =
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

dynamic doit(DateTime d, Map<dynamic, dynamic> lop) {
  lop.forEach((k, v) => {
        k == d ? lop[k] = true : lop[k] = false,
      });
  return lop;
}

dynamic doit2(DateTime d, Map<dynamic, dynamic> lop2) {
  lop2.forEach((k, v) => {
        k == d ? lop2[k] = true : lop2[k] = false,
      });
  return lop2;
}

Map<dynamic, dynamic> lop = Map();
Map<dynamic, dynamic> missed = Map();
Map<dynamic, dynamic> lop2 = {
  DateTime(2021, 1, 5): 1,
  DateTime(2021, 1, 6): 1,
  DateTime(2021, 1, 8): 1,
  DateTime(2021, 2, 8): 1,
  DateTime(2021, 1, 29): 1,
};

Map<dynamic, dynamic> lop3 = {
  DateTime(2021, 1, 15): 1,
  DateTime(2021, 1, 16): 1,
  DateTime(2021, 1, 18): 1,
  DateTime(2021, 1, 28): 1,
  DateTime(2021, 2, 5): 1,
};
//Map();

DateTime d = DateTime.now();
DateTime d1 = DateTime.now();
DateTime d2 = DateTime.now();

List<DateTime> calculateDaysInterval(DateTime startDate, DateTime endDate) {
  List<DateTime> days = [];
  for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
    days.add(startDate.add(Duration(days: i)));
  }
  return days;
}

final myController = TextEditingController();

String str = '';
Map<dynamic, dynamic> icons = {
  'bloodflow': Image.asset('assets/images/filled_circle.png',
      height: 10, width: 10, fit: BoxFit.cover),
  'pills': Image.asset('assets/images/filled_circle.png',
      height: 10, width: 10, fit: BoxFit.cover),
  'mns': Image.asset('assets/images/pentagon.png',
      height: 10, width: 10, fit: BoxFit.cover),
  'intimacy': Image.asset('assets/images/heart.png',
      height: 10, width: 10, fit: BoxFit.cover),

  //Icon(Icons.remove, size: 10),
  'tests': Image.asset('assets/images/test_tube.png',
      height: 10, width: 10, fit: BoxFit.cover),

  // Icon(Icons.arrow_forward, size: 10),
  'discharge': Image.asset('assets/images/filled_circle.png',
      height: 10, width: 10, fit: BoxFit.cover),
  'notes': Image.asset('assets/images/pencil.png',
      height: 10, width: 10, fit: BoxFit.cover),
  'pentagon': Image.asset('assets/images/pentagon.png',
      height: 10, width: 10, fit: BoxFit.cover),
};
Map<dynamic, Map> li = Map();
Map<dynamic, bool> lis = Map();
//{widget.date:false}

//li[date][0]['bloodflow']='';
//date:['blo':'l']
//gb.li[gb.d]['bloodflow']='l';
// li={Datetime.now():[],}

// onpreclick
// {
//   li[date].add('bloodflow':Icon(Icons.add));
// }

// li[date].contains('bloodflow') =>yes
// //li[date].remove

// 18 Oct 2020 -> ['bloodflow'->Icon]

// Map<DateTime,List<dynamic> > li;
//'10 Oct 20202' :['bloodflow':Icon1,'pills':Icon2,];

//Map<DateTime,List<dynamici > li

Map<int, int> mainq() {
  //List<int> days_month = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
  Map<int, int> mp = new Map();
  DateTime todayDate;

  // ignore: unused_local_variable
  List<int> months = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
  for (int k = 2020; k < 2030; k++) {
    for (int i = 0; i < 12; i++) {
      todayDate = DateFormat.yMd('en_US').parse("${i + 1}/1/$k");
      mp[(i + 1) * k] = todayDate.add(Duration(days: 1)).weekday;
    }
  }

  return mp;
}

bool lala = true;

Widget as() {
  return DraggableScrollableSheet(
    initialChildSize: 0.5,
    builder: (BuildContext cxt, ScrollController scrollController) {
      return ListView(
        controller: scrollController,
        children: [
          Container(
            height: (MediaQuery.of(cxt).size.height - 82) / 2,
            width: MediaQuery.of(cxt).size.width,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.0),
                topRight: Radius.circular(24.0),
              ),
            ),
          ),
        ],
      );
    },
    // child:
  );
}
