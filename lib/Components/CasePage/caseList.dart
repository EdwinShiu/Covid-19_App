import 'package:covid19_app/Data/cases.dart';
import 'package:flutter/material.dart';

class CaseListComponent extends StatelessWidget {
  final CaseApi cases;

  CaseListComponent(this.cases);

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
    );
  }
}