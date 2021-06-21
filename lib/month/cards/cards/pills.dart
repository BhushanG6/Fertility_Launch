import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../components/swipeable_card.dart';
import '../constants.dart';
import '../provider.dart/card_provider.dart';
import '../utilities.dart';
import '../cardglobal.dart';
import '../getapi.dart';
enum PillType { Taken, Missed, Late,Double, Nothing }
 final Map<String,String> pillpathC={'Taken':'assets/pill/pill5.svg','Missed' :'assets/pill/pill6.svg', 'Late':'assets/pill/pill7.svg','Double':'assets/pill/pill8.svg'};
  final Map<String,String> pillpath={'Taken':'assets/pill/pill1.svg','Missed' :'assets/pill/pill2.svg', 'Late':'assets/pill/pill3.svg','Double':'assets/pill/pill4.svg'};
class PillsCard extends StatefulWidget {
  @override
  _PillsCardState createState() => _PillsCardState();
}

class _PillsCardState extends State<PillsCard> {
  final color = Color(0xFFFF0A0A);
  final index = 4;
  PillType pillType;
  void initState() {
    pillType = PillType.Nothing;
    getdata();
    print(pillType);

    super.initState();
  }
 getdata() async {
    await getPills().then((value) {
      print(value);
      for (int i = 0; i < 4; i++) {
        if (value['data'][value['data'].length - 1][pillList[i]])
          pillType = PillType.values[i];
      }
    });
  }
  void changePillType(PillType newPillType) {
    setState(() {
      if (newPillType == this.pillType)
      {
        this.pillType = PillType.Nothing;
        pill[pillType.toString().substring(9)] = false;
         pillchange=true;

      }
      else
      {
        
         pill['Taken'] = false;
         pill['Missed'] = false;
         pill['Late'] = false;
         pill['Double']=false;
         this.pillType = newPillType;
         pill[pillType.toString().substring(9)] = true;
         pillchange=true;
      }
    
    });
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
    
      child: SwipableCard(
        index: index,
        borderColor: color,
        topHeight: height/2,
        title: "Pills",
        child: Padding(
  padding: EdgeInsets.fromLTRB(0,40,0,0),          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              pillButton(PillType.Taken),
              pillButton(PillType.Missed),
              pillButton(PillType.Late),
              pillButton(PillType.Double),
            ],
          ),
        ),
      ),
    );
  }

  Widget pillButton(PillType pillType) {
    return Container(
      //padding: EdgeInsets.only(top:0),
      child: GestureDetector(
        onTap: () {
          changePillType(pillType);
          
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
             
                  child: SvgPicture.asset(( this.pillType == pillType?pillpathC[pillType.toString().substring(9)]:pillpath[pillType.toString().substring(9)]),height: MediaQuery.of(context).size.height/812*90,fit: BoxFit.cover,)
            ),
             SizedBox(
               height: 20,
             ),
            Text(
             pillType.toString().substring(9),
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontFamily: 'SF Pro Text',
                  fontSize: 13,
                  letterSpacing: 0,
                  fontWeight: this.pillType == pillType
                      ? FontWeight.bold
                      : FontWeight.normal,
                  height: 1),
            ),
          ],
        ),
      ),
    );
  }
}
