import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './pages/homepage.dart';

void main() {

  //Following codes Customizes the StatusBar & NavigationBar
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.black.withOpacity(0),
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
    systemNavigationBarDividerColor: Colors.transparent,
  ));

  //Following code will Force the App Orientation
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  String animationName;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      //Default ThemeData for App
      theme: ThemeData(
        primaryColor: Color(0xffEAC21E),
        accentColor: Color(0xffb6b6b6),
        fontFamily: 'NotoSerif',
      ),

      //The HomePage is being called here hhomepage.dart
      home: HomePage(),
    );
  }
}
