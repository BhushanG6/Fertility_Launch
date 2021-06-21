import 'package:flutter/material.dart';
import 'dart:math';

class BarCards extends StatelessWidget {
  List<int> lvls = [];
  //[high,medium,low]
  List<double> intensity;
  int padd;

  BarCards(moodlvl, padd) {
    this.padd = padd;
    this.lvls = moodlvl;
    this.intensity = [50, 50, 50];
  }
  void findLength(double w) {
    print("Lvls are:$lvls");
    int maxnum = lvls.reduce(max);
    intensity[0] = 50 + w * (lvls[0] / maxnum);
    intensity[1] = 50 + w * (lvls[1] / maxnum);
    intensity[2] = 50 + w * (lvls[2] / maxnum);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    findLength(width - padd);
    return Container(
      width: width,
      height: padd == 268 ? 94.0 : 120,
      padding: EdgeInsets.only(left: 20.0),
      margin: EdgeInsets.only(top: 41.0, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          padd == 268
              ? Container(
                  width: 88.0,
                  height: 88.0,
                  margin: EdgeInsets.only(right: 15.0),
                  decoration: BoxDecoration(
                      color: Colors.grey[500],
                      borderRadius: BorderRadius.circular(20.0)),
                )
              : SizedBox(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                children: <Widget>[
                  AnimatedContainer(
                    margin: EdgeInsets.only(right: 15.0),
                    width: lvls[0] == 0 ? 50 : intensity[0],
                    height: 7.0,
                    color: Color(0xffFF6262),
                    duration: Duration(seconds: 1),
                    curve: Curves.fastOutSlowIn,
                  ),
                  Text(lvls[0].toString(),
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w700,
                      ))
                ],
              ),
              Row(
                children: <Widget>[
                  AnimatedContainer(
                    margin: EdgeInsets.only(right: 15.0),
                    width: lvls[1] == 0 ? 50 : intensity[1],
                    height: 7.0,
                    color: Color(0xff35C0B8),
                    duration: Duration(seconds: 1),
                    curve: Curves.fastOutSlowIn,
                  ),
                  Text(lvls[1].toString(),
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w700,
                      ))
                ],
              ),
              Row(
                children: <Widget>[
                  AnimatedContainer(
                    margin: EdgeInsets.only(right: 15.0),
                    width: lvls[2] == 0 ? 50 : intensity[2],
                    height: 7.0,
                    color: Color(0xff007AFF),
                    duration: Duration(seconds: 1),
                    curve: Curves.fastOutSlowIn,
                  ),
                  Text(lvls[2].toString(),
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w700,
                      ))
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
