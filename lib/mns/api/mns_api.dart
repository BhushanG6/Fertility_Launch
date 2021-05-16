import 'dart:convert';

import 'package:http/http.dart' as http;

final baseURL =
    'https://project31-heroku.herokuapp.com/api/v11/user/patient/60184b9fdaca274396fa2f8e/symptoms';
final client = http.Client();

Future getData() async {
  http.Response res = await client.get(
    baseURL,
    headers: {"Content-Type": "application/json"},
  );

  final jsonData = json.decode(res.body);
  if (res.statusCode == 200) {
    return {'status': 'success', 'data': jsonData['data']};
  }
  return {'status': 'fail', 'message': jsonData['message']};
}

Future getRandomData(var id) async {
  //clinic?id=123dfasasd12e2ewf
  String url = '$baseURL/clinic?id=$id';
  http.Response res = await client.get(
    url,
    headers: {"Content-Type": "application/json"},
  );
  final jsonData = json.decode(res.body);
  if (res.statusCode == 200) {
    return {'status': 'success', 'data': jsonData['data']};
  }
  return {'status': 'fail', 'message': jsonData['message']};
}
