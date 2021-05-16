import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'labelledimage.dart';

class LabelledImageList extends StatelessWidget {
  final List<LabelledImage> children;
  final ImageType type;

  const LabelledImageList({Key key, this.type, this.children})
      : super(key: key);

  List<LabelledImage> _buildChildren(List<LabelledImage> children) {
    List<LabelledImage> newChildren = [];
    int count = 0;

    children.forEach((child) {
      newChildren.add(
        LabelledImage(
            label: child.label,
            type: type,
            index: ++count,
            preclick: child.preclick,
            onClick: child.onClick),
      );
      // print(count);
    });
    return newChildren;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ToggleSwitch>(
      create: (_) => ToggleSwitch(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //crossAxisAlignment: CrossAxisAlignment.baseline,
        children: _buildChildren(children),
      ),
    );
  }
}
