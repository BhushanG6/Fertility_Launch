import 'package:flutter/material.dart';

class ListItems extends StatelessWidget {
  var filList, cWidths;
  ListItems(filList, cWidths) {
    this.filList = filList;
    this.cWidths = cWidths;
  }
  Color putCover(item) {
    if (item.length == 5) {
      if (item[4] == 'p') {
        return Colors.grey[200];
      }
    }
    //print("just white");
    return Colors.white;
  }

  FontWeight weightcover(item) {
    if (item.length == 5) return FontWeight.w600;

    return FontWeight.w400;
  }

  double Spotting(item) {
    if (item == 'Light')
      return 45.0;
    else if (item == 'Medium')
      return 70.0;
    else
      return 55.0;
  }

  bool isflowpage(item) {
    if (item[0] == 'Medium' || item[0] == 'Heavy' || item[0] == 'Light') {
      if (item[4] == 'true')
        return true;
      else
        return false;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              for (var item in filList)
                Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, bottom: 0, top: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Stack(
                          alignment: Alignment.topLeft,
                          children: <Widget>[
                            Container(
                              //color: Colors.yellow,
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(top: 10),
                              width: item[0] == 'Medium' ||
                                      item[0] == 'Heavy' ||
                                      item[0] == 'Light'
                                  ? cWidths[0] + 8.0
                                  : cWidths[0],
                              child: Text(
                                item[0],
                                textScaleFactor:
                                    MediaQuery.of(context).textScaleFactor,
                                style: TextStyle(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            isflowpage(item)
                                ? Container(
                                    margin: EdgeInsets.only(
                                        left: Spotting(item[0])),
                                    child: Icon(
                                      Icons.scatter_plot,
                                      color: Colors.red,
                                      size: 17,
                                    ),
                                  )
                                : SizedBox()
                          ],
                        ),
                        SizedBox(
                          width: cWidths[3],
                        ),
                        Container(
                          //color: Colors.yellow,
                          margin: EdgeInsets.only(top: 10),
                          alignment: Alignment.centerRight,
                          width: cWidths[1],
                          child: RichText(
                            textScaleFactor:
                                MediaQuery.of(context).textScaleFactor,
                            text: TextSpan(
                              style: TextStyle(color: Colors.black),
                              children: <TextSpan>[
                                TextSpan(
                                    text: item[1],
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17.0)),
                                TextSpan(
                                    text: item[2],
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400)),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: cWidths[3],
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 2),
                          margin: EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: putCover(item)),
                          alignment: Alignment.center,
                          width: item[0] == 'Medium' ||
                                  item[0] == 'Heavy' ||
                                  item[0] == 'Light'
                              ? cWidths[2] + 8.0
                              : cWidths[2],
                          child: Text(
                            item[3],
                            textScaleFactor:
                                MediaQuery.of(context).textScaleFactor,
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: weightcover(item)),
                          ),
                        )
                      ],
                    ))
            ],
          ),
        ));
  }
}
