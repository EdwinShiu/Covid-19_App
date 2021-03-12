
import 'package:covid19_app/Components/loadingScreen.dart';
import 'package:covid19_app/Data/cases.dart';
import 'package:covid19_app/Data/fetchCase.dart';
import 'package:covid19_app/Components/bottomAppBar.dart';
import 'package:covid19_app/Data/pageControl.dart';
import 'package:covid19_app/Pages/Cases/casePage.dart';
import 'package:covid19_app/Pages/Info/infoPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Data/caseFigures.dart';



class HomePage extends StatefulWidget {
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  PageController _mainPageController;

  @override
  void initState() {
    super.initState();
    _mainPageController = PageController();
  }

  @override
  void dispose() {
    _mainPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final PageControl pageControl = Provider.of<PageControl>(context);
    //print(pageControl);
    return SafeArea(
      child: FutureProvider<CaseApi>.value(
        value: fetchCases(),
        builder: (context, _) {
          final cases = Provider.of<CaseApi>(context);
          return FutureProvider<CaseFiguresApi>.value(
            value: fetchCaseFigures(),
            builder: (context, _) {
              final figures = Provider.of<CaseFiguresApi>(context);

              if (cases == null || figures == null) {
                return LoadingScreen(Color(0xFF333333));
              }
              return Scaffold(
                bottomNavigationBar: BottomNavBar(_mainPageController),
                body: PageView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _mainPageController,
                  children: [
                    InfoPage(),
                    CasePage(),
                  ],
                ),
              );
            }
          );
        },
      ),
    );
  }
}