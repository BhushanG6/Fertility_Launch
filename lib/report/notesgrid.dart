import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'notesdetailing.dart';
import 'daterange.dart';
import 'dart:math';

class Notes extends StatefulWidget {
  @override
  _NotesState createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  String dropdownstate1, dropdownstate2, dropyear1, dropyear2;
  String description =
      "Sed ut perspic iatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, ";
  List<int> tileid = [0, 2, 4, 6];
  List<int> iconid = [0, 1, 2, 3];
  var iconNcolor = [
    [Icons.brush, Colors.blue[300]],
    [CupertinoIcons.heart_solid, Colors.pink[600]],
    [CupertinoIcons.circle_filled, Colors.yellow[700]],
    [Icons.bubble_chart, Colors.greenAccent[400]],
  ];
  var iconselected = [
    [true, true, true, true],
    [true, false, true, true],
    [true, true, false, false],
    [true, true, true, true],
    [false, false, false, false],
    [true, true, true, true],
    [true, true, false, true],
    [true, true, true, true]
  ];
  var notedate = [
    ['27 Wed, Jul 21', Color(0xff35C0B8)],
    ['27 Wed, Jul 21', Color(0xffE76060)],
    ['27 Wed, Jul 21', Color(0xffFA00FF)],
    ['27 Wed, Jul 21', Color(0xffD08E55)],
    ['27 Wed, Jul 21', Color(0xffE76060)],
    ['27 Wed, Jul 21', Color(0xffFA00FF)],
    ['27 Wed, Jul 21', Color(0xff35C0B8)],
    ['28 Wed, May 21', Color(0xff35C0B8)]
  ];
  var optionlist = [
    [
      'Heavy - Spotting -',
      'Heavy - Eggwhite - Spotting -',
      'Unprotected -',
      'Negative -'
    ],
    [
      'Headache - Pelvic pain - Nausea - Happy - Fatique - Lazy - Sad - Emotional -',
      'Spotting -',
      'Unprotected -',
      'Negative -'
    ],
    [
      'Headache - Pelvic pain - Nausea - Happy - Fatique - Lazy - Sad - Emotional -',
      'Eggwhite - Spotting -',
      'Unprotected -',
      'Negative -'
    ],
    [
      'Heavy - Spotting -',
      'Heavy - Eggwhite - Spotting -',
      'Unprotected -',
      'Negative -'
    ],
    [
      'Heavy - Spotting -',
      'Heavy - Eggwhite - Spotting -',
      'Unprotected -',
      'Negative -'
    ],
    [
      'Headache - Pelvic pain - Nausea - Happy - Fatique - Lazy - Sad - Emotional -',
      'Eggwhite - Spotting -',
      'Unprotected -',
      'Negative -'
    ],
    [
      'Headache - Pelvic pain - Nausea - Happy - Fatique - Lazy - Sad - Emotional -',
      'Eggwhite - Spotting -',
      'Unprotected -',
      'Negative -'
    ],
    [
      'Heavy - Spotting -',
      'Heavy - Eggwhite - Spotting -',
      'Unprotected -',
      'Negative -'
    ],
  ];

  double cardWidthMeasure(width) {
    if (width < 320.0) {
      return (width - 50) / 2;
    } else if (width < 375 && width >= 320) {
      return (width - 55) / 2;
    } else {
      return (width - 60) / 2;
    }
  }

  _NotesState() {
    this.dropdownstate1 = 'January';
    this.dropdownstate2 = 'February';
    this.dropyear1 = '21';
    this.dropyear2 = '21';
  }
  var textScaleFactor;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double leftpadding = (width - 40) / 2;

