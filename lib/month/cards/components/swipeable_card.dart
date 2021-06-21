import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swipedetector/swipedetector.dart';
import 'package:upcloud_tracker/Settings/theme.dart';
import '../constants.dart';
import '../provider.dart/card_provider.dart';
import '../utilities.dart';
import '../postapi.dart';
import '../cardglobal.dart';

///
/// A swipe-able card interface for other cards to use.
/// Has basic functionalities like, you can change how much height
/// it should have padding of with respect to the
/// height of parent widget,
/// what widget it should show.
///
class SwipableCard extends StatefulWidget {
  final Color borderColor;
  final Widget child;
  final String title;
  final bool satationary;
  final index;
  final topHeight;
  SwipableCard(
      {this.title,
      @required this.borderColor,
      @required this.index,
      @required this.topHeight,
      this.child,
      this.satationary = false});

  @override
  _SwipableCardState createState() => _SwipableCardState();
}

class _SwipableCardState extends State<SwipableCard> {
  /// Radius of container
  final double radius = 25;

  /// Flag for if the card is opened on closed
  bool isOpen = false;

  DragStartDetails startVerticalDragDetails;
  DragUpdateDetails updateVerticalDragDetails;

  @override
  void initState() {
    this.isOpen = false;
    super.initState();
  }

  void onVerticalDragUp(CardProvider c) {
    print('this is index: ${widget.index}');
    c.changeOpenCardIndex(widget.index);
  }

  void onVerticalDragDown(CardProvider c) {
    c.changeOpenCardIndex(-1);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final cardProvider = Provider.of<CardProvider>(context);

    double topPadding = getTopPaddingOfCard(
      widget.index,
      height,
    );

    topPadding += cardProvider.openedCardIndex == -1 ? 0 : height / 6;

    // double statusBarHeight = MediaQuery.of(context).padding.top;

    isOpen = cardProvider.openedCardIndex == widget.index;

    bool isopenfun() {
      return isOpen;
    }

    double textHeight = (height - kBottomNavigationBarHeight - 0) / 10;

    final themeProvider = Provider.of<ThemeNotifier>(context);

    if (widget.satationary) {
      print("STationary widget padding: $topPadding");
      print('this is another: ${cardProvider.openedCardIndex}');
      topPadding += isOpen ? height / 4 : 0;
    }
    return AnimatedPositioned(
      top: (isOpen && !widget.satationary
          ? widget.index == 4 || widget.index == 3
              ? getTopPaddingOfCard(
                    1,
                    height,
                  ) +
                  height / 6
              : 0
          : topPadding),
      duration: kDuration,
      child: widget.satationary
          ? restOfWidget(width, height, textHeight, themeProvider.darkTheme)
          : GestureDetector(
              onVerticalDragStart: (dragDetails) {
                startVerticalDragDetails = dragDetails;
              },
              onVerticalDragUpdate: (dragDetails) {
                updateVerticalDragDetails = dragDetails;
              },
              onVerticalDragEnd: (endDetails) {
                double dx = updateVerticalDragDetails.globalPosition.dx -
                    startVerticalDragDetails.globalPosition.dx;
                double dy = updateVerticalDragDetails.globalPosition.dy -
                    startVerticalDragDetails.globalPosition.dy;
                double velocity = endDetails.primaryVelocity;

                //Convert values to be positive
                if (dx < 0) dx = -dx;
                if (dy < 0) dy = -dy;

                if (velocity < 0) {
                  onVerticalDragUp(cardProvider);
                } else {
                  onVerticalDragDown(cardProvider);
                  switch (widget.index) {
                    case 0:
                      {
                        if(!(flow['Light']==flowData['light'] && flow['Medium']==flowData['medium'] && flow['Heavy']==flowData['heavy'] &&  flow['Spotted']==flowData['spotting']))
                        if (flowchange == true) postFlow();
                        flowchange = false;
                      }
                      break;
                    case 1:
                      {
                        if(!(selectval['Creamy']==disData['creamy'] && selectval['Watery']==disData['watery'] && selectval['Dry']==disData['dry'] &&  selectval['Sticky']==disData['sticky'] &&  selectval['Egg']==disData['eggWhite']))

                        if (dischargechange == true) postDischarge();
                        dischargechange = false;
                      }
                      break;
                    case 2:
                      {
                        if(!(ovu['Positive']==testovData['positive'] && ovu['Negative']==testovData['negative'] && preg['Positive']==testprData['positive'] &&  preg['Negative']==testprData['negative']))

                        if (testchange == true) postTest();
                        testchange = false;
                      }
                      break;
                    case 3:
                      {
                        if(note!=noteData['note'])
                        if (notechange == true) postNote();
                        notechange = false;
                      }
                      break;
                    case 4:
                      {
                      if(!(pill['Taken']==pillData['taken'] && pill['Missed']==pillData['missed'] && pill['Late']==pillData['late'] &&  pill['Double']==pillData['double']))

                        if (pillchange == true) postPill();
                        pillchange = false;
                      }
                      break;
                    default:
                      {
                        //Body of default case
                      }
                      break;
                  }
                }
              },
              child: restOfWidget(
                  width, height, textHeight, themeProvider.darkTheme),
            ),
    );
  }

  Container restOfWidget(
      double width, double height, double textHeight, bool isDark) {
    Color color;
    if (isOpen) {
      color = isDark
          ? Colors.white.withOpacity(0.9)
          : Colors.black.withOpacity(0.9);
    } else {
      color = isDark ? Colors.white : Colors.black;
    }
    return Container(
      width: width,
      height: widget.index == 4 ? height * 0.6 : height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: isOpen ? 15 : 0,
            sigmaY: isOpen ? 15 : 0,
          ),
          child: AnimatedContainer(
            duration: kDuration,
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            decoration: BoxDecoration(
                border: Border.all(color: widget.borderColor),
                color: color,
                // gradient: isOpen
                //     ? LinearGradient(
                //         colors: [
                //           Colors.white.withOpacity(0),
                //           Colors.white.withOpacity(1)
                //         ],
                //         begin: Alignment.topCenter,
                //         end: Alignment.bottomCenter,
                //       )
                //     : null,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(radius),
                    topRight: Radius.circular(radius))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.title != null)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 25, 0, 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          widget.title.split(' ')[0] + ' ',
                          style: TextStyle(
                              fontWeight:
                                  isOpen ? FontWeight.w900 : FontWeight.w600,
                              fontSize: 22),
                        ),
                        Text(
                          widget.title.split(' ').length == 1
                              ? ''
                              : widget.title.split(' ')[1],
                          style: TextStyle(
                              fontWeight:
                                  isOpen ? FontWeight.w900 : FontWeight.w600,
                              fontSize: 22,
                              color: isOpen ? widget.borderColor : null),
                        ),
                      ],
                    ),
                  ),
                if (widget.child != null) Expanded(child: widget.child),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
