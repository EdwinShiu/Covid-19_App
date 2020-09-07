import 'package:covid19_app/homePage.dart';
import 'package:flutter/material.dart';
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
      ),
      home: HomePage(),
    );
  }
}
