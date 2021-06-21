import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../components/swipeable_card.dart';
import '../constants.dart';
import '../provider.dart/card_provider.dart';
import '../utilities.dart';
import '../cardglobal.dart';
import '../getapi.dart';
class NotesCards extends StatefulWidget {
  @override
  _NotesCardsState createState() => _NotesCardsState();
}

class _NotesCardsState extends State<NotesCards> {
  final color = Color.fromRGBO(80, 227, 194, 1);
  final index = 3;
  FocusNode focusNode = FocusNode();
  TextEditingController notecontroller=new TextEditingController();
  void initState() {
    getdata();

    super.initState();
  }
  getdata() async {
    await getNotes().then((value) {
      print(value);
      notecontroller.text=value['data'][value['data'].length - 1]['note'];
    });
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SwipableCard(
      index: index,
      borderColor: color,
      topHeight: height / 3,
      title: "Notes",
      child: Container(
        padding: EdgeInsets.fromLTRB(30,20,0,0),
        color: Colors.transparent,
        child: TextField(
            expands: false,
            autofocus: false,
            focusNode: focusNode,
            controller: notecontroller,
            decoration: InputDecoration(),
            maxLines: 100,
            onSubmitted: (value) {
              focusNode.unfocus();
            },
            onChanged: (value){
              note=notecontroller.text;
              notechange=true;
            },
          ),
      ),
    );
  }
}
