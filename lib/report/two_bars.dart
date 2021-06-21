import 'package:flutter/material.dart';
import 'dart:math';

class TwoBars extends StatelessWidget {
  List<int> lvls = [];
  //[reg,irregular]
  List<double> intensity;
  int padd;
  var recentdate;
  Color barclr1, barclr2;
  String lab1, lab2;
  TwoBars(moodlvl, padd, recentdate, barclr1, barclr2, lab1, lab2) {
    this.padd = padd;
    this.lvls = moodlvl;
    this.intensity = [50, 50];
    this.recentdate = recentdate;
    this.barclr1 = barclr1;
    this.barclr2 = barclr2;
    this.lab1 = lab1;
    this.lab2 = lab2;
  }
  void findLength(double w) {
    int maxnum = lvls.reduce(max);
    intensity[0] = 50 + w * (lvls[0] / maxnum);
    intensity[1] = 50 + w * (lvls[1] / maxnum);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    findLength(width - padd);

    return Container(
        width: width,
        padding: EdgeInsets.only(left: 20.0),
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                AnimatedContainer(
                  margin: EdgeInsets.only(right: 10.0, bottom: 5.0),
                  width: lvls[0] == 0 ? 50 : intensity[0],
                  height: 7.0,
                  color: barclr1,
                  duration: Duration(seconds: 1),
                  curve: Curves.fastOutSlowIn,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color:
                        lab1 == 'Protected' ? Colors.grey[300] : Colors.white,
                  ),
                  child: Text(lvls[0].toString(),
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w700,
                      )),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Text(lab1,
                      style: TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.w500)),
                ),
                RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                          text: recentdate[0][0],
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 16.0)),
                      TextSpan(
                          text: recentdate[0][1],
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w300)),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AnimatedContainer(
                  margin: EdgeInsets.only(right: 10.0, top: 28.0),
                  width: lvls[1] == 0 ? 50 : intensity[1],
                  height: 7.0,
                  color: barclr2,
                  duration: Duration(seconds: 1),
                  curve: Curves.fastOutSlowIn,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(top: 20.0),
                  child: Text(lvls[1].toString(),
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff4A4A4A))),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Text(lab2,
                      style: TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.w500)),
                ),
                RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                          text: recentdate[1][0],
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 16.0)),
                      TextSpan(
                          text: recentdate[1][1],
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w300)),
                    ],
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
