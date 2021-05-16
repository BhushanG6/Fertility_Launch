import 'package:flutter/material.dart';
import '../components/swipeable_card.dart';

enum FlowType { Light, Medium, Heavy, Nothing }

class BloodFlow extends StatefulWidget {
  @override
  _BloodFlowState createState() => _BloodFlowState();
}

class _BloodFlowState extends State<BloodFlow> {
  final color = Color(0xFFFF0A0A);
  final index = 0;
  FlowType flowType;

  @override
  void initState() {
    flowType = FlowType.Nothing;
    super.initState();
  }

  void changeFlowType(FlowType newFlowType) {
    setState(() {
      if (newFlowType == this.flowType)
        this.flowType = FlowType.Nothing;
      else
        this.flowType = newFlowType;
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
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: flowTypeButton("Light", FlowType.Light)),
              Expanded(child: flowTypeButton("Medium", FlowType.Medium)),
              Expanded(child: flowTypeButton("Heavy", FlowType.Heavy)),
              Expanded(child: SpottingWidget())
            ],
          ),
        ),
      ),
    );
  }

  Widget flowTypeButton(String text, FlowType flowType) {
    return Container(
      padding: EdgeInsets.all(8),
      child: GestureDetector(
        onTap: () {
          changeFlowType(flowType);
        },
        child: Column(
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(100)),
            ),
            SizedBox(
              height: 7,
            ),
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
  bool on = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: GestureDetector(
        onTap: () {
          setState(() {
            on = !on;
          });
        },
        child: Column(
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(100)),
            ),
            SizedBox(
              height: 7,
            ),
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
