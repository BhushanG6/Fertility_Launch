import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
<<<<<<< HEAD
import 'package:upcloud_tracker/month/cards/provider.dart/card_provider.dart';
import './Settings/theme.dart';
=======
import 'package:upcloud_tracker/Settings/service_locator.dart';
import './Settings/theme.dart';
import 'bottom_navigator.dart';
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
import 'month/monthly_view.dart';
import 'globals.dart' as globals;
import 'package:flutter/services.dart';

<<<<<<< HEAD
void main() => runApp(MyApp());
=======
void main() {
setupLocator();

runApp(MyApp());
} 
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2

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
<<<<<<< HEAD
=======
              title: 'Flutter Theme Provider',
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
              theme: notifier.darkTheme ? light : dark,
              home: Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  toolbarHeight: 5,
                ),
<<<<<<< HEAD
                body: ChangeNotifierProvider(
                  create: (context) => CardProvider(),
                  builder: (context, child) => child,
                  child: MonthlyView(
                    month: DateTime.now().month,
                    year: DateTime.now().year,
                    valu: globals.lop[globals.pq],
                  ),
                ),
=======
                body: MonthlyView(
                  month: DateTime.now().month,
                  year: DateTime.now().year,
                  valu: globals.lop[globals.pq],
                ),
           bottomNavigationBar: BottomNavbar(),

>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
              ));
        },
      ),
    );
  }
}
