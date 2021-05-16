import 'package:flutter/material.dart';

import 'package:loading_indicator/loading_indicator.dart';

class MyLoader extends StatefulWidget {
  @override
  _MyLoaderState createState() => _MyLoaderState();
}

class _MyLoaderState extends State<MyLoader> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 100.0,
              height: 100.0,
              child: LoadingIndicator(
                color: Color(0xfff5a623),
                indicatorType: Indicator.values[31],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Loading...',
              style: TextStyle(
                color: Color(0xff4b4b4b),
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 50.0)
          ],
        ),
      ),
    );
  }
}
