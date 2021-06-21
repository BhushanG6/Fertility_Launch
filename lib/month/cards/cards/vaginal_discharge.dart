import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../components/swipeable_card.dart';
import '../cardglobal.dart';
import '../getapi.dart';
enum DisType {  Dry,Sticky,Creamy, Watery, Egg,Nothing }
final Map<String,String> dispathC={'Creamy':'assets/vag/vag6.svg','Egg' :'assets/vag/vag7.svg', 'Watery':'assets/vag/vag8.svg','Sticky':'assets/vag/vag9.svg','Dry':'assets/vag/vag10.svg'};
final Map<String,String> dispath={'Creamy':'assets/vag/vag1.svg','Egg' :'assets/vag/vag2.svg', 'Watery':'assets/vag/vag3.svg','Sticky':'assets/vag/vag4.svg','Dry':'assets/vag/vag5.svg'};
class VaginalDischarge extends StatefulWidget {
  @override
  _VaginalDischargeState createState() => _VaginalDischargeState();
}

class _VaginalDischargeState extends State<VaginalDischarge> {
  final color = Color.fromRGBO(46, 154, 215, 1);
  final index = 1;
  DisType disType;
 void initState() {
   
    disType = DisType.Nothing;
    getdata();
    super.initState();
  }
  getdata() async {
    await getDischarge().then((value) {
      print(value);
      for (int i = 0; i < 5; i++) {
        if (value['data'][value['data'].length - 1][disList[i]])
          selectval[DisType.values[i].toString().substring(8)] =true;
       
      }
      on = value['data'][value['data'].length - 1][flowList[3]];
    });
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Container(
      child: SwipableCard(
        index: index,
        borderColor: color,
        topHeight: height / 4,
        title: "Vaginal Discharge",
        child: Container(
          padding: EdgeInsets.fromLTRB(0,30,0,0),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  vaginaldischarge(DisType.Creamy),
                  vaginaldischarge(DisType.Egg),
                  vaginaldischarge(DisType.Watery),

                ],
              ),
              SizedBox(height:20),
               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [
                 
                  vaginaldischarge(DisType.Sticky),
                  vaginaldischarge(DisType.Dry),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  void changeDisType(DisType newDisType) {
    setState(() {

        this.disType = newDisType;
        selectval[disType.toString().substring(8)]=!selectval[disType.toString().substring(8)];
        dischargechange=true;
    });
  }
Widget vaginaldischarge(DisType disType)
{
  return GestureDetector(
     onTap: () {
          changeDisType(disType);
          
        },
      child: Container(
      child: Column(
        children: [
        SvgPicture.asset((  selectval[disType.toString().substring(8)] ?dispathC[disType.toString().substring(8)]:dispath[disType.toString().substring(8)]),height:MediaQuery.of(context).size.height/812*60,fit: BoxFit.cover,),
         SizedBox(height:10),
         Text(
            disType.toString().substring(8),
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontFamily: 'SF Pro Text',
                  fontSize: 13,
                  letterSpacing: 0,
                  fontWeight: selectval[disType.toString().substring(8)]
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

