import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'globals1.dart' as globals1;


void getSettings() async {
  final prefs = await SharedPreferences.getInstance();

  Uri uri = Uri.parse(
      "https://project31-heroku.herokuapp.com/api/v11/user/patient/getAllInputSettings/asdfwer12423525as");
  final response = await http.get(uri);

  var responseData = json.decode(response.body);
  globals1.height =
      responseData['data'][responseData['data'].length - 1]['height'];
  globals1.weight =
      responseData['data'][responseData['data'].length - 1]['weight'];
  globals1.currentvalue =
      responseData['data'][responseData['data'].length - 1]['cycleLength'];
  globals1.currentvalue2 =
      responseData['data'][responseData['data'].length - 1]['periodLength'];
  globals1.currentvalue3 =
      responseData['data'][responseData['data'].length - 1]['ovulationLength'];
  globals1.currentvalue4 =
      responseData['data'][responseData['data'].length - 1]['pmsLength'];
  globals1.currentvalue5 =
      responseData['data'][responseData['data'].length - 1]['sanitaryUsed'];
    prefs.setInt('val', globals1.currentvalue);
    prefs.setInt('val2',globals1.currentvalue2);
    prefs.setInt('val3', globals1.currentvalue3);
    prefs.setInt('val4', globals1.currentvalue4);
    prefs.setInt('val5', int.parse(globals1.currentvalue5) );
  print(globals1.weight);
  print(globals1.height);
  print(globals1.currentvalue);
  print(globals1.currentvalue2);
  print(globals1.currentvalue3);
  print(globals1.currentvalue4);
  print(globals1.currentvalue5);

  //print(responseData);
}

void getSanitary() async {
    final prefs = await SharedPreferences.getInstance();

  Uri uri = Uri.parse(
      "https://project31-heroku.herokuapp.com/api/v11/user/patient/getallPadSettings/asdfwer12423525as");
  final response = await http.get(uri);

  var responseData = json.decode(response.body);
  //pads
  globals1.pad = responseData['data'][responseData['data'].length - 1]
      ['sanitaryPads']['pads'];
  globals1.d11 = responseData['data'][responseData['data'].length - 1]
      ['sanitaryPads']['once'];
  globals1.d12 = responseData['data'][responseData['data'].length - 1]
      ['sanitaryPads']['twice'];
  globals1.d13 = responseData['data'][responseData['data'].length - 1]
      ['sanitaryPads']['thrice'];
  globals1.d14 = responseData['data'][responseData['data'].length - 1]
      ['sanitaryPads']['fourTimes'];
  globals1.d15 = responseData['data'][responseData['data'].length - 1]
      ['sanitaryPads']['fifthHour'];
  globals1.d16 = responseData['data'][responseData['data'].length - 1]
      ['sanitaryPads']['twoHour'];

  //tampons
  globals1.tampons = responseData['data'][responseData['data'].length - 1]
      ['tampons']['tampons'];
  globals1.d21 =
      responseData['data'][responseData['data'].length - 1]['tampons']['once'];
  globals1.d22 =
      responseData['data'][responseData['data'].length - 1]['tampons']['twice'];
  globals1.d23 = responseData['data'][responseData['data'].length - 1]
      ['tampons']['thrice'];
  globals1.d24 = responseData['data'][responseData['data'].length - 1]
      ['tampons']['fourTimes'];
  globals1.d25 = responseData['data'][responseData['data'].length - 1]
      ['tampons']['fifthHour'];
  globals1.d26 = responseData['data'][responseData['data'].length - 1]
      ['tampons']['twoHour'];

  //cloth
  globals1.cloth =
      responseData['data'][responseData['data'].length - 1]['cloth']['cloth'];
  globals1.d31 =
      responseData['data'][responseData['data'].length - 1]['cloth']['once'];
  globals1.d32 =
      responseData['data'][responseData['data'].length - 1]['cloth']['twice'];
  globals1.d33 =
      responseData['data'][responseData['data'].length - 1]['cloth']['thrice'];
  globals1.d34 = responseData['data'][responseData['data'].length - 1]['cloth']
      ['fourTimes'];
  globals1.d35 = responseData['data'][responseData['data'].length - 1]['cloth']
      ['fifthHour'];
  globals1.d36 =
      responseData['data'][responseData['data'].length - 1]['cloth']['twoHour'];
  //print(responseData);

    prefs.setBool('pad', globals1.pad);
    prefs.setBool('tampons', globals1.tampons);
    prefs.setBool('cloth', globals1.cloth);

    prefs.setBool('once1', globals1.d11);
    prefs.setBool('twice1', globals1.d12);
    prefs.setBool('thrice1', globals1.d13);
    prefs.setBool('4times1', globals1.d14);
    prefs.setBool('5hours1', globals1.d15);
    prefs.setBool('2hours1', globals1.d16);
    prefs.setBool('once2', globals1.d21);
    prefs.setBool('twice2', globals1.d22);
    prefs.setBool('thrice2', globals1.d23);
    prefs.setBool('4times2', globals1.d24);
    prefs.setBool('5hours2', globals1.d25);
    prefs.setBool('2hours2', globals1.d26);
    prefs.setBool('once3', globals1.d31);
    prefs.setBool('twice3', globals1.d32);
    prefs.setBool('thrice3', globals1.d33);
    prefs.setBool('4times3', globals1.d34);
    prefs.setBool('5hours3', globals1.d35);
    prefs.setBool('2hours3', globals1.d36);
    

    
    


  print(responseData);
}

