import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
void postSetting(String id,int height,int weight,String sanitary_used,int cycle_length,int period_length,int ovulation_length,int pms_length)
async{
      
    Uri url = Uri.parse('https://project31-heroku.herokuapp.com/api/v11/user/patient/inputSettings');

    var headers = {'Content-Type': 'application/json'};
    // Store all data with Param Name.
    var data = {
      "patientId": "asdfwer12423525as",
            "cycleLength": cycle_length,
            "periodLength": period_length,
            "ovuationLength": ovulation_length,
            "sanitaryUsed": sanitary_used,
            "pmsLength": pms_length,
            "height": height,
            "weight": weight,
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
