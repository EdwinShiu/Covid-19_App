import 'package:covid19_app/Components/CaseList/caseList.dart';
import 'package:covid19_app/Components/loadingScreen.dart';
import 'package:covid19_app/Data/cases.dart';
import 'package:covid19_app/Data/fetchCase.dart';
import 'package:covid19_app/constants.dart';
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
          child: FutureBuilder<CaseApi>(
            future: fetchCases(),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return LoadingScreen(thirdColor);
              }
              return CaseListComponent(snapshot.data);
            },
          ),
        ),
      ],
    );
  }
}