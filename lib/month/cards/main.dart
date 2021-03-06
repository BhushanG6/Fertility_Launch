import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:upcloud_tracker/Settings/home_page.dart';
import 'package:upcloud_tracker/mns/main.dart';
import 'package:upcloud_tracker/report/main.dart';

import 'constants.dart';
import 'pagetwo.dart';
import 'pageone.dart';
import 'provider.dart/card_provider.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  const Home({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => CardProvider(),
        builder: (context, child) => child,
        child: BodyWidget());
  }
}

class BodyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double statusBar = MediaQuery.of(context).padding.top;
    final cardp = Provider.of<CardProvider>(context);

    height =
        height / 2 + (cardp.openedCardIndex == -1 ? 0 : height / 6) - statusBar;
    print(height);

    return Scaffold(
      body: PageView(
        physics: BouncingScrollPhysics(),
     allowImplicitScrolling: true,
    scrollDirection: Axis.vertical,
        children: [
                   

          PageView(
            children: [
              Stack(
                children: [
                  CounterWidget(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: AnimatedContainer(
                      duration: kDuration,
                      height: height,
                      child: OverflowBox(
                        maxWidth: width,
                        child: PageView(
                          children: [
                            PageOne(),
                            PageTwo(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
             MNS(),
            ],
          ),
           MyApp(),
        ],
      ),
   
    );
  }
}


class CounterWidget extends StatefulWidget {
  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
          GestureDetector(
             onTap: () {
               Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.topToBottom,
        child: SettingsHomePage(),
        inheritTheme: true,
        ctx: context),
);
        },
                      child: Align(
              alignment: Alignment.topRight,
                        child: Icon(
      Icons.circle,
      color: Colors.red,
      size: 24.0,
      semanticLabel: 'Text to announce in accessibility modes',
    ),
            ),
          ),
        // Padding(
        //   padding: const EdgeInsets.only(top:30),
        //   child: GestureDetector(
        //     onTap: () {
        //       setState(() {
        //         count++;
        //       });
        //     },
        //     child: Center(
        //       child: Container(
        //         color: Colors.blue,
        //         child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        //           Expanded(
        //             child: Container(
        //               child: Center(
        //                   child: Text(
        //                 "$count",
        //                 style: TextStyle(
        //                   fontSize: 20,
        //                 ),
        //               )),
        //             ),
        //           ),
        //           Expanded(
        //             flex: 1,
        //             child: Container(),
        //           )
        //         ]),
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
