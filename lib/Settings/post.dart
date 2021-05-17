import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'globals1.dart' as globals1;

void postSetting() async {
  final prefs = await SharedPreferences.getInstance();

  Uri url = Uri.parse(
      'https://project31-heroku.herokuapp.com/api/v11/user/patient/inputSettings');

  var headers = {'Content-Type': 'application/json'};
  // Store all data with Param Name.
  var data = {
    "patientId": "asdfwer12423525as",
    "cycleLength": (prefs.getInt('val') ?? 0),
    "periodLength": (prefs.getInt('val2') ?? 0),
    "ovulationLength": (prefs.getInt('val3') ?? 0),
    "sanitaryUsed": (prefs.getInt('val5') ?? 0),
    "pmsLength": (prefs.getInt('val4') ?? 0),
    "height": (prefs.getString('height') ?? '170'),
    "weight": (prefs.getString('weight') ?? '50'),
  };
  print(data);
  // Starting Web API Call.
  var response = await http.Client().post(
    url,
    headers: headers,
    body: jsonEncode(data),
  );

  // Getting Server response into variable.
  var message = jsonDecode(response.body);
  //res=message;
  print(message);
}

void postPads() async {
  final prefs = await SharedPreferences.getInstance();

  Uri url = Uri.parse(
      'https://project31-heroku.herokuapp.com/api/v11/user/patient/padSettings');

  var headers = {'Content-Type': 'application/json'};
  // Store all data with Param Name.
  //if(globals1.pad==true)
  var data = {
    "sanitaryPads": {
      "pads": (prefs.getBool('pad') ?? false),
      "once": (prefs.getBool('once1') ?? false),
      "twice": (prefs.getBool('twice1') ?? false),
      "thrice": (prefs.getBool('thrice1') ?? false),
      "fourTimes": (prefs.getBool('4times1') ?? false),
      "fifthHour": (prefs.getBool('5hours1') ?? false),
      "twoHour": (prefs.getBool('2hours1') ?? false)
    },
    "tampons": {
      "tampons": (prefs.getBool('tampons') ?? false),
      "once": (prefs.getBool('once2') ?? false),
      "twice": (prefs.getBool('twice2') ?? false),
      "thrice": (prefs.getBool('thrice2') ?? false),
      "fourTimes": (prefs.getBool('4times2') ?? false),
      "fifthHour": (prefs.getBool('5hours2') ?? false),
      "twoHour": (prefs.getBool('2hours2') ?? false)
    },
    "cloth": {
      "cloth": (prefs.getBool('cloth') ?? false),
      "once": (prefs.getBool('once3') ?? false),
      "twice": (prefs.getBool('twice3') ?? false),
      "thrice": (prefs.getBool('thrice3') ?? false),
      "fourTimes": (prefs.getBool('4times3') ?? false),
      "fifthHour": (prefs.getBool('5hours3') ?? false),
      "twoHour": (prefs.getBool('2hours3') ?? false)
    },
    "patientId": "asdfwer12423525as"
  };
  print(data);
  // Starting Web API Call.
  var response = await http.Client().post(
    url,
    headers: headers,
    body: jsonEncode(data),
  );

  // Getting Server response into variable.
  var message = jsonDecode(response.body);
  //res=message;
  print(message);
}

void postPeriodAlert() async {
  final prefs = await SharedPreferences.getInstance();

  Uri url = Uri.parse(
      'https://project31-heroku.herokuapp.com/api/v11/user/patient/periodAlertSettings');

  var headers = {'Content-Type': 'application/json'};
  // Store all data with Param Name.
  //Period alert
  var data = {
    // "_id": "6082e9e1651df61ce4605d80",
    "patientId": "asdfwer12423525as",
    "fromWhenToStart": (prefs.getInt('fromwhentost') ?? 0),
    "periodAlert": (prefs.getBool('periodalert') ?? false),
    "remindMeAt": (prefs.get('remindmeat') ?? '0'),
    "reminderMessage": (prefs.getString('remindermessage') ?? '')
  };
  print(data);
  // Starting Web API Call.
  var response = await http.Client().post(
    url,
    headers: headers,
    body: jsonEncode(data),
  );

  // Getting Server response into variable.
  var message = jsonDecode(response.body);
  //res=message;
  print(message);
}

