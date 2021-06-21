import 'package:flutter/material.dart';
import 'two_bars.dart';
import 'paragraph.dart';
import 'flowcontrol.dart';

class IrRegularPeriod extends StatefulWidget {
  @override
  _IrRegularPeriodState createState() => _IrRegularPeriodState();
}

class _IrRegularPeriodState extends State<IrRegularPeriod> {
  _IrRegularPeriodState() {
    this.latestprot = ['', ''];
    this.latestunprot = ['', ''];
    this.totalprcnt = 0;
    this.totalunprcnt = 0;
  }
  void initState() {
    super.initState();
    this.monthmap = fController.monthmap;
    this.weekmap = fController.weekmap;
    getdata();
  }

  String description =
      "Sed ut perspiciatis unde omnis iste natus error sit volupta tem accusant ium doloremque laudantium. Totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. ";
  final FlowController fController = new FlowController();
  List<List<List<String>>> listTabs = [];
  List<List<double>> listwidths = [];
  var tsf, w, flowdata;
  List<String> latestprot, latestunprot;
  var doneloading, weekmap, monthmap;
  int totalprcnt, totalunprcnt;
  getdata() async {
    await fController
        .fetchNotif(
            "https://project31-heroku.herokuapp.com/api/v11/user/patient/regAndIrregs/asdfwe424sd5as")
        .then((value) {
      setState(() {
        flowdata = value['data'];
        String date1, date2, strDate;

        //Latest type of period
        for (int i = flowdata.length - 1; i >= 0; i--) {
          strDate = flowdata[i]["actualStartDate"];
          DateTime todayDate = DateTime.parse(strDate);
          date1 = todayDate.day.toString() +
              " " +
              monthmap[todayDate.month].toString();
          date2 = ", " + (todayDate.year).toString().substring(2);
          if (flowdata[i]['irregular'] == true) {
            latestunprot = [date1, date2];
            break;
          }
        }

        this.totalprcnt = flowdata[flowdata.length - 1]['regularCount'];
        this.totalunprcnt = flowdata[flowdata.length - 1]['irregularCount'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
              child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 40, 0, 0),
                          child: IconButton(
                            icon:
                                Icon(Icons.arrow_back_ios, color: Colors.black),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 20),
                          child: Text('IrRegular Period',
                              style: TextStyle(
                                  fontSize: 22.0, fontWeight: FontWeight.w500)),
                        ),
                        GetPara(description),
                        SizedBox(
                          height: 40,
                        ),
                        TwoBars(
                            [totalprcnt, totalunprcnt],
                            170,
                            [latestprot, latestunprot],
                            Color(0xffFF6262),
                            Color(0xff8BFF62),
                            'Regular',
                            'ir Regular'),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, top: 30.0),
                          child: Text('Myth',
                              style: TextStyle(
                                  fontSize: 22.0, fontWeight: FontWeight.w500)),
                        ),
                        GetPara(description),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 30.0),
                          child: Text('Fact',
                              style: TextStyle(
                                  fontSize: 22.0, fontWeight: FontWeight.w500)),
                        ),
                        GetPara(description),
                        SizedBox(
                          height: 50,
                        ),
                      ]))),
        ));
  }
}
