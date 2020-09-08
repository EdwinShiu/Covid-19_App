import 'package:covid19_app/Components/InfoPage/fourBoxChart.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              "Last Update: 2020-09-07",
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