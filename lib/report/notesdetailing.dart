import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';

class NoteDetails extends StatefulWidget {
  var iconselected, notedata, description, optionlist;

  @override
  NoteDetails(nd, iconsel, des, op) {
    this.iconselected = iconsel;
    //print(iconselected);
    List newiconslected = [];
    for (var i in iconselected) {
      newiconslected.insert(0, i);
    }
    iconselected = newiconslected;
    //print(iconselected);
    this.notedata = nd;
    this.description = des;
    this.optionlist = op;
  }
  _NoteDetailsState createState() =>
      _NoteDetailsState(notedata, iconselected, description, optionlist);
}

class _NoteDetailsState extends State<NoteDetails> {
  var iconselected, notedata, description, optionlist;
  _NoteDetailsState(nd, iconsel, des, op) {
    this.iconselected = iconsel;
    this.notedata = nd;
    this.description = des;
    this.optionlist = op;
  }
  var iconNcolor = [
    [Icons.bubble_chart, Colors.greenAccent[400]],
    [CupertinoIcons.circle_filled, Colors.yellow[700]],
    [CupertinoIcons.heart_solid, Colors.pink[600]],
    [Icons.brush, Colors.blue[300]],
  ];
  List<int> iconid = [0, 1, 2, 3];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          IconButton(
                            icon:
                                Icon(Icons.arrow_back_ios, color: Colors.black),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                          Expanded(
                            child: SizedBox(),
                          )
                        ],
                      ),
                      Text(
                        notedata[0],
                        style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.w500,
                            color: notedata[1]),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      for (var item in iconid)
                        iconselected[item] == true
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                      child: Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 36.0),
                                    child: Text(optionlist[item],
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.w400,
                                        )),
                                  )),
                                  SizedBox(
                                    width: 15.0,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 36.0),
                                    child: Icon(
                                      iconNcolor[item][0],
                                      size: 26.0,
                                      color: iconNcolor[item][1],
                                    ),
                                  ),
                                ],
                              )
                            : SizedBox(),
                      SizedBox(
                        height: 30.0,
                      ),
                      Text(description,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.w400,
                          ))
                    ]))));
  }
}
