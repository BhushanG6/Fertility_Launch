// parameters for the bottom cards
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../slideScreen/secondScreen.dart';
import 'dragable.dart';
import '../globals.dart' as gb;

enum CardType { Pills, Tests, BloodFlow, Notes, Discharge }

class Hite {
  static int max = 0, min = 1, current = 2, initial = 3;
}

class HeightTracker with ChangeNotifier {
  static Map<CardType, List<dynamic>> heightMap = {
    // [max height,min height,current height]
    CardType.BloodFlow: [0.0, 0.0, 0.0, 0.0],
    CardType.Discharge: [0.0, 0.0, 0.0, 0.0],
    CardType.Tests: [0.0, 0.0, 0.0, 0.0],
    CardType.Notes: [0.0, 0.0, 0.0, 0.0],
    CardType.Pills: [0.0, 0.0, 0.0, 0.0],
  };

  void trackDrag(CardType type, double height) {
    if (gb.myController.text.length >= 1 && type == CardType.Notes) {
      gb.li[gb.pq].addAll({'notes': gb.icons['notes']});
    }
    var relativeChange = (100 / (heightMap[type][0] - heightMap[type][1])) *
        (height - heightMap[type][Hite.min]);
    heightMap.forEach((cardType, params) {
      // relative percentage change
      // eg: maxheight: 100, minHeight: 50, height of 75 means 50%

      if (cardType != type &&
          heightMap[cardType][Hite.current] > heightMap[cardType][Hite.min]) {
        // print(cardType);

        heightMap[cardType][Hite.initial] = heightMap[cardType][Hite.current];

        double newHeight = heightMap[cardType][Hite.max] +
            heightMap[cardType][Hite.min] -
            ((((relativeChange * 3) *
                        (heightMap[cardType][Hite.max] -
                            heightMap[cardType][Hite.min])) /
                    100) +
                heightMap[cardType][Hite.min]);

        if (newHeight < heightMap[cardType][Hite.current] &&
            newHeight >= heightMap[cardType][Hite.min]) {
          heightMap[cardType][Hite.current] = newHeight;
        } else {
          // heightMap[cardType][2] =
          //     (newHeight - heightMap[cardType][0] - heightMap[cardType][1])
          //         .abs();
        }
      }
    });
    print(heightMap[CardType.BloodFlow]);

    notifyListeners();
  }
}

class BottomCard extends StatefulWidget {
  final CardType type;
  final double height;
  final Widget child;
  final bool hasBorder;
  final Color col;
  final double maxDragHeight;

  const BottomCard(
      {Key key,
      this.type,
      this.col,
      this.height,
      this.child,
      this.hasBorder = true,
      this.maxDragHeight})
      : super(key: key);

  @override
  _BottomCardState createState() => _BottomCardState();
}

class _BottomCardState extends State<BottomCard> {
  double screenHeight;
  double relativeHeight = 0;
  double initialHeight, minHeight, maxHeight;
  double height;

  @override
  void initState() {
    super.initState();
    height = widget.height;
    initialHeight = height;
    minHeight = height;
    HeightTracker.heightMap[widget.type][Hite.max] = widget.maxDragHeight;
    HeightTracker.heightMap[widget.type][Hite.min] = widget.height;
    HeightTracker.heightMap[widget.type][Hite.current] = widget.height;
    HeightTracker.heightMap[widget.type][Hite.initial] = widget.height;

    print(HeightTracker.heightMap);
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).padding;
    screenHeight = screenHeight - padding.top - padding.bottom;

    // height = (screenHeight / 2) / 3;

    return Consumer<HeightTracker>(
      builder: (context, htrack, child) {
        return TrackingDraggable(
          axis: Axis.vertical,
          child: BottomContainer(
            hasBorder: widget.hasBorder,
            height: HeightTracker.heightMap[widget.type][Hite.current],
            // height,
            child: widget.child,
            col: widget.col,
          ),
          feedback: Container(
            color: Colors.transparent,
          ),
          onDragStarted: () {
            // print(HeightTracker.heightMap[widget.type][2]);
            print(HeightTracker.heightMap);
          },
          onDragUpdate: (onDragUpdate) {
            // bool shouldTrackUser = HeightTracker.heightMap[widget.type][3];
            if (relativeHeight == 0) {
              relativeHeight = onDragUpdate.localPosition.dy;
              print('RELATIVE HEIGHT SET: $relativeHeight');

              maxHeight = minHeight +
                  (relativeHeight - onDragUpdate.localPosition.dy) +
                  widget.maxDragHeight;
              HeightTracker.heightMap[widget.type][Hite.max] = maxHeight;
            } else {
              height = HeightTracker.heightMap[widget.type][Hite.initial] +
                  (relativeHeight - onDragUpdate.localPosition.dy);
              // print(height);

              height = height < minHeight ? minHeight : height;
              height = height > maxHeight ? maxHeight : height;
              HeightTracker.heightMap[widget.type][Hite.current] = height;
              print(HeightTracker.heightMap[widget.type][Hite.current]);
              // print(
              //     '${HeightTracker.heightMap[widget.type][2]}/${HeightTracker.heightMap[widget.type][0]}');

              htrack.trackDrag(widget.type, height);

              // print('$height $maxHeight');

            }
          },
          onDraggableCanceled: (velocity, offset) {
            relativeHeight = 0;
            initialHeight = height;

            print(
                'ON DRAG CANCEL: ${HeightTracker.heightMap[CardType.BloodFlow]}');
            print(HeightTracker.heightMap);
            print(HeightTracker.heightMap[widget.type][Hite.initial]);
            print(HeightTracker.heightMap[widget.type][Hite.current]);

            HeightTracker.heightMap[widget.type][Hite.initial] =
                HeightTracker.heightMap[widget.type][Hite.current];
            print(
                'ON DRAG CANCEL: ${HeightTracker.heightMap[CardType.BloodFlow]}');

            // HeightTracker.heightMap[widget.type][1] =
            //     HeightTracker.heightMap[widget.type][2];
          },
        );
      },
    );
  }
}
