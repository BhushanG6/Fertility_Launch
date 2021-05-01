import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'globals1.dart' as globals1;
void postSetting()
async{
      
    Uri url = Uri.parse('https://project31-heroku.herokuapp.com/api/v11/user/patient/inputSettings');

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
void postPads()
async{
     
    Uri url = Uri.parse('https://project31-heroku.herokuapp.com/api/v11/user/patient/padSettings');

    var headers = {'Content-Type': 'application/json'};
    // Store all data with Param Name.
    //if(globals1.pad==true)
    var data = {
      
            "sanitaryPads": {
                "pads": globals1.pad,
                "once": false,
                "twice": false,
                "thrice": false,
                "fourTimes": true,
                "fifthHour": false,
                "twoHour": false
            },
            "tampons": {
                "tampons": false,
                "once": false,
                "twice": false,
                "thrice": false,
                "fourTimes": false,
                "fifthHour": false,
                "twoHour": false
            },
            "cloth": {
                "cloth": false,
                "once": false,
                "twice": false,
                "thrice": false,
                "fourTimes": false,
                "fifthHour": false,
                "twoHour": false
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