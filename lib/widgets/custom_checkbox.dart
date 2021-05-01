import 'package:flutter/material.dart';
bool value1;

// ignore: must_be_immutable
class CustomCheckbox extends StatefulWidget {
  bool value;
 
  Function abcd;
  CustomCheckbox({this.value, this.abcd});
  
  void setValue()
  {
    value1=value;
  }
  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  @override
  Widget build(BuildContext context) {
    CustomCheckbox obj=new CustomCheckbox();
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.value = !widget.value;
          widget.abcd();
          obj.setValue();
        });
      },
      child: Container(
        height: 30,
        width: 40,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width:3,
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
      ),
    );
  }
}

class CustomCheckbox2 extends StatefulWidget {
  bool value;
  Function abcd;
  CustomCheckbox2({this.value, this.abcd});
  @override
  _CustomCheckbox2State createState() => _CustomCheckbox2State();
}

class _CustomCheckbox2State extends State<CustomCheckbox2> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          //widget.value = !widget.value;
          widget.abcd();
        });
      },
      child: Container(
        height: 30,
        width: 40,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width:3,
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
      ),
    );
  }
}
