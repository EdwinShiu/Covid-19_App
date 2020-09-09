
import 'package:covid19_app/Pages/Cases/casePage.dart';
import 'package:covid19_app/Pages/Info/infoPage.dart';
import 'package:covid19_app/constants.dart';
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
                    color: primaryColor,
                  ),
                ),
                Expanded(
                  child: Container(
                    color: secondaryColor,
                  ),
                ),
                Expanded(
                  child: Container(
                    color: thirdColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: CasePage(),
      ),
    );
  }
}