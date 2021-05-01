import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../globals.dart' as globals;

enum ImageType {
  Pills,
  Tests,
  BloodFlow,
  BFColor,
}

class LabelledImage extends StatefulWidget {
  final String label;
  final ImageType type;
  final int index;
  final SVGImage preclick;
  final SVGImage onClick;
  String abcd;

  LabelledImage({
    Key key,
    @required this.label,
    @required this.preclick,
    @required this.onClick,
    this.type,
    this.abcd,
    this.index,
  }) : super(key: key);

  @override
  _LabelledImageState createState() => _LabelledImageState();
}

class _LabelledImageState extends State<LabelledImage> {
  bool showPreclickImage = true;

  @override
  Widget build(BuildContext context) {
    final SVGImage preclick = widget.preclick;
    final SVGImage onClick = widget.onClick;
    var toggleSwitch = Provider.of<ToggleSwitch>(context, listen: true);
    return GestureDetector(
      onTap: () {
        toggleSwitch.toggleState(widget.type, widget.index);
        print('tapped: ${widget.type} : ${widget.index}');
        setState(() {
          print(globals.pq);
          print(globals.li[globals.pq]);
          print(globals.str);

          if ('${widget.type}' == 'ImageType.BloodFlow') {
            if (globals.li[globals.pq]['discharge'] == null &&
                globals.li[globals.pq]['pills'] == null) {
              globals.li[globals.pq]
                  .addAll({'bloodflow': globals.icons['bloodflow']});
            }
          } else if ('${widget.type}' == 'ImageType.Discharge') {
            if (globals.li[globals.pq]['bloodflow'] == null &&
                globals.li[globals.pq]['pills'] == null) {
              globals.li[globals.pq]
                  .addAll({'discharge': globals.icons['discharge']});
            }
          } else if ('${widget.type}' == 'ImageType.Tests') {
            globals.li[globals.pq].addAll({'tests': globals.icons['tests']});
          } else if ('${widget.type}' == 'ImageType.Pills') {
            if (globals.li[globals.pq]['bloodflow'] == null &&
                globals.li[globals.pq]['discharge'] == null) {
              globals.li[globals.pq].addAll({'pills': globals.icons['pills']});
            }
          }

          // });
          print(globals.li);
          //widget.abcd();
        });
        // );
      },
      child: Container(
        child: Consumer<ToggleSwitch>(
          builder: (context, tswitch, child) {
            return Column(
              children: [
                ToggleSwitch.switchStates[widget.type][0] == widget.index &&
                        ToggleSwitch.switchStates[widget.type][1] == true
                    ? SvgPicture.asset(
                        onClick.image,
                        width: onClick.width,
                      )
                    : SvgPicture.asset(
                        preclick.image,
                        width: preclick.width,
                      ),
                // showPreclickImage ? widget.preclick : widget.onClick,
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  widget.label,
                  style: TextStyle(fontSize: 13.0),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class ToggleSwitch with ChangeNotifier {
  static Map<ImageType, List<dynamic>> switchStates = {
    ImageType.Pills: [0, false],
    ImageType.Tests: [0, false],
    ImageType.BloodFlow: [0, false],
    ImageType.BFColor: [0, false],
  };

  void toggleState(ImageType imageType, int index) {
    print(switchStates);
    print('$imageType : $index');
    bool tapState = switchStates[imageType][1];

    if (index == switchStates[imageType][1]) {
      switchStates[imageType] = [index, !tapState];
    } else {
      switchStates[imageType] = [index, true];
    }
    print('$switchStates');
    notifyListeners();
  }
}

class SVGImage {
  final String image;
  final double width;
  final double height;
  final Color color;

  const SVGImage({@required this.image, this.width, this.height, this.color});
}
