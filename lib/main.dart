import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upcloud_tracker/Settings/service_locator.dart';
import 'package:workmanager/workmanager.dart';
import './Settings/theme.dart';
import 'bottom_navigator.dart';
import 'month/cards/main.dart';
import 'month/monthly_view.dart';
import 'globals.dart' as globals;
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

void main() async {
  //Workmanager obj=new Workmanager();
  WidgetsFlutterBinding.ensureInitialized();
  Workmanager().initialize(backgroundJobsExecution, isInDebugMode: false);
setupLocator();

  Workmanager().registerPeriodicTask(
      "withdocreminder", "Background Reminder Execution through server",
      initialDelay: Duration(seconds: 5),
      frequency: Duration(minutes: 15),
      constraints: Constraints(networkType: NetworkType.connected));
  runApp(MyApp());
}

void backgroundJobsExecution() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var message = "404 Error";
  if (prefs.containsKey('userid') == true) {
    String id = prefs.getString('userid');
    var baseURL = 'https://withdoc.herokuapp.com/api/v11/user/search/?id=$id';
    var serverResponse = await http.get(baseURL);
    if (serverResponse.statusCode == 200) {
      var body = json.decode(serverResponse.body);
      print(body);
      var move = body['move'];
      if (move == "profile") {
        message = "Complete your Profile";
      } else if (move == "clinic") {
        message = "Complete your Clinic Profile";
      } else {
        message = "Book your appointment.";
      }
    }
  } else {
    message = "Followup your health with Withdoc";
  }
  Workmanager().executeTask((task, inputData) {
    
    FlutterLocalNotificationsPlugin notification =
        new FlutterLocalNotificationsPlugin();

    var android = new AndroidInitializationSettings('@mipmap/ic_launcher');
    var iOS = new IOSInitializationSettings();
    // initialise settings for both Android and iOS device.
    var settings = new InitializationSettings(android, iOS);
    notification.initialize(settings);
    pushNotification(notification, message);
    return Future.value(true);
  });
}

Future pushNotification(notification, message) async {
  var android = new AndroidNotificationDetails(
      'your channel id', 'your channel name', 'your channel description',
      importance: Importance.Max, priority: Priority.High);
  var iOS = new IOSNotificationDetails();
  var platformChannelSpecifics = new NotificationDetails(android, iOS);

  await notification.show(
      0, 'Withdoc Reminder!', message, platformChannelSpecifics,
      payload: 'Default_Sound');
}
class MyApp extends StatefulWidget {
  static const routeName = '/';
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DateTime date12 = new DateTime(DateTime.now().month, DateTime.now().year);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
        builder: (context, ThemeNotifier notifier, child) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Theme Provider',
              theme: notifier.darkTheme ? light : dark,
              home: Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  toolbarHeight: 5,
                ),
                body: Home(),
           bottomNavigationBar: BottomNavbar(),

              ));
        },
      ),
    );
  }
}