void postPeriodEnd() async {
  final prefs = await SharedPreferences.getInstance();

  Uri url = Uri.parse(
      'https://project31-heroku.herokuapp.com/api/v11/user/patient/periodEndSettings');

  var headers = {'Content-Type': 'application/json'};
  // Store all data with Param Name.
  var data = {
    "patientId": "asdfwer12423525as",
    "periodEnd": (prefs.getBool('periodendbool') ?? false),
    //"_id": "6082fa827ed5e84854e0ad2c",

    "reminderMessage": (prefs.getString('reminderend') ?? '')
  };
  print(data);
  // Starting Web API Call.
  var response = await http.Client().post(
    url,
    headers: headers,
    body: jsonEncode(data),
  );

  // Getting Server response into variable.
  var message = jsonDecode(response.body);
  //res=message;
  print(message);
}

void postOvulation() async {
  final prefs = await SharedPreferences.getInstance();

  Uri url = Uri.parse(
      'https://project31-heroku.herokuapp.com/api/v11/user/patient/periodovulationSettings');

  var headers = {'Content-Type': 'application/json'};
  // Store all data with Param Name.
  //if(globals1.pad==true)
  var data = {
    
      //"_id": "6082fe7be06d032ea45f16de",
      "patientId": "asdfwer12423525as",
      "fromWhenToStart": (prefs.getInt('fromwhentostovu') ?? 0),
      "ovulation": (prefs.getBool('ovulation') ?? false),
      "remindMeAt": (prefs.get('remindmeatovu') ?? '0'),
      "reminderMessage": (prefs.getString('remindermessageovu') ?? '')
    
  };
  print(data);
  // Starting Web API Call.
  var response = await http.Client().post(
    url,
    headers: headers,
    body: jsonEncode(data),
  );

  // Getting Server response into variable.
  var message = jsonDecode(response.body);
  //res=message;
  print(message);
}

void postPills() async {
  final prefs = await SharedPreferences.getInstance();

  Uri url = Uri.parse(
      'https://project31-heroku.herokuapp.com/api/v11/user/patient/pillsSettings');

  var headers = {'Content-Type': 'application/json'};
  // Store all data with Param Name.
  //if(globals1.pad==true)
  var data = {
    //"_id": "608cef291578f5002205f0b0",
    "pills": (prefs.getBool('pills') ?? false),
    "patientId": "asdfwer12423525as",
    "from": (prefs.getString('from') ?? ''),
    "till": (prefs.getString('till') ?? ''),
    "nameOfPill": (prefs.getString('nameofpills') ?? ''),
    "reminderMessage": (prefs.getString('remindermessagepills') ?? ''),
    "stages": "3",
    "noOfPillsPerDay": (prefs.getInt('numberofpills') ?? 0)
  };
  print(data);
  // Starting Web API Call.
  var response = await http.Client().post(
    url,
    headers: headers,
    body: jsonEncode(data),
  );

  // Getting Server response into variable.
  var message = jsonDecode(response.body);
  //res=message;
  print(message);
}

void postContraception() async {
  final prefs = await SharedPreferences.getInstance();

  Uri url = Uri.parse(
      'https://project31-heroku.herokuapp.com/api/v11/user/patient/contraceptionSettings');

  var headers = {'Content-Type': 'application/json'};
  // Store all data with Param Name.
  //if(globals1.pad==true)
  var data = {
    
      "patientId": "asdfwer12423525as",

      "contraception": (prefs.getBool('contraception') ?? false)
      //"_id": "608306aeb96ad5701419e248",
    
  };
  print(data);
  // Starting Web API Call.
  var response = await http.Client().post(
    url,
    headers: headers,
    body: jsonEncode(data),
  );

  // Getting Server response into variable.
  var message = jsonDecode(response.body);
  //res=message;
  print(message);
}
