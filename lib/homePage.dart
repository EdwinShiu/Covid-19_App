
import 'package:covid19_app/Components/loadingScreen.dart';
import 'package:covid19_app/Data/cases.dart';
import 'package:covid19_app/Data/fetchCase.dart';
import 'package:covid19_app/Pages/Cases/casePage.dart';
import 'package:covid19_app/Pages/Info/infoPage.dart';
import 'package:covid19_app/Components/bottomAppBar.dart';
import 'package:covid19_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureProvider<CaseApi>.value(
        value: fetchCases(),
        builder: (context, _) {
            final cases = Provider.of<CaseApi>(context);
            print(cases);
            if (cases == null) {
              return LoadingScreen(Color(0xFF333333));
            }
            return Scaffold(
            bottomNavigationBar: BottomNavBar(),
            body: Navigator(
              key: navigatorKey,
              onGenerateRoute: (settings) {
                print(settings.name);
                return MaterialPageRoute(
                  builder: (context) {
                    switch (settings.name) {
                      case "/infoPage": return InfoPage();
                      default: return Container();
                    }
                  }
                );
              },
            ),
          );
        },
      ),
    );
  }
}