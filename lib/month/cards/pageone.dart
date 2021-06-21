import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'components/swipeable_card.dart';
import 'components/switch_button.dart';
import 'provider.dart/card_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PageOne extends StatefulWidget {
  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  List<double> heights = List.empty(growable: true);
  static int protectedcount = 0;
  static int unprotectedcount = 0;

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
            // title: "NOTITLE",
            // satationary: false,
            borderColor: Color(0xFFD08E55),
            topHeight: height / 4,
            index: 4,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Fluttertoast.showToast(
                                  msg: '$protectedcount',
                                  backgroundColor:
                                      Color.fromRGBO(196, 196, 196, 1),
                                  fontSize: 18,
                                  gravity: ToastGravity.CENTER,
                                 );
                              protectedcount++;
                            
                            },
                            child: Column(
                              children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(196, 196, 196, 1),
                                      shape: BoxShape.circle),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Protected',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                               Fluttertoast.showToast(
                                  msg: '$unprotectedcount',
                                backgroundColor:
                                      Color.fromRGBO(196, 196, 196, 1),
                                  fontSize: 18,
                                  gravity: ToastGravity.CENTER,
                                 );
                              // final snackBar = SnackBar(
                              //   content: Text('$unprotectedcount'),
                              //   action: SnackBarAction(
                              //     label: 'Undo',
                              //     onPressed: () {
                              //       // Some code to undo the change.
                              //     },
                              //   ),
                              // );

                              // // Find the ScaffoldMessenger in the widget tree
                              // // and use it to show a SnackBar.
                              // ScaffoldMessenger.of(context)
                              //     .showSnackBar(snackBar);
                              unprotectedcount++;
                            },
                            child: Column(
                              children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(196, 196, 196, 1),
                                      shape: BoxShape.circle),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Unprotected',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
