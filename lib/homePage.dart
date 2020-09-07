
import 'package:covid19_app/Pages/Info/infoPage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
          elevation: 10,
          child: SizedBox(
            height: 80.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    color: Color(0xFF031D44),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Color(0xFF04395E),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Color(0xFF679289),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: InfoPage(),
      ),
    );
  }
}