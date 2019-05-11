import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './pages/homepage.dart';
import './bloc.dart';

void main() {
  //Following codes Customizes the StatusBar & NavigationBar.
  //Services Package were imported for these.
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
    systemNavigationBarDividerColor: Colors.transparent,
  ));

  //Following code will Force the App Orientation
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  //Bloc Class contains Logics
  final bloc = Bloc();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      //This StreamBuilder will listen data about chosen theme color and
      //change the UI acording to it.

      stream: bloc.recieveColorName,
      initialData: 'yellow',
      builder: (BuildContext context, AsyncSnapshot snapshot) => MaterialApp(
            debugShowCheckedModeBanner: false,

            //Global ThemeData for the App
            theme: ThemeData(
              primaryColor: (snapshot.data == 'yellow')
                  ? Color(0xffEAC21E)
                  : (snapshot.data == 'red')
                      ? Color(0xffff3f20)
                      : (snapshot.data == 'blue')
                          ? Color(0xff00aeff)
                          : (snapshot.data == 'green')
                              ? Color(0xff00d000)
                              : (snapshot.data == 'pink')
                                  ? Color(0xffff00a8)
                                  : Colors.grey,
              accentColor: Color(0xffb6b6b6),
              canvasColor: Colors.transparent,
              fontFamily: 'NotoSerif',
              scaffoldBackgroundColor: Colors.white,
            ),

            //The HomePage is being called here homepage.dart
            //Also the bloc is being transfered to HomePage here. Its Imp.
            home: HomePage(bloc),
          ),
    );
  }
}
