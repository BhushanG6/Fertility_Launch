import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class GetPara extends StatelessWidget {
  String description;
  GetPara(description) {
    this.description = description;
  }
  int getLength(widthy, tsf) {
    String tempstr = "";
    int i = 0, l;
    double s = 0.0;
    while (true) {
      tempstr = tempstr + description[i];
      Size A = (TextPainter(
              text: TextSpan(
                  text: tempstr,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
              maxLines: 1,
              textScaleFactor: tsf,
              textDirection: TextDirection.ltr)
            ..layout())
          .size;
      s = A.width;
      if ((s - ((widthy) * 3.2)).abs() < 20) {
        return i;
      }
      i++;
    }
  }

  @override
  Widget build(BuildContext context) {
    var tsf = MediaQuery.of(context).textScaleFactor;
    var widthy = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
      child: ReadMoreText(
        description,
        textAlign: TextAlign.start,
        textDirection: TextDirection.ltr,
        textScaleFactor: tsf,
        trimLength: getLength(widthy - 40, tsf),
        trimMode: TrimMode.Length,
        colorClickableText: Color(0xffDD864D),
        trimCollapsedText: 'see more',
        trimExpandedText: 'see less',
        style: TextStyle(
          color: Colors.black,
          fontSize: 17.0,
        ),
        delimiterStyle: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w500),
        lessStyle: TextStyle(
            fontSize: 17.0,
            fontWeight: FontWeight.w500,
            color: Color(0xffDD864D)),
        moreStyle: TextStyle(
            fontSize: 17.0,
            fontWeight: FontWeight.w500,
            color: Color(0xffDD864D)),
      ),
    );
  }
}
