import 'package:flutter/material.dart';
import 'package:mirror_wall_code/Controllers/LinerValue_Provider.dart';
import 'package:mirror_wall_code/Controllers/PopupMenuItemSelect_Provider.dart';
import 'package:mirror_wall_code/View.Screens/HomePage.dart';
import 'package:mirror_wall_code/View.Screens/Spaplch_Screen.dart';
import 'package:mirror_wall_code/View.Screens/WebBrowserPage.dart';

import 'package:provider/provider.dart';

void main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> LinerValue_Provider()),
        ChangeNotifierProvider(create: (context)=> PopupMenuItemSelect_Provider()),
      ],
      builder: (context,_) =>  MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/": (context) => SpalchScreen(),
          "HomePage": (context) => HomePage(),
          "WebBrowserPage": (context) => WebBrowserPage(),
        },
      ),
    ),
  );
}
