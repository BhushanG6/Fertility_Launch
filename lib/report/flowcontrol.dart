import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:convert' as convert;

class FlowController {
  var monthmap = {
    1: 'Jan',
    2: 'Feb',
    3: 'Mar',
    4: 'Apr',
    5: 'May',
    6: 'Jun',
    7: 'Jul',
    8: 'Aug',
    9: 'Sep',
    10: 'Oct',
    11: 'Nov',
    12: 'Dec'
  };
  var weekmap = {
    1: 'Mon',
    2: 'Tue',
    3: 'Wed',
    4: 'Thu',
    5: 'Fri',
    6: 'Sat',
    7: 'Sun'
  };
  List<List<String>> moodlog = [];
  final List confirmRespList = List();

  Future fetchNotif(baseUrl) async {
    try {
      print("Connecting to server");
      var client = http.Client();
      var url = Uri.parse('$baseUrl');
      var response = await client.get(url);

      var jsonResponse = convert.jsonDecode(response.body);
      if (response.statusCode == 200) {
        return {'status': 'success', 'data': jsonResponse['data']};
      }
    } catch (e) {
      print(e);
    }
  }
}
