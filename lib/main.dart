import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:upcloud_tracker/month/cards/provider.dart/card_provider.dart';
import './Settings/theme.dart';
import 'month/monthly_view.dart';
import 'globals.dart' as globals;
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

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
              theme: notifier.darkTheme ? light : dark,
              home: Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  toolbarHeight: 5,
                ),
                body: ChangeNotifierProvider(
                  create: (context) => CardProvider(),
                  builder: (context, child) => child,
                  child: MonthlyView(
                    month: DateTime.now().month,
                    year: DateTime.now().year,
                    valu: globals.lop[globals.pq],
                  ),
                ),
              ));
        },
      ),
    );
  }
}