void getPeriodAlert() async {
  final prefs = await SharedPreferences.getInstance();

  Uri uri = Uri.parse(
      "https://project31-heroku.herokuapp.com/api/v11/user/patient/getallPeriodAlertSettings/asdfwer12423525as");
  final response = await http.get(uri);

  var responseData = json.decode(response.body);
  globals1.fromwhentostart =
      responseData['data'][responseData['data'].length - 1]['fromWhenToStart'];
  globals1.alert =
      responseData['data'][responseData['data'].length - 1]['periodAlert'];
  globals1.remindmeat =
      responseData['data'][responseData['data'].length - 1]['remindMeAt'];
  globals1.remindermessage =
      responseData['data'][responseData['data'].length - 1]['reminderMessage'];
  //print(responseData);
  //period alert
  //print(globals1.remindmeat);
  print( globals1.remindmeat);
    prefs.setString('remindmeat', globals1.remindmeat.toString().substring(0,3)+ globals1.remindmeat.toString().substring(3,5)) ;

    prefs.setInt('fromwhentost', globals1.fromwhentostart);
    prefs.setBool('periodalert', globals1.alert);
    prefs.setString('remindermessage', globals1.remindermessage);

}

void getPeriodEnd() async {
    final prefs = await SharedPreferences.getInstance();

  Uri uri = Uri.parse(
      "https://project31-heroku.herokuapp.com/api/v11/user/patient/getallPeriodEndSettings/asdfwer12423525as");
  final response = await http.get(uri);

  var responseData = json.decode(response.body);
  globals1.periodend =
      responseData['data'][responseData['data'].length - 1]['periodEnd'];
  globals1.reminderEnd =
      responseData['data'][responseData['data'].length - 1]['reminderMessage'];



    //periodend
    prefs.setBool('periodendbool', globals1.periodend);
    prefs.setString('reminderend', globals1.reminderEnd);
  //print(responseData);
}

void getOvulation() async {
      final prefs = await SharedPreferences.getInstance();

  Uri uri = Uri.parse(
      "https://project31-heroku.herokuapp.com/api/v11/user/patient/getallPeriodovulationSettings/asdfwer12423525as");
  final response = await http.get(uri);

  var responseData = json.decode(response.body);
  globals1.fromwhentostartovu =
      responseData['data'][responseData['data'].length - 1]['fromWhenToStart'];
  globals1.ovulation =
      responseData['data'][responseData['data'].length - 1]['ovulation'];
  globals1.remindmeatovu =
      responseData['data'][responseData['data'].length - 1]['remindMeAt'];
  globals1.remindermessageovu =
      responseData['data'][responseData['data'].length - 1]['reminderMessage'];

      //ovulation

    prefs.setString('remindmeatovu',  globals1.remindmeatovu.toString().substring(0,3)+ globals1.remindmeatovu.toString().substring(3,5));

    prefs.setInt('fromwhentostovu',globals1.fromwhentostartovu);
    prefs.setBool('ovulation', globals1.ovulation);
    prefs.setString('remindermessageovu', globals1.remindermessageovu);

  //print(responseData);
}

void getPills() async {
        final prefs = await SharedPreferences.getInstance();

  Uri uri = Uri.parse(
      "https://project31-heroku.herokuapp.com/api/v11/user/patient/getallpillsSettings/asdfwer12423525as");
  final response = await http.get(uri);

  var responseData = json.decode(response.body);
  globals1.pills =
      responseData['data'][responseData['data'].length - 1]['pills'];
  globals1.from = responseData['data'][responseData['data'].length - 1]['from'];
  globals1.till = responseData['data'][responseData['data'].length - 1]['till'];
  globals1.nameofpill =
      responseData['data'][responseData['data'].length - 1]['nameOfPill'];
  globals1.remindermessagepills =
      responseData['data'][responseData['data'].length - 1]['reminderMessage'];
  globals1.numberofpills =
      responseData['data'][responseData['data'].length - 1]['noOfPillsPerDay'];

      //pills
    
    prefs.setBool('pills', globals1.pills);
    prefs.setString('from', globals1.from.substring(8,10)+'/'+globals1.from.substring(5,7)+'/'+globals1.from.substring(0,4));
    prefs.setString('till', globals1.till.substring(8,10)+'/'+ globals1.till.substring(5,7)+'/'+ globals1.till.substring(0,4));
    prefs.setInt('numberofpills', globals1.numberofpills);
    prefs.setString('nameofpills', globals1.nameofpill);
    prefs.setString('remindermessagepills', globals1.remindermessagepills);

  //print(responseData);
}

void getContraception() async {
          final prefs = await SharedPreferences.getInstance();

  Uri uri = Uri.parse(
      "https://project31-heroku.herokuapp.com/api/v11/user/patient/getallcontraceptionSettings/asdfwer12423525as");
  final response = await http.get(uri);
  var responseData = json.decode(response.body);
  globals1.contraception =
      responseData['data'][responseData['data'].length - 1]['contraception'];

//contraception

    prefs.setBool('contraception', globals1.contraception);
  //print(responseData);
}
