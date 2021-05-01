import 'package:flutter/material.dart';
import '../widgets/demo.dart';
// ignore: unused_import
import '../widgets/symptoms.dart';
import '../widgets/moods.dart';
import 'symptoms_model.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/rendering.dart';

//false==sym
bool tap = false;

final page = [
  Container(child: Demo()),
  Container(child: Moods()),
];
// Container(child: Demo()),
getGridViewItems(BuildContext context, SymtomsModel gridItem) {
  return showModalBottomSheet(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
      topLeft: Radius.circular(30),
      topRight: Radius.circular(30),
    )),
    backgroundColor: Theme.of(context).brightness == Brightness.dark
        ? Colors.black
        : Colors.white,
    context: context,
    isScrollControlled: true, // set this to true
    builder: (_) {
      return DraggableScrollableSheet(
        initialChildSize: 0.6,
        expand: false,
        builder: (_, controller) {
          return Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                margin: EdgeInsets.fromLTRB(30, 17, 30, 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(13),
                  topRight: Radius.circular(13),
                )),
                //color: Colors.blue[500],
                child: ListView(
                  children: [
                    Center(
                      child: Container(
                        color: Colors.black,
                        height: 4,
                        width: 44,
                      ),
                    ),
                    Stack(
                      children: [
                        Container(
                          //color: Colors.black,
                          margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                          child: gridItem.image == 'guilty'
                              ? Transform.scale(
                                  scale: 1.0,
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                                    child: SizedBox(
                                      height: 400,
                                      width: MediaQuery.of(context).size.width,
                                      child: FlareActor(
                                          "assets/images/guilty.flr",
                                          alignment: Alignment.center,
                                          fit: BoxFit.cover,
                                          animation: "idle"),
                                    ),
                                  ),
                                )
                              : Container(
                                  margin: EdgeInsets.fromLTRB(30, 0, 30, 10),
                                  child: Image.asset(
                                    'assets/images/${gridItem.image}.jpg',
                                    height: 250,
                                    width: 189,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        ),
                        Positioned(
                          top: 190,
                          child: Container(
                            //margin: EdgeInsets.fromLTRB(10, 0, 20, 10),
                            height: 225,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Theme.of(context).brightness ==
                                          Brightness.light
                                      ? Color.fromRGBO(255, 255, 255, 1)
                                      : Color.fromRGBO(0, 0, 0, 1),
                                  Theme.of(context).brightness ==
                                          Brightness.light
                                      ? Color.fromRGBO(255, 255, 255, 0)
                                      : Color.fromRGBO(0, 0, 0, 0),
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.center,
                              ),
                            ),

                            alignment: Alignment(-1, 1.18),
                            // Alignment.bottomLeft,
                            child: FittedBox(
                              child: Container(
                                height: 72,
                                width: 122,
                                color: Colors.transparent,
                                child: Text(
                                  '${gridItem.name}',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffE3B287),
                                  ),
                                ),
                                //color: Colors.red,
                              ),
                            ),
                            //SizedBox(),
                            // Container(
                            //   color: Colors.red,
                            //   child: Text(
                            //     '${gridItem.name}',
                            //     style: TextStyle(
                            //       fontSize: 30,
                            //       fontWeight: FontWeight.w500,
                            //       color: Color(0xffE3B287),
                            //     ),
                            //   ),
                            // ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 18),
                    Container(
                      child: Text(
                        '${gridItem.description}',
                        style: TextStyle(
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.black
                                  : Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ],
                  controller: controller,
                ),
              ),
              // Positioned(
              //   top: 380,
              //   left: 30,
              //   child: Container(
              //     height: 72,
              //     width: 122,
              //     color: Colors.transparent,
              //     child: Text(
              //       '${gridItem.name}',
              //       style: TextStyle(
              //         fontSize: 30,
              //         fontWeight: FontWeight.w500,
              //         color: Color(0xffE3B287),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          );
        },
      );
    },
  );
}

class SlideRightRoute extends PageRouteBuilder {
  final Widget page;
  SlideRightRoute({this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              ScaleTransition(
            scale: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.fastOutSlowIn,
              ),
            ),
            child: child,
          ),
        );
}

bool moods = false;
bool st = false;
