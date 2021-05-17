import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
<<<<<<< HEAD
=======
import 'package:upcloud_tracker/Settings/globals.dart';
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2

ThemeData light = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.indigo,
    accentColor: Colors.pink,
<<<<<<< HEAD
    scaffoldBackgroundColor: Color(0xfff1f1f1));
=======
    scaffoldBackgroundColor: Colors.white);
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2

ThemeData dark = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.indigo,
  accentColor: Colors.pink,
<<<<<<< HEAD
  scaffoldBackgroundColor: Colors.black,
=======
  scaffoldBackgroundColor:Color.fromRGBO(33,33,33,1),
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
);

class ThemeNotifier extends ChangeNotifier {
  final String key = "theme";
  SharedPreferences _prefs;
  bool _darkTheme;

  bool get darkTheme => _darkTheme;

  //bool get lightTheme => _lightTheme;

  ThemeNotifier() {
    _darkTheme = true;
    _loadFromPrefs();
  }

  toggleTheme() {
    _darkTheme = !_darkTheme;
    _saveToPrefs();
    notifyListeners();
  }

  _initPrefs() async {
    if (_prefs == null) _prefs = await SharedPreferences.getInstance();
  }

  _loadFromPrefs() async {
    await _initPrefs();
    _darkTheme = _prefs.getBool(key) ?? true;
    notifyListeners();
  }

  _saveToPrefs() async {
    await _initPrefs();
    _prefs.setBool(key, _darkTheme);
  }
}
