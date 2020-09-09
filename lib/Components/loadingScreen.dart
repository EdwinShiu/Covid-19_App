import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatelessWidget {
  final Color color;

  LoadingScreen(this.color);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Center(
        child: SpinKitDualRing(
          color: color,
          size: 50,
        ),
      ),
    ); 
  }
}