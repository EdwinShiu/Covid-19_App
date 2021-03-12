import 'package:flutter/material.dart';

enum ChartView { week, month }

enum FigureType { cases, death, discharge, critical}

const appTitle = "Covid-19";

const primaryColor = Color(0xFF031D44);

const secondaryColor = Color(0xFF04395E);

const thirdColor = Color(0xFF679289);

const color1 = Color(0xFF153242);

const color2 = Color(0xFF284B63);

const color3 = Color(0xFF49BEAA);

const colorHospital = Color(0xFFD1603D);

const colorPending = Color(0xFFDDB967);

const colorDischarged = Color(0xFF666666);

const colorDeceased = Color(0xFF203037);

const colorNormal = Color(0xFFDEDEDE);

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
