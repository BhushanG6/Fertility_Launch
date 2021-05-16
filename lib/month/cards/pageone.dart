import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'components/swipeable_card.dart';
import 'components/switch_button.dart';
import 'provider.dart/card_provider.dart';

class PageOne extends StatefulWidget {
  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  List<double> heights = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double height = MediaQuery.of(context).size.height -
        kBottomNavigationBarHeight -
        statusBarHeight;
    return ChangeNotifierProvider(
      create: (context) => CardProvider(),
      child: Stack(
        children: [
          SwipableCard(
            // title: "NOTITLE",
            // satationary: false,
            borderColor: Color(0xFFD08E55),
            topHeight: height / 4,
            index: 0,
            child: Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          "Hello Friend, hope you are doing well! You’re ovulation starts in two days. Log your symptoms for better health insights!",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Center(
                            child: SwitchButton(),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          SwipableCard(
            // satationary: false,
            index: 4,
            topHeight: height / 4,
            title: "NOTITLE",
            borderColor: Colors.orange,
          ),
        ],
      ),
    );
  }
}
