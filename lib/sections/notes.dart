import 'package:flutter/material.dart';
import '../globals.dart' as globals;

class Notes extends StatelessWidget {
  @override
  // void dispose() {
  //   // Clean up the controller when the widget is removed from the widget tree.
  //   // This also removes the _printLatestValue listener.
  //   globals.myController.dispose();
  //   super.dispose();
  // }
  Notes();
  Widget build(BuildContext context) {
    return Card(
      child: TextField(
        maxLines: 4,
        keyboardType: TextInputType.multiline,
        controller: globals.myController,
        //maxLines: null,
      ),
    );
  }
}
