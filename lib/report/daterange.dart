import 'package:flutter/material.dart';

class DateRangePick extends StatefulWidget {
  @override
  _DateRangePickState createState() => _DateRangePickState();
}

class _DateRangePickState extends State<DateRangePick> {
  String dropdownstate1, dropdownstate2;
  String dropyear1, dropyear2;
  _DateRangePickState() {
    this.dropdownstate1 = 'Jan';
    this.dropdownstate2 = 'Feb';
    this.dropyear1 = "21";
    this.dropyear2 = "21";
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          DropdownButton<String>(
            value: dropdownstate1,
            icon: Icon(
              Icons.arrow_drop_down,
              color: Colors.black,
            ),
            iconSize: 25.0,
            style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500),
            underline: Container(
              height: 0,
            ),
            onChanged: (String newValue) {
              setState(() {
                dropdownstate1 = newValue;
              });
            },
            items: <String>[
              'Jan',
              'Feb',
              'Mar',
              'Apr',
              'May',
              'Jun',
              'Jul',
              'Aug',
              'Sept',
              'Oct',
              'Nov',
              'Dec'
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          DropdownButton<String>(
            value: dropyear1,
            icon: Icon(
              Icons.arrow_drop_down,
              color: Colors.black,
            ),
            iconSize: 25.0,
            style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.w400),
            underline: Container(
              height: 0,
            ),
            onChanged: (String newValue) {
              setState(() {
                dropyear1 = newValue;
              });
            },
            items: <String>[
              '20',
              '21',
              '22',
              '23',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          Text(
            "-",
            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w500),
          ),
          DropdownButton<String>(
            value: dropdownstate2,
            icon: Icon(
              Icons.arrow_drop_down,
              color: Colors.black,
            ),
            iconSize: 25.0,
            style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.w500),
            underline: Container(
              height: 0,
            ),
            onChanged: (String newValue) {
              setState(() {
                dropdownstate2 = newValue;
              });
            },
            items: <String>[
              'Jan',
              'Feb',
              'Mar',
              'Apr',
              'May',
              'Jun',
              'Jul',
              'Aug',
              'Sept',
              'Oct',
              'Nov',
              'Dec'
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          DropdownButton<String>(
            value: dropyear2,
            icon: Icon(
              Icons.arrow_drop_down,
              color: Colors.black,
            ),
            iconSize: 25.0,
            style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.w400),
            underline: Container(
              height: 0,
            ),
            onChanged: (String newValue) {
              setState(() {
                dropyear2 = newValue;
              });
            },
            items: <String>[
              '20',
              '21',
              '22',
              '23',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
