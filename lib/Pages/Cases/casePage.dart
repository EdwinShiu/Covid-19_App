import 'package:covid19_app/Components/CasePage/caseList.dart';
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
        Text("casePage"),
        FutureBuilder<CaseApi>(
          future: fetchCases(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return LoadingScreen(thirdColor);
            }
            return CaseListComponent(snapshot.data);
          },
        ),
      ],
    );
  }
}