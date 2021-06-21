import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:upcloud_tracker/mns/api/mns_api.dart';

import 'cardglobal.dart';

Future getFlow() async {
  

  Uri uri = Uri.parse(
      "$baseUrl/flows/$id");
  final response = await http.get(uri);

  var responseData = json.decode(response.body);
  // flow['Light'] =
  //     responseData['data'][responseData['data'].length - 1]['light'];
  // flow['Medium'] =
  //     responseData['data'][responseData['data'].length - 1]['weight'];
  // flow['Heavy'] =
  //     responseData['data'][responseData['data'].length - 1]['cycleLength'];
  // flow['Spotted'] =
  //     responseData['data'][responseData['data'].length - 1]['periodLength'];
  
  flowData=responseData['data'][responseData['data'].length - 1];
   
  if(responseData['status']=='success')
  return responseData;

  //print(responseData)
}
Future getDischarge() async {
  

  Uri uri = Uri.parse(
      "$baseUrl/allDischarge/$id");
  final response = await http.get(uri);

  var responseData = json.decode(response.body);
  
    disData=responseData['data'][responseData['data'].length - 1];

  
   
  if(responseData['status']=='success')
  return responseData;

  //print(responseData)
}

Future getTestOvu() async {
  

  Uri uri = Uri.parse(
      "$baseUrl/allOvulation/$id");
  final response = await http.get(uri);

  var responseData = json.decode(response.body);
  testovData=responseData['data'][responseData['data'].length - 1];
   
  if(responseData['status']=='success')
  return responseData;

  //print(responseData)
}

Future getTestPreg() async {
  

  Uri uri = Uri.parse(
      "$baseUrl/allpregnancy/$id");
  final response = await http.get(uri);

  var responseData = json.decode(response.body);
   
  testprData=responseData['data'][responseData['data'].length - 1]; 
  if(responseData['status']=='success')
  return responseData;

  //print(responseData)
}

//////////////////////////////////////////////////////////////////////////////////
Future getPills() async {
  

  Uri uri = Uri.parse(
      "$baseUrl/pills/$id");
  final response = await http.get(uri);

  var responseData = json.decode(response.body);

  pillData=responseData['data'][responseData['data'].length - 1];
  if(responseData['status']=='success')
  return responseData;

  //print(responseData)
}
//////////////////////////////////////////////////////////////////////////////////////////////

Future getNotes() async {
  

  Uri uri = Uri.parse(
      "$baseUrl/notes/$id");
  final response = await http.get(uri);

  var responseData = json.decode(response.body);
  
  noteData=responseData['data'][responseData['data'].length - 1];
  
  if(responseData['status']=='success')
  return responseData;

  //print(responseData)
}