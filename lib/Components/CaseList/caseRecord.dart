import 'package:covid19_app/Data/cases.dart';
import 'package:covid19_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CaseRecord extends StatelessWidget {

  final int index;

  CaseRecord(this.index);

  @override
  Widget build(BuildContext context) {
    final cases = Provider.of<CaseApi>(context, listen: false);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Color.fromRGBO(245, 250, 250, 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: double.infinity,
              color: color1,
              child: Text(
                cases.caseList[index].caseNumber.toString(),
                style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Stack(
              children: [
                Container(
                  color: Colors.red,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Age: " + cases.caseList[index].age.toString() + " " + cases.caseList[index].gender,
                          ),

                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Onset Date: " + cases.caseList[index].dateOfOnset + " Confirmed Date: " + cases.caseList[index].reportDate,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(8), topRight: Radius.circular(8)),
                  ),
                  margin: EdgeInsets.only(right: 10)
                ),
              ],
            ),
          ),
        ],
      ),
      height: 150,
    );
  }
}