    double cardwidth = cardWidthMeasure(width);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                    padding: EdgeInsets.only(left: 10),
                    icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Color(0xffEFEFEF),
                              borderRadius: BorderRadius.circular(5.0)),
                          child: Icon(
                            Icons.border_color,
                            color: Colors.deepPurple[600],
                          ),
                          margin: EdgeInsets.only(right: 11.0),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Notes',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22.0)),
                            Text((notedate.length).toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 17.0))
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 35.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: <Widget>[
                        Container(
                            width: 13,
                            height: 13,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13.0),
                                color: Color(0xffC4C4C4))),
                        SizedBox(
                          width: 15.0,
                        ),
                        Text('Period',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 20.0))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: leftpadding,
                        ),
                        Container(
                            width: 13,
                            height: 13,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13.0),
                                color: Color(0xffC4C4C4))),
                        SizedBox(
                          width: 15.0,
                        ),
                        Text('Follicular',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 20.0))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: <Widget>[
                        Container(
                            width: 13,
                            height: 13,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13.0),
                                color: Color(0xffC4C4C4))),
                        SizedBox(
                          width: 15.0,
                        ),
                        Text('Ovulation',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 20.0))
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: leftpadding,
                        ),
                        Container(
                            width: 13,
                            height: 13,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13.0),
                                color: Color(0xffC4C4C4))),
                        SizedBox(
                          width: 15.0,
                        ),
                        Text('Leutal',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 20.0))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 37.0,
                  ),
                  DateRangePick(),

                  ///
                  ///
                  SizedBox(
                    height: 42.0,
                  ),
                  ////
                  ///
                  
                  for (var tile in tileid)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          FlatButton(
                            padding: EdgeInsets.all(0),
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NoteDetails(
                                        notedate[tile],
                                        iconselected[tile],
                                        description,
                                        optionlist[tile]))),
                            child: NoteCard(
                                cardwidth: cardwidth,
                                notedate: notedate,
                                tile: tile,
                                iconid: iconid,
                                iconselected: iconselected,
                                iconNcolor: iconNcolor,
                                description: description),
                          ),
                          FlatButton(
                            padding: EdgeInsets.all(0),
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NoteDetails(
                                      notedate[tile + 1],
                                      iconselected[tile + 1],
                                      description,
                                      optionlist[tile + 1])),
                            ),
                            child: NoteCard(
                              cardwidth: cardwidth,
                              notedate: notedate,
                              tile: tile + 1,
                              iconid: iconid,
                              iconselected: iconselected,
                              iconNcolor: iconNcolor,
                              description: description,
                            ),
                          ),
                        ],
                      ),
                    ),

                  //

                  ///
                ],
              ),
            ),
          ),
        ));
  }
}

class NoteCard extends StatelessWidget {
  NoteCard({
    Key key,
    @required this.cardwidth,
    @required this.notedate,
    @required this.tile,
    @required this.iconid,
    @required this.iconselected,
    @required this.iconNcolor,
    @required this.description,
  }) : super(key: key);

  final double cardwidth;

  final List<List<Object>> notedate;
  final int tile;
  final List<int> iconid;
  final List<List<bool>> iconselected;
  final List<List<Object>> iconNcolor;
  final String description;
  var textScaleFactor;

  Random random = new Random();

  int numLines(title) {
    int randomNumber = random.nextInt(3);
    Size A = (TextPainter(
            text: TextSpan(text: title, style: TextStyle(fontSize: 17.0)),
            maxLines: 1,
            textScaleFactor: textScaleFactor,
            textDirection: TextDirection.ltr)
          ..layout())
        .size;
    if (A.width > cardwidth - 20)
      return 5;
    else {
      if (randomNumber == 2)
        return 5;
      else
        return 6;
    }
  }

  @override
  Widget build(BuildContext context) {
    textScaleFactor = MediaQuery.of(context).textScaleFactor;
    return Container(
      margin: EdgeInsets.only(bottom: 27.0),
      height: 200,
      width: cardwidth,
      padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13.0), color: Color(0xffEEEEEE)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  notedate[tile][0],
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      color: notedate[tile][1],
                      fontSize: 17.0,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Row(
                  children: <Widget>[
                    Expanded(child: SizedBox()),
                    for (var item in iconid)
                      iconselected[tile][item] == true
                          ? Icon(
                              iconNcolor[item][0],
                              size: 16.0,
                              color: iconNcolor[item][1],
                            )
                          : SizedBox(
                              height: 16.0,
                            )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Container(
            child: Expanded(
              child: Text(
                description,
                maxLines: numLines(notedate[tile][0]),
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400),
              ),
            ),
          )
        ],
      ),
    );
  }
}
