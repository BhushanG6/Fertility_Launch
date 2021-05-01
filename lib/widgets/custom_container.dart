import 'package:flutter/material.dart';

class CustCont extends StatefulWidget {
  bool value;
  CustCont({this.value});
  @override
  _CustContState createState() => _CustContState();
}

class _CustContState extends State<CustCont> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 40,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.black
                : Colors.white,
          ),
        ),
      ),
      child: Center(
        child: widget.value
            ? Icon(
                Icons.check,
                color: Colors.yellow[700],
              )
            : null,
      ),
    );
  }
}
