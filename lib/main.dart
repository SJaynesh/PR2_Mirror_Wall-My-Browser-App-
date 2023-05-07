import 'package:flutter/material.dart';
import 'package:mirror_wall_code/View.Screens/HomePage.dart';
import 'package:mirror_wall_code/View.Screens/Spaplch_Screen.dart';
import 'package:mirror_wall_code/View.Screens/WebBrowserPage.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences Pref = await SharedPreferences.getInstance();

  bool isDark = await Pref.getBool('isDark') ?? false;

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => SpalchScreen(),
        "HomePage": (context) => HomePage(),
        "WebBrowserPage": (context) => WebBrowserPage(),
      },
    ),
  );
}
