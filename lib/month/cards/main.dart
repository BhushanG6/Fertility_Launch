import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constants.dart';
import 'pagetwo.dart';
import 'pageone.dart';
import 'provider.dart/card_provider.dart';

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
          Container(
            color: Colors.white,
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: kBottomNavigationBarHeight,
        child: BottomNavigationBar(
          elevation: 0,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.black,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.circle),
              label: "Element",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.lightbulb), label: "Element"),
            BottomNavigationBarItem(icon: Icon(Icons.mail), label: "Element"),
            BottomNavigationBarItem(
                icon: Icon(Icons.import_contacts), label: "Element"),
            BottomNavigationBarItem(
                backgroundColor: Colors.orange,
                icon: Icon(Icons.square_foot),
                label: "Element"),
          ],
        ),
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
    return GestureDetector(
      onTap: () {
        setState(() {
          count++;
        });
      },
      child: Center(
        child: Container(
          color: Colors.blue,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Expanded(
              child: Container(
                child: Center(
                    child: Text(
                  "$count",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                )),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(),
            )
          ]),
        ),
      ),
    );
  }
}
