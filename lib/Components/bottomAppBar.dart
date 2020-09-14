import 'package:covid19_app/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
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
                    final newRoute = "/infoPage";
                    String currentRoute = "";
                    navigatorKey.currentState.popUntil((route) {
                      print("route" + route.settings.name.toString());
                      currentRoute = route.settings.name;
                      return true;
                    });
                    print("current route " + currentRoute.toString());
                    navigatorKey.currentState.pushReplacementNamed(newRoute);
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