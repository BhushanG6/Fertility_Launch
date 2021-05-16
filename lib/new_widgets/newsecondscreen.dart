import '../slideScreen/secondScreen.dart';
import '../widgets/bottom_card.dart';
import 'package:provider/provider.dart';
import '../sections/sections.dart';
import '../widgets/bottom_navbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../slideScreen/activityScreen.dart';
import '../globals.dart' as globals;

// Brown Part of the Month Screen.
class NewSecondScreen extends StatefulWidget {
  // final int month;
  // final int year;
  // NewSecondScreen(this.month, this.year);

  @override
  _NewSecondScreenState createState() => _NewSecondScreenState();
}

class _NewSecondScreenState extends State<NewSecondScreen> {
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

  bool value = false;

  final bool isActive = false;

  final int index = 0;

  var sc;
  List<String> hideCardsList = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18.0),
          topRight: Radius.circular(18.0),
        ),
      ),
      child: Container(
        // height: MediaQuery.of(context).size.height / 3,
        // decoration: BoxDecoration(
        //   color: Colors.brown,
        //   borderRadius: BorderRadius.only(
        //     topLeft: Radius.circular(24.0),
        //     topRight: Radius.circular(24.0),
        //   ),
        // ),
        //change heres
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
        // Container(
        //   height: (MediaQuery.of(context).size.height - 70) / 2,
        //   width: MediaQuery.of(context).size.width,
        //   decoration: BoxDecoration(
        //     color: Colors.red,
        //     borderRadius: BorderRadius.only(
        //       topLeft: Radius.circular(24.0),
        //       topRight: Radius.circular(24.0),
        //     ),
        //   ),
        // ),
        // Positioned(
        //   top: 57,
        //   child: Container(
        //     height: 0.8 * ((MediaQuery.of(context).size.height - 70) / 2),
        //     width: MediaQuery.of(context).size.width,
        //     decoration: BoxDecoration(
        //       color: Colors.green,
        //       borderRadius: BorderRadius.only(
        //         topLeft: Radius.circular(24.0),
        //         topRight: Radius.circular(24.0),
        //       ),
        //     ),
        //   ),
        // ),
        // Positioned(
        //   top: 114,
        //   child: Container(
        //     height: 0.6 * ((MediaQuery.of(context).size.height - 70) / 2),
        //     width: MediaQuery.of(context).size.width,
        //     decoration: BoxDecoration(
        //       color: Colors.yellow,
        //       borderRadius: BorderRadius.only(
        //         topLeft: Radius.circular(24.0),
        //         topRight: Radius.circular(24.0),
        //       ),
        //     ),
        //   ),
        // ),
        // Positioned(
        //   top: 171,
        //   child: Container(
        //     height: 0.4 * ((MediaQuery.of(context).size.height - 70) / 2),
        //     width: MediaQuery.of(context).size.width,
        //     decoration: BoxDecoration(
        //       color: Colors.orange,
        //       borderRadius: BorderRadius.only(
        //         topLeft: Radius.circular(24.0),
        //         topRight: Radius.circular(24.0),
        //       ),
        //     ),
        //   ),
        // ),
        // Positioned(
        //   top: 228,
        //   child: Container(
        //     height: 0.2 * ((MediaQuery.of(context).size.height - 70) / 2),
        //     width: MediaQuery.of(context).size.width,
        //     decoration: BoxDecoration(
        //       color: Colors.blue,
        //       borderRadius: BorderRadius.only(
        //         topLeft: Radius.circular(24.0),
        //         topRight: Radius.circular(24.0),
        //       ),
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
