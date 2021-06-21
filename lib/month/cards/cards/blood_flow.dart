import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:upcloud_tracker/month/cards/getapi.dart';
import '../components/swipeable_card.dart';
import '../cardglobal.dart';

enum FlowType { Light, Medium, Heavy, Spotted, Nothing }

class BloodFlow extends StatefulWidget {
  @override
  _BloodFlowState createState() => _BloodFlowState();
}

class _BloodFlowState extends State<BloodFlow> {
  final color = Color(0xFFFF0A0A);
  final index = 0;
  FlowType flowType;

  final Map<String, String> svgpath1 = {
    'Light': 'assets/blood_flow/P1.svg',
    'Medium': 'assets/blood_flow/P2.svg',
    'Heavy': 'assets/blood_flow/P3.svg',
    'Spotted': 'assets/blood_flow/P4.svg'
  };
  final Map<String, String> svgpath = {
    'Light': 'assets/blood_flow/P5.svg',
    'Medium': 'assets/blood_flow/P6.svg',
    'Heavy': 'assets/blood_flow/P7.svg',
    'Spotted': 'assets/blood_flow/P8.svg'
  };
  @override
  void initState() {
    getdata();
    //flowType = FlowType.Nothing;
    //print(FlowType);
    super.initState();
  }

  getdata() async {
    await getFlow().then((value) {
      print(value);
      for (int i = 0; i < 3; i++) {
        if (value['data'][value['data'].length - 1][flowList[i]])
          flowType = FlowType.values[i];
        print(flowType);
      }
      on = value['data'][value['data'].length - 1][flowList[3]];
    });
  }

  void changeFlowType(FlowType newFlowType) {
    setState(() {
      if (newFlowType == this.flowType) {
        this.flowType = FlowType.Nothing;
        setState(() {
          flow[flowType.toString().substring(9)] = false;
                    flowchange = true;

        });
      } else {
        this.flowType = newFlowType;
        setState(() {
          flow['Light'] = false;
          flow['Medium'] = false;
          flow['Heavy'] = false;
          flow[flowType.toString().substring(9)] = true;
          flowchange = true;
        });
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
        topHeight: height / 4,
        title: "Blood Flow",
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
               flowTypeButton("Light", FlowType.Light),
              flowTypeButton("Medium", FlowType.Medium),
               flowTypeButton("Heavy", FlowType.Heavy),
              SpottingWidget(), //flowTypeButton("Spotted", FlowType.Spotted)
            ],
          ),
        ),
      ),
    );
  }

  Widget flowTypeButton(String text, FlowType flowType) {
    print(flowType);
    return Container(
      //padding: EdgeInsets.only(top:0),
      child: GestureDetector(
        onTap: () {
          changeFlowType(flowType);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
             

                  child: SvgPicture.asset(
                (this.flowType == flowType
                     ? svgpath[flowType.toString().substring(9)]
                     : svgpath1[text]),
                 height: MediaQuery.of(context).size.height / 812 * 100,
                 width: 40,
                 fit: BoxFit.cover,
               )
            ),
            SizedBox(height: 10),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontFamily: 'SF Pro Text',
                  fontSize: 13,
                  letterSpacing: 0,
                  fontWeight: this.flowType == flowType
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

class SpottingWidget extends StatefulWidget {
  @override
  _SpottingWidgetState createState() => _SpottingWidgetState();
}

class _SpottingWidgetState extends State<SpottingWidget> {
  //bool on = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.all(8),
      child: GestureDetector(
        onTap: () {
          setState(() {
            on = !on;
            flow['Spotted'] = on;
          });
        },
        child: Column(
          children: [
            Container(
              child:  SvgPicture.asset(
              (on
                    ? 'assets/blood_flow/P8.svg'
                    : 'assets/blood_flow/P4.svg'),
                height: MediaQuery.of(context).size.height / 812 * 100,
                width: 40,
                fit: BoxFit.cover,
              ),
            ),
                        SizedBox(height: 10),

            Text(
              "Spotting",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontFamily: 'SF Pro Text',
                  fontSize: 13,
                  letterSpacing: 0,
                  fontWeight: on ? FontWeight.bold : FontWeight.normal,
                  height: 1),
            ),
          ],
        ),
      ),
    );
  }
}
