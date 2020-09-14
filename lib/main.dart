import 'package:covid19_app/Data/pageControl.dart';
import 'package:covid19_app/Styles/fonts.dart';
import 'package:covid19_app/homePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(headline1: headerTextTheme, bodyText1: bodyTextTheme),
      ),
      home: //Provider<PageControl>.value(
        //value: PageControl(),
        //child: 
        HomePage(),
      //),
    );
  }
}
