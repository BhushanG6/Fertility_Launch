import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:upcloud_tracker/Settings/get.dart';
import '../components/swipeable_card.dart';
import '../constants.dart';
import '../provider.dart/card_provider.dart';
import '../utilities.dart';
import '../cardglobal.dart';
import '../getapi.dart';
enum Ovulation {Positive,Negative,Nothing}
enum Preg {Positive,Negative,Nothing}
final Map<String,String> ovupathC={'Negative':'assets/ovutest/testov1.svg','Positive' :'assets/ovutest/testov2.svg'};
final Map<String,String> ovupath={'Negative':'assets/ovutest/testovN1.svg','Positive' :'assets/ovutest/testovN2.svg'};
final Map<String,String> pregpathC={'Negative':'assets/ovutest/pregN1.svg','Positive' :'assets/ovutest/pregN2.svg'};
final Map<String,String> pregpath={'Negative':'assets/ovutest/preg1.svg','Positive' :'assets/ovutest/preg2.svg'};
class TestsCard extends StatefulWidget {
  @override
  _TestsCardState createState() => _TestsCardState();
}

class _TestsCardState extends State<TestsCard> {
  final color =Color.fromRGBO(223, 131, 255, 1);
  final index = 2;
  Ovulation ovuType;
  Preg pregType;
  void initState() {
    ovuType =Ovulation.Nothing;
    pregType=Preg.Nothing;
    getdata();
    super.initState();
  }
  getdata() async {
    await getTestOvu().then((value) {
      print(value);
      for (int i = 0; i < 2; i++) {
        if (value['data'][value['data'].length - 1][Ovulation.values[i].toString().substring(10).toLowerCase()])
        ovuType=Ovulation.values[i];

      }
    });
     await getTestPreg().then((value) {
      print(value);
      for (int i = 0; i < 2; i++) {
        if (value['data'][value['data'].length - 1][Preg.values[i].toString().substring(5).toLowerCase()])
        pregType=Preg.values[i];

      }
    });
  }
  void changeOvuType(Ovulation newOvuType) {
    setState(() {
      if ( newOvuType == this.ovuType)
      {
        this.ovuType = Ovulation.Nothing;
        ovu[ovuType.toString().substring(10)]=false;
        testchange=true;

      }
      else
      {
        ovu['Positive']=false;
        ovu['Negative']=false;
        this.ovuType = newOvuType;
        ovu[ovuType.toString().substring(10)]=true;
        testchange=true;


      }
    
    });
  }
  void changePregType(Preg newPregType) {
    setState(() {
      if ( newPregType == this.pregType)
      {
        this.pregType = Preg.Nothing;
        preg[pregType.toString().substring(5)]=false;
        testchange=true;

      }
      else
      {
        preg['Positive']=false;
        preg['Negative']=false;
        this.pregType = newPregType;
        preg[pregType.toString().substring(5)]=true;
        testchange=true;

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
        title: "Ovulation Tests",
        topHeight: height / 3,
        child: Container(
          padding: EdgeInsets.fromLTRB(0,30,0,0),
           child:Column(
             children: [
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: [
                  ovutest(Ovulation.Negative),
                  ovutest(Ovulation.Positive),

                 ],
               ),
               
               Padding(
                 padding: const EdgeInsets.fromLTRB(30,30,0,0),
                 child: Row(
                   children: [
                     Text('Pregnancy ', style: TextStyle(
                                  fontWeight:
                                      FontWeight.w900,
                                  fontSize: 22)),
                     Text('Test', style: TextStyle(
                                  fontWeight:
                                      FontWeight.w900,
                                  fontSize: 22,color: color))
                   ],
                 ),
               ),
              SizedBox(height:30),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: [
                   pregtest(Preg.Negative),
                   pregtest(Preg.Positive),

                 ],
               ),
             ],
           )
        ),
      ),
    );
  }
  Widget ovutest(Ovulation ovuType)
  {
    return Container(
     child:GestureDetector(
       onTap: () {
          changeOvuType(ovuType);
          
        },
            child: Column(
          children: [
           SvgPicture.asset((this.ovuType==ovuType ?ovupathC[ovuType.toString().substring(10)]:ovupath[ovuType.toString().substring(10)]),height:MediaQuery.of(context).size.height/812*60,fit: BoxFit.cover,),
                     SizedBox(height:10),

           Text(
              ovuType.toString().substring(10),
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'SF Pro Text',
                    fontSize: 13,
                    letterSpacing: 0,
                    fontWeight: this.ovuType==ovuType
                        ? FontWeight.bold
                        : FontWeight.normal,
                    height: 1),
              ),
          ],
        ),
     ),
    );
     
  }
  Widget pregtest(Preg pregType)
  {
    return Container(
     child:GestureDetector(
       onTap: () {
          changePregType(pregType);
          
        },
            child: Column(
          children: [
           SvgPicture.asset((  this.pregType==pregType ?pregpathC[pregType.toString().substring(5)]:pregpath[pregType.toString().substring(5)]),height:MediaQuery.of(context).size.height/812*40,fit: BoxFit.cover,),
           SizedBox(height:10),
           Text(
              pregType.toString().substring(5),
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'SF Pro Text',
                    fontSize: 13,
                    letterSpacing: 0,
                    fontWeight:  this.pregType==pregType
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
