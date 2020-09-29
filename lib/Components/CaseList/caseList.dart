import 'package:covid19_app/Components/CaseList/caseRecord.dart';
import 'package:covid19_app/Data/cases.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CaseListComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cases = Provider.of<CaseApi>(context, listen: false);
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
          Container(
            color: Colors.yellow,
            height: 48,
          ),
          Expanded(
            child: ListView.builder(
              cacheExtent: 500,
              itemCount: cases.caseList.length,
              itemBuilder: (context, index) {
                return CaseRecord(index);
              }
            ),
          ),
        ],
    );
  }
}