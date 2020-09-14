import 'package:covid19_app/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {

  PageController _mainPageController;

  BottomNavBar(this._mainPageController);
  
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 10,
      child: SizedBox(
        height: 80.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Material(
                color: primaryColor,
                child: InkWell(
                  onTap: () {
                    print("button1");
                    _mainPageController.animateToPage(0, duration: const Duration(microseconds: 1), curve: Curves.linear);
                  },
                ),
              ),
            ),
            Expanded(
              child: Material(
                color: secondaryColor,
                child: InkWell(
                  onTap: () {
                    print("button2");
                  },
                ),
              ),
            ),
            Expanded(
              child: Material(
                color: thirdColor,
                child: InkWell(
                  onTap: () {
                    print("button3");
                    _mainPageController.animateToPage(1, duration: const Duration(microseconds: 1), curve: Curves.linear);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}