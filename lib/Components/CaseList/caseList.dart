import 'package:covid19_app/Data/cases.dart';
import 'package:flutter/material.dart';

class CaseListComponent extends StatelessWidget {
  final CaseApi cases;

  CaseListComponent(this.cases);

  @override
  Widget build(BuildContext context) {
    //print(cases.caseList.length.toString());
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Text(
              "Number of cases: " + cases.caseList.length.toString(),
              style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 26),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cases.caseList.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  color: Colors.yellow,
                  height: 100,
                );
              }
            ),
          ),
        ],
    );
  }
}