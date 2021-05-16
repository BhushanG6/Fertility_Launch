import 'package:flutter/material.dart';

import 'cards/blood_flow.dart';
import 'cards/notes.dart';
import 'cards/vaginal_discharge.dart';
import 'cards/pills.dart';
import 'cards/tests.dart';

class PageTwo extends StatefulWidget {
  @override
  _PageTwoState createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  List<double> heights = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildWidgets(context),
    );
  }

  Widget _buildWidgets(context) {
    return Stack(
      children: [
        BloodFlow(),
        VaginalDischarge(),
        TestsCard(),
        NotesCards(),
        PillsCard(),
      ],
    );
  }
}
