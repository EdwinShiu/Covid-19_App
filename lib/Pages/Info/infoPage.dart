import 'package:covid19_app/Components/InfoPage/fourBoxChart.dart';
import 'package:covid19_app/Data/caseFigures.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';

class InfoPage extends StatelessWidget {

  String getLastUpdate(List<CaseFigures> figures) {
    if (figures == null || figures.length == 0) {
      return "NA";
    }
    final date = figures[figures.length - 1].date;
    return date.substring(6, 10) + "-" + date.substring(3, 5) + "-" + date.substring(0, 2);
  }

  @override
  Widget build(BuildContext context) {
    final figures = Provider.of<CaseFiguresApi>(context)?.caseFigures;
    
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              "Info Page",
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Container(
            child: Text(
              "Last Update: " + getLastUpdate(figures),
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                FourBoxChart(),
                //PastInfectedNumberChart(),
                //AgeChart(),
                //GenderChart(),
                //CaseClassificationChart(),
                //ResidentChart(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}