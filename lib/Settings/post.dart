import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'globals1.dart' as globals1;

void postSetting() async {
  Uri url = Uri.parse(
      'https://project31-heroku.herokuapp.com/api/v11/user/patient/inputSettings');

  var headers = {'Content-Type': 'application/json'};
  // Store all data with Param Name.
  var data = {
    "patientId": "asdfwer12423525as",
    "cycleLength": globals1.currentvalue,
    "periodLength": globals1.currentvalue2,
    "ovuationLength": globals1.currentvalue3,
    "sanitaryUsed": globals1.currentvalue5,
    "pmsLength": globals1.currentvalue4,
    "height": 180,
    "weight": 60,
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
  Uri url = Uri.parse(
      'https://project31-heroku.herokuapp.com/api/v11/user/patient/padSettings');

  var headers = {'Content-Type': 'application/json'};
  // Store all data with Param Name.
  //if(globals1.pad==true)
  var data = {
    "sanitaryPads": {
      "pads": globals1.pad,
      "once": globals1.d11,
      "twice": globals1.d12,
      "thrice": globals1.d13,
      "fourTimes": globals1.d14,
      "fifthHour": globals1.d15,
      "twoHour": globals1.d16
    },
    "tampons": {
      "tampons": globals1.tampons,
      "once": globals1.d21,
      "twice": globals1.d22,
      "thrice": globals1.d23,
      "fourTimes": globals1.d24,
      "fifthHour": globals1.d25,
      "twoHour": globals1.d26
    },
    "cloth": {
      "cloth": globals1.cloth,
      "once": globals1.d31,
      "twice": globals1.d32,
      "thrice": globals1.d33,
      "fourTimes": globals1.d34,
      "fifthHour": globals1.d35,
      "twoHour": globals1.d36
    },
    "patientId": "asdfwer12423525as",
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
  Uri url = Uri.parse(
      'https://project31-heroku.herokuapp.com/api/v11/user/patient/periodAlertSettings');

  var headers = {'Content-Type': 'application/json'};
  // Store all data with Param Name.
  //if(globals1.pad==true)
  var data = {
    // "_id": "6082e9e1651df61ce4605d80",
    "patientId": "asdfwer12423525as",
    "fromWhenToStart": globals1.fromwhentostart,
    "periodAlert": globals1.alert,
    "remindMeAt": globals1.remindmeat.toString(),
    "reminderMessage": globals1.remindermessage,
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
  Uri url = Uri.parse(
      'https://project31-heroku.herokuapp.com/api/v11/user/patient/periodEndSettings');

  var headers = {'Content-Type': 'application/json'};
  // Store all data with Param Name.
  //if(globals1.pad==true)
  var data = {
    "patientId": "asdfwer12423525as",
    "periodEnd": globals1.periodend,
    //"_id": "6082fa827ed5e84854e0ad2c",

    "reminderMessage": globals1.reminderEnd,
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
  Uri url = Uri.parse(
      'https://project31-heroku.herokuapp.com/api/v11/user/patient/periodovulationSettings');

  var headers = {'Content-Type': 'application/json'};
  // Store all data with Param Name.
  //if(globals1.pad==true)
  var data = {
    {
            //"_id": "6082fe7be06d032ea45f16de",
            "patientId": "asdfwer12423525as",
            "fromWhenToStart": globals1.fromwhentostartovu,
            "ovulation": globals1.ovulation,
            "remindMeAt": globals1.remindmeatovu,
            "reminderMessage":globals1.remindermessageovu,
           
        },
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
  Uri url = Uri.parse(
      'https://project31-heroku.herokuapp.com/api/v11/user/patient/pillsSettings');

  var headers = {'Content-Type': 'application/json'};
  // Store all data with Param Name.
  //if(globals1.pad==true)
  var data = {
    {
            //"_id": "608cef291578f5002205f0b0",
            "pills": globals1.pills,
            "patientId": "asdfwer12423525as",
            "from": globals1.from,
            "till": globals1.till,
            "nameOfPill": globals1.nameofpill,
            "reminderMessage": globals1.remindermessagepills,
            "stages": "3",
            "noOfPillsPerDay": globals1.numberofpills,
           
        },
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
  Uri url = Uri.parse(
      'https://project31-heroku.herokuapp.com/api/v11/user/patient/contraceptionSettings');

  var headers = {'Content-Type': 'application/json'};
  // Store all data with Param Name.
  //if(globals1.pad==true)
  var data = {
    { 
            "patientId": "asdfwer12423525as",

            "contraception": globals1.contraception,
            //"_id": "608306aeb96ad5701419e248",
          
        
        },
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
     