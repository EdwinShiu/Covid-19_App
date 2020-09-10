import 'package:covid19_app/Components/CaseList/caseList.dart';
import 'package:flutter/material.dart';

class CasePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
          child: Text(
            "Total Case",
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        Expanded(
          child: CaseListComponent(),
        ),
      ],
    );
  }
}