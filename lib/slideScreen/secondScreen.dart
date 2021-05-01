import 'package:swipedetector/swipedetector.dart';
import '../month/monthly_view.dart' as mv;
import '../Settings/theme.dart';
import '../widgets/bottom_navbar.dart';
import 'package:provider/provider.dart';
import '../widgets/bottom_card.dart';
import 'package:flutter/material.dart';
import '../sections/sections.dart';
import '../globals.dart' as globals;

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  List<UniqueCard> previousHideCards = [];
  // function to divide bottom half of screen among every card equally
  List<Widget> _bottomCardsList(
      {@required double maxHeight,
      @required List<UniqueCard> cards,
      List<String> hideCards = const []}) {
    // print('In bottomcards. hide cards: $hideCards');

    if (hideCards.isNotEmpty) {
      hideCards.forEach((cardToHide) {
        cards.removeWhere((card) => card.heading == cardToHide);
      });
    }

    int cardNumber = 0;
    double dividedHeight = maxHeight / cards.length;
    double height = dividedHeight;
    List<BottomCard> bottomCardsList = [];

    cards.forEach((card) {
      cardNumber += 1;
      // print('${card.heading} ${card.content}');
      bottomCardsList.add(
        BottomCard(
          type: card.type,
          height: height,
          maxDragHeight: card.maxDragHeight.toDouble(),
          child: CardContent(
            heading: card.heading,
            heading2: card.heading2,
            child: card.content,
          ),
          hasBorder: cardNumber != cards.length,
          col: Theme.of(context).brightness == Brightness.light
              ? Colors.white
              : card.type == CardType.BloodFlow
                  ? Color.fromRGBO(208, 2, 27, 1)
                  : card.type == CardType.Discharge
                      ? Color.fromRGBO(74, 144, 226, 1)
                      : card.type == CardType.Tests
                          ? Color.fromRGBO(189, 16, 224, 1)
                          : card.type == CardType.Notes
                              ? Color.fromRGBO(245, 166, 35, 1)
                              : card.type == CardType.Pills
                                  ? Color.fromRGBO(80, 227, 194, 1)
                                  : Colors.black,
        ),
      );
      height += dividedHeight;
      // print(height);
    });

    bottomCardsList = bottomCardsList.reversed.toList();
    //bottomCardsList.add(BottomNavbar(currentIndex: 3,));
    return bottomCardsList;
  }

  List<String> hideCardsList = [];

  @override
  Widget build(BuildContext context) {
    void _onHorizontalDragStartHandler(DragStartDetails details) {
      setState(() {
        globals.lala = true;
      });
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => mp.MyHomePage()),
      // );
    }

    // 'Tests' cards should be hidden in PARTNER MODE.
    // invoke state change on hideCardsList to show/hide specific cards in the list

    // TEMP: GestureDetector() used to check 'hideCardsList' works properly. Remove on deploy
    return GestureDetector(
      onHorizontalDragStart: _onHorizontalDragStartHandler,
      onDoubleTap: () {
        setState(() {
          hideCardsList.isEmpty
              ? hideCardsList.add('Tests')
              : hideCardsList.clear();
          print(hideCardsList);
        });
      },
      child: ChangeNotifierProvider<HeightTracker>(
        create: (_) => HeightTracker(),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: Stack(
            // define the cards
            children: _bottomCardsList(
                maxHeight: (MediaQuery.of(context).size.height / 2) - 20,
                hideCards: hideCardsList,
                cards: [
                  UniqueCard(
                    heading: 'Pills',
                    heading2: '',
                    type: CardType.Pills,
                    content: Pills(),
                    maxDragHeight: 150.0,
                  ),
                  UniqueCard(
                    heading: 'Notes',
                    heading2: '',
                    type: CardType.Notes,
                    content: Notes(),
                    maxDragHeight: 200.0,
                  ),
                  UniqueCard(
                    heading: 'Tests',
                    heading2: '',
                    type: CardType.Tests,
                    content: Tests(),
                    maxDragHeight: 100.0,
                  ),
                  UniqueCard(
                    heading: 'Vaginal',
                    heading2: 'Discharge',
                    type: CardType.Discharge,
                    content: null,
                    maxDragHeight: 150.0,
                  ),
                  UniqueCard(
                    heading: 'Blood',
                    heading2: 'Flow',
                    type: CardType.BloodFlow,
                    content: BloodFlow(),
                    maxDragHeight: 300.0 + 50,
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}

// class to define each card
class UniqueCard {
  final CardType type;
  //final Color col;
  final String heading;
  final String heading2;
  final Widget content;
  final double maxDragHeight;

  const UniqueCard({
    @required this.heading,
    this.type,
    this.heading2,
    @required this.content,
    @required this.maxDragHeight,

    //this.col
  });
}

// stuff to render on each card
class CardContent extends StatefulWidget {
  final String heading;
  final String heading2;
  final Widget child;

  CardContent({@required this.heading, this.child, this.heading2});

  @override
  _CardContentState createState() => _CardContentState();
}

class _CardContentState extends State<CardContent> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: double.infinity,
        color: Color.fromRGBO(138, 93, 54, 1),
        // decoration: BoxDecoration(
        //   border: Border(top: BorderSide(color: col)),
        // ),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SwipeDetector(
                onSwipeRight: () {
                  setState(() {
                    mv.lala2 = true;
                  });

                  print(mv.lala2.toString());
                },
                child: Row(
                  children: [
                    Text.rich(
                      TextSpan(
                          text: widget.heading,
                          style: TextStyle(color: Colors.white, fontSize: 21),
                          children: <InlineSpan>[
                            // TextSpan(
                            //   text: heading,
                            //   style: TextStyle(color: Colors.white, fontSize: 21),
                            // ),
                            TextSpan(
                              text: ' ${widget.heading2}',
                              style: TextStyle(
                                  color: widget.heading == 'Blood' &&
                                          Theme.of(context).brightness ==
                                              Brightness.dark
                                      ? Color.fromRGBO(208, 2, 27, 1)
                                      : widget.heading == 'Vaginal' &&
                                              Theme.of(context).brightness ==
                                                  Brightness.dark
                                          ? Color.fromRGBO(74, 144, 226, 1)
                                          : Colors.white,
                                  fontSize: 21),
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 22.0),
              widget.child ?? Container(),
              SizedBox(height: 22.0),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomContainer extends StatelessWidget {
  final bool trackUser;
  final double height;
  final Widget child;
  final bool hasBorder;
  final Color col;
  const BottomContainer(
      {Key key,
      this.trackUser,
      this.height,
      this.child,
      this.hasBorder,
      this.col})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        child: Container(
            padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 21.0),
            child: child),
        height: height,
        decoration: BoxDecoration(
          color: Color.fromRGBO(138, 93, 54, 1),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          border: hasBorder ? Border.all(color: col) : null,
        ),
      ),
    );
  }
}
