import '../widgets/labelled_image_list.dart';
import '../widgets/labelledimage.dart';
import 'package:flutter/material.dart';

class Tests extends StatelessWidget {
  const Tests({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LabelledImageList(
      type: ImageType.Tests,
      children: [
        LabelledImage(
          label: 'Negative',
          preclick: const SVGImage(image: 'assets/tests/pre-click-neg.svg'),
          onClick: const SVGImage(image: 'assets/tests/post-neg.svg'),
        ),
        LabelledImage(
          label: 'Positive',
          preclick: const SVGImage(image: 'assets/tests/pre-click-pos.svg'),
          onClick: const SVGImage(image: 'assets/tests/post-pos.svg'),
        ),
      ],
    );
  }
}
