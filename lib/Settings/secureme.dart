import '../bottom_navigator.dart';
import '../widgets/custom_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:passcode/passcode.dart';
import 'package:rounded_modal/rounded_modal.dart';
import 'globals.dart' as globals;

class Secureme extends StatefulWidget {
  @override
  _SecuremeState createState() => _SecuremeState();
}

class _SecuremeState extends State<Secureme> {
  final LocalAuthentication _localAuthentication = LocalAuthentication();
  bool _canCheckBiometric = false;
  String _authorizedOrNot = "Not Authorized";
  List<BiometricType> _availableBiometricTypes = List<BiometricType>();
  bool face_check() {
    _checkBiometric();
    _getListOfBiometricTypes();
    if (_canCheckBiometric &&
        _availableBiometricTypes.contains(BiometricType.face)) {
      return true;
    } else {
      return false;
    }
  }

  bool fingerprint_check() {
    _checkBiometric();
    _getListOfBiometricTypes();
    if (_canCheckBiometric &&
        _availableBiometricTypes.contains(BiometricType.fingerprint)) {
      return true;
    } else {
      return false;
    }
  }

  bool seme1 = false;
  void _onFaceId() {
    globals.status ? globals.player.play('sound.mp3') : null;

    setState(() {
      seme1 = !seme1;
      if (seme1) {
        if (face_check()) {
          showRoundedModalBottomSheet(
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.white
                  : Colors.black,
              radius: 50,
              context: context,
              builder: (BuildContext context) {
                return Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 30),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                              width: 30,
                              child: ClipRRect(
                                child: Align(
                                  heightFactor: 1,
                                  widthFactor: 1,
                                  child: Image.asset(
                                    'assets/images/icons8-face-id-30.png',
                                    color: Colors.deepOrangeAccent,
                                  ),
                                ),
                              )),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Face Id',
                            style: TextStyle(fontSize: 17),
                          ),
                          Spacer(),
                          IconButton(
                              onPressed: () {
                                globals.status
                                    ? globals.player.play('sound.mp3')
                                    : null;

                                _authorizedOrNot == "Not Authorized"
                                    ? {
                                        setState(() {
                                          seme1 = !seme1;
                                        }),
                                        Navigator.pop(context)
                                      }
                                    : Navigator.pop(context);
                              },
                              icon: Icon(Icons.check)),
                        ],
                      ),
                      SizedBox(height: 80),
                      Container(
                          width: 60,
                          child: ClipRRect(
                            child: Align(
                              heightFactor: 1,
                              widthFactor: 1,
                              child: Image.asset(
                                'assets/images/icons8-face-id-30.png',
                                color: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? Colors.black
                                    : Colors.white,
                              ),
                            ),
                          )),
                      Center(
                        child: Text('Now you have a secure access with your'),
                      ),
                      Text(
                        'Face ID',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              });
          Future<bool> future = check();
          _authorizeNow();
        } else {}
      } else {
        //Reset Password Goes Here

        // showDialog(
        //     context: context,
        //     builder: (ctxt) => new AlertDialog(
        //           elevation: 1,
        //           title: Text("Want to reset your Face Id"),
        //         ));
      }
    });
  }

  bool seme2 = false;
  void _onFingerprint() {
    setState(() {
      globals.status ? globals.player.play('sound.mp3') : null;

      //seme2 = !seme2;
      if (seme2 == false) {
        if (fingerprint_check()) {
          showModalBottomSheet(
              isScrollControlled: true,
              isDismissible: false,
              backgroundColor: Theme.of(context).brightness == Brightness.light
                  ? Colors.white
                  : Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              )),
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width,
                  //margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 30),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.fingerprint,
                            color: Colors.deepOrangeAccent,
                            size: 35,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Fingerprint',
                            style: TextStyle(fontSize: 17),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {
                              globals.status
                                  ? globals.player.play('sound.mp3')
                                  : null;

                              _authorizedOrNot == "Not Authorized"
                                  ? Navigator.pop(context)
                                  : setState(() {
                                      seme2 = true;
                                      Navigator.pop(context);
                                    });
                            },
                            icon: Icon(Icons.check),
                            color: Colors.deepOrangeAccent,
                          ),
                        ],
                      ),
                      SizedBox(height: 100),
                      Icon(
                        Icons.fingerprint,
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.black
                            : Colors.white,
                        size: 40,
                      ),
                      SizedBox(height: 10),
                      Center(
                        child: Text('Now you have a secure access with your'),
                      ),
                      Text(
                        'Fingerprint',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              });
          //Future<bool> future = check();
          _authorizeNow();
          // check();
          // print(_authorizedOrNot);
          // if (check() == Future<bool>.value(true)) {
          //   _authorizedOrNot = "Authorized";
          // } else {
          //   // setState(() {
          //   //   seme2 = !seme2;
          //   // });
          // }
          // if (_authorizedOrNot == "Not Authorized") {

          // }
        } else {
          //If not availabe then goes here
          print('Not available');
        }
      } else {
        //Resettng goes here
        showDialog(
            context: context,
            builder: (ctxt) => new AlertDialog(
                  elevation: 1,
                  title: Text("Want to reset your fingerprints"),
                ));
      }
    });
  }

  bool seme3 = false;
  String passcode2;
  String passcode122;
  void _onPassword() {
    globals.status ? globals.player.play('sound.mp3') : null;
    setState(() {
      //seme3 = !seme3;
      if (seme3 == false) {
        showRoundedModalBottomSheet(
            dismissOnTap: false,
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.white
                : Colors.black,
            radius: 50,
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: MediaQuery.of(context).copyWith().size.height / 1.3,
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 30),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.fiber_pin,
                            color: Colors.deepOrangeAccent,
                            size: 40,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Password',
                            style: TextStyle(fontSize: 17),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {
                              passcode2 == null || passcode2.length != 4
                                  ? setState(() {
                                      //seme3 = !seme3;
                                      seme3 = false;
                                      Navigator.pop(context);
                                    })
                                  : setState(() {
                                      //seme3 = !seme3;
                                      seme3 = true;
                                      Navigator.pop(context);
                                    });
                            },
                            icon: Icon(Icons.check),
                            color: Colors.deepOrangeAccent,
                          ),
                        ],
                      ),
                      SizedBox(height: 80),
                      PasscodeTextField(
                        //obscureText: true,
                        onTextChanged: (passcode) {
                          passcode2 = passcode;
                          print(passcode.length);
                          setState(() {
                            globals.p12 = passcode2;
                          });
                        },
                        totalCharacters: 4,
                        borderColor: Colors.black,
                        passcodeType: PasscodeType.number,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50.0),
                        child: Center(
                          child: Text(
                            'Now you have a secure access with your Now you have a secure access with your',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            });
      } else {
        showRoundedModalBottomSheet(
            dismissOnTap: false,
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.white
                : Colors.black,
            radius: 50,
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: MediaQuery.of(context).copyWith().size.height / 1.3,
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 30),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.fiber_pin,
                            color: Colors.deepOrangeAccent,
                            size: 40,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Reset',
                            style: TextStyle(fontSize: 17),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {
                              // passcode2.length != 4
                              //     ? {
                              //         setState(() {
                              //           //seme2 = !seme2;
                              //           seme2 = true;
                              //         }),
                              //         Navigator.pop(context)
                              //       }
                              //     :
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.check),
                            color: Colors.deepOrangeAccent,
                          ),
                        ],
                      ),
                      SizedBox(height: 80),
                      Container(
                        padding: EdgeInsets.fromLTRB(26, 0, 26, 0),
                        width: MediaQuery.of(context).size.width,
                        height: 47,
                        //color: Colors.red,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Theme.of(context).brightness ==
                                            Brightness.light
                                        ? Colors.black
                                        : Colors.white),
                              ),
                              height: 47,
                              alignment: Alignment.center,
                              width: 47,
                              child: Text(
                                '*',
                                style: TextStyle(fontSize: 30),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Theme.of(context).brightness ==
                                            Brightness.light
                                        ? Colors.black
                                        : Colors.white),
                              ),
                              height: 47,
                              width: 47,
                              alignment: Alignment.center,
                              child: Text(
                                '*',
                                style: TextStyle(fontSize: 30),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Theme.of(context).brightness ==
                                            Brightness.light
                                        ? Colors.black
                                        : Colors.white),
                              ),
                              height: 47,
                              width: 47,
                              alignment: Alignment.center,
                              child: Text(
                                '*',
                                style: TextStyle(fontSize: 30),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Theme.of(context).brightness ==
                                            Brightness.light
                                        ? Colors.black
                                        : Colors.white),
                              ),
                              height: 47,
                              width: 47,
                              alignment: Alignment.center,
                              child: Text(
                                '*',
                                style: TextStyle(fontSize: 30),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // PasscodeTextField(
                      //   obscureText: true,
                      //   onTextChanged: (passcode) {
                      //     print(passcode.length);

                      //     setState(() {
                      //       passcode = globals.p12;
                      //     });
                      //   },
                      //   totalCharacters: 4,
                      //   borderColor: Colors.black,
                      //   passcodeType: PasscodeType.number,
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: InkWell(
                          onTap: () {
                            showRoundedModalBottomSheet(
                                dismissOnTap: false,
                                color: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? Colors.white
                                    : Colors.black,
                                radius: 50,
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    height: MediaQuery.of(context)
                                            .copyWith()
                                            .size
                                            .height /
                                        1.3,
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(0, 10, 0, 30),
                                      padding: EdgeInsets.all(10),
                                      child: Column(
                                        children: <Widget>[
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Icon(
                                                Icons.fiber_pin,
                                                color: Colors.deepOrangeAccent,
                                                size: 40,
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Text(
                                                'Password',
                                                style: TextStyle(fontSize: 17),
                                              ),
                                              Spacer(),
                                              IconButton(
                                                onPressed: () {
                                                  print(
                                                      'passcode1121:$passcode122');

                                                  passcode122 == '' ||
                                                          passcode122 !=
                                                              globals.p12 ||
                                                          passcode122.length !=
                                                              4
                                                      ? setState(() {
                                                          print(
                                                              'passcode:$passcode122');
                                                          showDialog(
                                                              context: context,
                                                              builder: (ctxt) =>
                                                                  new AlertDialog(
                                                                    elevation:
                                                                        1,
                                                                    title: Text(
                                                                        "Wrong Pasword !! Try Again"),
                                                                  ));
                                                          //seme3 = !seme3;
                                                          seme3 = true;
                                                          Navigator.pop(
                                                              context);
                                                        })
                                                      : setState(() {
                                                          print('Success');
                                                          seme3 = false;
                                                          Navigator.of(context)
                                                              .popUntil(ModalRoute
                                                                  .withName(
                                                                      'Secure'));

                                                          // Navigator.push(
                                                          //   context,
                                                          //   MaterialPageRoute(
                                                          //       builder:
                                                          //           (context) =>
                                                          //               Secureme()),
                                                          // );
                                                        });
                                                },
                                                icon: Icon(Icons.check),
                                                color: Colors.deepOrangeAccent,
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 80),
                                          PasscodeTextField(
                                            //obscureText: true,
                                            onTextChanged: (passcode) {
                                              passcode122 = passcode;
                                              print(passcode.length);
                                              // setState(() {
                                              //   globals.p12 = passcode2;
                                              // });
                                            },
                                            totalCharacters: 4,
                                            borderColor: Colors.black,
                                            passcodeType: PasscodeType.number,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 50.0),
                                            child: Center(
                                              child: Text(
                                                'Please enter your previous pin',
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                          child: Center(
                            child: Text(
                              'Continue',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            });
        // showDialog(
        //     context: context,
        //     builder: (ctxt) => new AlertDialog(
        //           elevation: 1,
        //           title: Text("Want to reset your Pin"),
        //         ));
      }
    });
  }

  Future<void> _checkBiometric() async {
    bool canCheckBiometric = false;
    try {
      canCheckBiometric = await _localAuthentication.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }

    if (!mounted) return;

    setState(() {
      _canCheckBiometric = canCheckBiometric;
    });
  }

  Future<void> _getListOfBiometricTypes() async {
    List<BiometricType> listofBiometrics;
    try {
      listofBiometrics = await _localAuthentication.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;
    setState(() {
      _availableBiometricTypes = listofBiometrics;
    });
  }

  Future<bool> check() async {
    if (_authorizedOrNot == "Authorized") {
      return Future<bool>.value(true);
    } else {
      return Future<bool>.value(false);
    }
  }

  Future<void> _authorizeNow() async {
    bool isAuthorized = false;
    try {
      isAuthorized = await _localAuthentication.authenticateWithBiometrics(
        localizedReason:
            "Please authenticate to make your profile more secure.",
        useErrorDialogs: true,
        stickyAuth: true,
      );
    } on PlatformException catch (e) {
      print(e);
    }

    if (!mounted) return;

    setState(() {
      if (isAuthorized) {
        _authorizedOrNot = "Authorized";
      } else {
        _authorizedOrNot = "Not Authorized";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 34,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      globals.status ? globals.player.play('sound.mp3') : null;

                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.navigate_before,
                      size: 30,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      globals.status ? globals.player.play('sound.mp3') : null;

                      Navigator.pop(
                        context,
                      );
                    },
                    child: Container(
                      height: 33,
                      width: 33,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 2),
                            color: Colors.black,
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: Image(
                          height: 33,
                          width: 33,
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/user1.jpg'),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    '  Secure Me',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 55,
              ),
              face_check()
                  ? Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Container(
                                width: 40,
                                child: ClipRRect(
                                  child: Align(
                                    heightFactor: 1,
                                    widthFactor: 1,
                                    child: Image.asset(
                                      'assets/images/icons8-face-id-30.png',
                                      color: Colors.deepOrangeAccent,
                                    ),
                                  ),
                                )),
                            Text(
                              'Face Id     ',
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            CustomCheckbox(
                              value: seme1,
                              abcd: _onFaceId,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                      ],
                    )
                  : SizedBox(),
              fingerprint_check()
                  ? Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Icon(
                              Icons.fingerprint,
                              color: Colors.deepOrangeAccent,
                              size: 40,
                            ),
                            Text(
                              'Fingerprint',
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            CustomCheckbox2(value: seme2, abcd: _onFingerprint),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                      ],
                    )
                  : SizedBox(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Icon(
                    Icons.fiber_pin,
                    color: Colors.deepOrangeAccent,
                    size: 40,
                  ),
                  Text(
                    'Password',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  CustomCheckbox2(value: seme3, abcd: _onPassword),
                ],
              ),
              SizedBox(
                height: 37,
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: Text(
                    'aassas sjnsdjsd sjdnsjnds dsjdnsjnd sjdnsnd aassas sjnsdjsd sjdnsjnds dsjdnsjnd sjdnsndaassas sjnsdjsd sjdnsjnds dsjdnsjnd sjdnsnd'),
              ),
            ],
          ),
        )),
                bottomNavigationBar: BottomNavbar(),

      ),
    );
  }
}
