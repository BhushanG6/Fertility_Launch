import '../widgets/labelled_image_list.dart';
import '../widgets/labelledimage.dart';
import 'package:flutter/material.dart';

// import '../globals.dart' as globals;

// void addinmap2(String s) {
//   globals.li[globals.d][0]['bloodflow'] = 'B' + s;
//   print(globals.li[globals.d][0]['bloodflow']);
// }

// void addinmap3(String s) {
//   var x = globals.li[globals.d][0]['bloodflow'];
//   globals.li[globals.d][0]['bloodflow'] = x + s;
//   print(globals.li[globals.d][0]['bloodflow']);
// }

class BloodFlow extends StatelessWidget {
  // const BloodFlow({
  //   Key key,
  // }) : super(key: key);
  // void addinmap() {
  //   print(globals.d);
  //   print(globals.li[globals.d]);
  //   setState(() {
  //     globals.li[globals.d].addAll({'bloodflow': globals.icons['bloodflow']});
  //   });

  //   print(globals.li[globals.d]);
  // }

  @override
  Widget build(BuildContext context) {
    // setState(() {
    //   globals.str = 'B';
    // });

    return Column(
      children: [
        LabelledImageList(
          type: ImageType.BloodFlow,
          children: [
            LabelledImage(
              //abcd: 'B',
              label: 'Light',
              preclick: const SVGImage(image: 'assets/periods/light-pre.svg'),
              onClick: const SVGImage(image: 'assets/periods/light-post.svg'),

              //BL
            ),
            LabelledImage(
              //abcd: 'B',
              label: 'Medium',
              preclick: const SVGImage(image: 'assets/periods/medium-pre.svg'),
              onClick: const SVGImage(image: 'assets/periods/medium-post.svg'),

              //BM
            ),
            LabelledImage(
              label: 'Heavy',
              preclick: const SVGImage(image: 'assets/periods/heavy-pre.svg'),
              onClick: const SVGImage(image: 'assets/periods/heavy-post.svg'),
              //abcd: 'B',
              //BH
            ),
            LabelledImage(
              label: 'Spotting',
              preclick:
                  const SVGImage(image: 'assets/periods/Spotting-pre.svg'),
              onClick:
                  const SVGImage(image: 'assets/periods/Spotting-post.svg'),
              //abcd: 'B',
              //BS
            ),
          ],
        ),
        SizedBox(
          height: 12.0,
        ),

        LabelledImageList(
          type: ImageType.BFColor,
          children: [
            LabelledImage(
              label: 'Blue',
              preclick: const SVGImage(image: 'assets/pills/pre-late.svg'),
              onClick: const SVGImage(image: 'assets/pills/post-late.svg'),
              //abcd: () => addinmap(),
              //B_B
            ),
            LabelledImage(
              label: 'Green',
              preclick: const SVGImage(image: 'assets/pills/pre-late.svg'),
              onClick: const SVGImage(image: 'assets/pills/post-late.svg'),
              //abcd: () => addinmap(),
              //B_G
            ),
            LabelledImage(
              label: 'Red',
              preclick: const SVGImage(image: 'assets/pills/pre-late.svg'),
              onClick: const SVGImage(image: 'assets/pills/post-late.svg'),
              //abcd: () => addinmap(),
              //B_R
            ),
          ],
        ),

        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //   children: [
        //     LabelledImage(
        //       label: 'Blue',
        //       type: ImageType.BFColor,
        //       index: 1,
        //       preclick: 'assets/pills/pre-late.svg',
        //       onClick: 'assets/pills/post-late.svg',
        //     ),
        //     LabelledImage(
        //       label: 'Green',
        //       type: ImageType.BFColor,
        //       index: 2,
        //       preclick: 'assets/pills/pre-late.svg',
        //       onClick: 'assets/pills/post-late.svg',
        //     ),
        //     LabelledImage(
        //       label: 'Red',
        //       type: ImageType.BFColor,
        //       index: 3,
        //       preclick: 'assets/pills/pre-late.svg',
        //       onClick: 'assets/pills/post-late.svg',
        //     ),
        //   ],
        // )
      ],
    );
  }
}
