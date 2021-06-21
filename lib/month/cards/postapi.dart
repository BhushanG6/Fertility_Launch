import 'dart:convert';
import 'package:upcloud_tracker/Settings/globals1.dart';
import 'package:upcloud_tracker/month/cards/cardglobal.dart';
import 'package:upcloud_tracker/month/cards/cards/blood_flow.dart';
import 'package:http/http.dart' as http;
import 'cards/pills.dart';

void postFlow() async {
  Uri url = Uri.parse(
      '$baseUrl/flow');

  var headers = {'Content-Type': 'application/json'};
  // Store all data with Param Name.
  var data = {
    "patientId": id,
    "light": flow['Light'],
    "medium": flow['Medium'],
    "heavy": flow['Heavy'],
    "spotting": flow['Spotted']
    // "lightCount": 0,
    // "mediumCount": 1,
    // "heavyCount": 0,
    // "spottingCount": 0,
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

void postDischarge() async {
  Uri url = Uri.parse(
      '$baseUrl/discharge');

  var headers = {'Content-Type': 'application/json'};
  // Store all data with Param Name.
  var data = {
    "patientId": id,
    "dry": selectval['Dry'],
    "sticky": selectval['Sticky'],
    "creamy": selectval['Creamy'],
    "watery": selectval['Watery'],
    "eggWhite": selectval['Egg']
    // "dryCount": 0,
    // "stickyCount": 0,
    // "creamyCount": 0,
    // "wateryCount": 0,
    // "eggWhiteCount": 1,
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

void postTest() async {
  Uri urlO = Uri.parse(
      '$baseUrl/ovulation');
  Uri urlP = Uri.parse(
      '$baseUrl/pregnancy');

  var headers = {'Content-Type': 'application/json'};
  // Store all data with Param Name.
  var dataO = {
    "patientId": id,
    "positive": ovu['Positive'],
    "negative": ovu['Negative']
  };
  var dataP = {
    "patientId": id,
    "positive": preg['Positive'],
    "negative": preg['Negative']
  };
  print(dataO);
  // Starting Web API Call.
  var responseO = await http.Client().post(
    urlO,
    headers: headers,
    body: jsonEncode(dataO),
  );

  var responseP = await http.Client().post(
    urlP,
    headers: headers,
    body: jsonEncode(dataP),
  );
  // Getting Server response into variable.
  var messageO = jsonDecode(responseO.body);
  var messageP = jsonDecode(responseP.body);
  //res=message;
  print(messageO);
  print(messageP);
}

void postPill() async {
  Uri url = Uri.parse(
      '$baseUrl/pill');

  var headers = {'Content-Type': 'application/json'};
  // Store all data with Param Name.
  var data = {
    "patientId": id,
    "taken": pill['Taken'],
    "missed": pill['Missed'],
    "late": pill['Late'],
    "double": pill['Double']
    
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

void postNote() async {
  Uri url = Uri.parse(
      '$baseUrl/note');

  var headers = {'Content-Type': 'application/json'};
  // Store all data with Param Name.
  var data = {
    "patientId": id,
    "note": note
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
