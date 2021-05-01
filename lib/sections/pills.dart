import '../widgets/labelled_image_list.dart';

import '../widgets/labelledimage.dart';
import 'package:flutter/material.dart';

class Pills extends StatelessWidget {
  const Pills({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LabelledImageList(
      type: ImageType.Pills,
      children: [
        LabelledImage(
          label: 'Taken',
          preclick: const SVGImage(image: 'assets/pills/pre-taken.svg'),
          onClick: const SVGImage(image: 'assets/pills/post-taken.svg'),
        ),
        LabelledImage(
          label: 'Double',
          preclick: const SVGImage(image: 'assets/pills/pre-double.svg'),
          onClick: const SVGImage(image: 'assets/pills/post-double.svg'),
        ),
        LabelledImage(
          label: 'Missed',
          preclick: const SVGImage(image: 'assets/pills/pre-missed.svg'),
          onClick: const SVGImage(image: 'assets/pills/post-missed.svg'),
        ),
        LabelledImage(
          label: 'Late',
          preclick: const SVGImage(
              image: 'assets/pills/pre-late.svg', width: 50.0, height: 50.0),
          onClick: const SVGImage(
              image: 'assets/pills/post-late.svg', width: 50.0, height: 50.0),
        ),
      ],
    );
  }
}
