import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
int currentvalue = 0;
var currentvalue2 = 0;
var currentvalue3 = 0;
var currentvalue4 = 0;
var currentvalue5 = 0;
bool dm = false;
bool sw = false;
String p12 = '';
final player = AudioCache();
bool status = false;
bool popup=false;
bool partnerstatus = false;
bool modestatus = false;
bool val1 = false;
TimeOfDay start_time = null;
int start_day = null;
final _titleController1 = TextEditingController();
bool pass = false;
String name1;
final aname1 = TextEditingController(text: name1);
String name2;
final aname2 = TextEditingController(text: name2);

Widget ab(String name, TextEditingController myController, String name2,
    TextEditingController myController2) {
  //final myController = TextEditingController(text: name1);

  return Container(
    //margin: EdgeInsets.fromLTRB(widget.mg, 0, 0, 0),
    width: 60,
    height: 30,
    child: Stack(
      children: [
        Positioned(
          right: 1,
          top: 0,
          child: Row(
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                color: Colors.red,
                width: 28,
                // padding: EdgeInsets.only(
                //     bottom: MediaQuery.of(context).viewInsets.bottom),
                margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 2, bottom: 2),
                      width: 20,
                      child: TextFormField(
                        //style: TextStyle(fontSize: 17),
                        maxLength: 2,
                        maxLines: 1,
                        onChanged: (text) {
                          print("First text field: $text");

                          // setState(() {
                          //   name
                          //   if (widget.title == 'Name :') {
                          //     //globals.final11['${widget.relation}']['name']
                          //     globals.name = text.toString();
                          //   } else if (widget.title == 'Email :') {
                          //     // globals.final11['${widget.relation}']['email'] =
                          //     globals.email = text.toString();
                          //   } else if (widget.title == 'D.O.B :') {
                          //     //globals.final11['${widget.relation}']['dob'] =
                          //     globals.dob = text.toString();
                          //   } else if (widget.title == 'Age :') {
                          //     //globals.final11['${widget.relation}']['age'] =
                          //     globals.age = text.toString();
                          //   } else if (widget.title == 'Phone Number :') {
                          //     //globals.final11['${widget.relation}']['phone'] =
                          //     globals.phone = text.toString();
                          //   } else if (widget.title == 'Status :') {
                          //     //globals.final11['${widget.relation}']['status'] =
                          //     globals.status = text.toString();
                          //   } else if (widget.title == 'Occupation :') {
                          //     //globals.final11['${widget.relation}']['occupation'] =
                          //     globals.occupation = text.toString();
                          //   }
                          // });
                        },
                        controller: myController..text = name,
                        scrollPadding: EdgeInsets.all(0),
                        textCapitalization: TextCapitalization.words,
                        //style: widget.st2,
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 16.0),
                        // decoration: InputDecoration(
                        //   border: InputBorder.none,
                        //   hintText: widget.subtitle,
                        //   //hintStyle: TextStyle(),
                        //   // floatingLabelBehavior: FloatingLabelBehavior.auto,
                        //   fillColor: Colors.transparent,
                        //   focusColor: Colors.transparent,
                        //   hoverColor: Colors.transparent,
                        // ),
                      ),
                    ),
                    Container(
                      width: 8,
                      height: 50,
                      child: Text('\"', style: TextStyle(color: Colors.black)),
                    ),
                  ],
                ),
              ),
              // Transform.translate(
              //   offset: Offset(0.4, 0.6),
              //   child: Container(
              //     width: 10,
              //     height: 50,
              //     child: Text('a', style: TextStyle(color: Colors.black)),
              //   ),
              // ),
            ],
          ),
        ),
        Positioned(
          left: 1,
          top: 0,
          child: Container(
            //margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
            padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
            color: Colors.blue,
            width: 30,
            // padding: EdgeInsets.only(
            //     bottom: MediaQuery.of(context).viewInsets.bottom),
            //margin: EdgeInsets.fromLTRB(0, 0, 0, 12),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 2, bottom: 2),
                  width: 20,
                  child: TextFormField(
                    maxLength: 1,
                    maxLines: 1,
                    onChanged: (text) {
                      print("First text field: $text");
                    },
                    controller: myController2..text = name2,
                    scrollPadding: EdgeInsets.all(0),
                    textCapitalization: TextCapitalization.words,
                    //style: widget.st2,
                    style:
                        TextStyle(fontWeight: FontWeight.w400, fontSize: 16.0),
                    // decoration: InputDecoration(
                    //   border: InputBorder.none,
                    //   hintText: widget.subtitle,
                    //   //hintStyle: TextStyle(),
                    //   // floatingLabelBehavior: FloatingLabelBehavior.auto,
                    //   fillColor: Colors.transparent,
                    //   focusColor: Colors.transparent,
                    //   hoverColor: Colors.transparent,
                    // ),
                  ),
                ),
                Container(
                  width: 10,
                  height: 50,
                  child: Text('\'',
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
