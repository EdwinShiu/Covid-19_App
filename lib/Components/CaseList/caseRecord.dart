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
      height: 160,
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
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(8), topRight: Radius.circular(8)),
                  ),
                  margin: EdgeInsets.only(right: 10),
                  padding: EdgeInsets.all(5),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Age " + cases.caseList[index].age.toString() + " " + cases.caseList[index].gender,
                              style: Theme.of(context).textTheme.headline1.copyWith(fontSize: 24),
                            ),
                          ),
                          Container(
                            color: Color.fromRGBO(240, 240, 240, 1),
                            padding: EdgeInsets.all(2),
                            child: Text(
                              cases.caseList[index].caseState,
                              style: Theme.of(context).textTheme.headline1.copyWith(fontSize: 22),
                            ),
                          ),

                        ],
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Onset Date:",
                              ),
                              Text(
                                cases.caseList[index].dateOfOnset,
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ],
                          ),
                          SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Confirmed Date: ",
                              ),
                              Text(
                                cases.caseList[index].reportDate,
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ],
                          ),
                          SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Name of Hospital: ",
                              ),
                              Text(
                                (cases.caseList[index].nameOfHospital == "") ? " - " : cases.caseList[index].nameOfHospital,
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "HK/Non-HK Resident:",
                              ),
                              Text(
                                cases.caseList[index].resident,
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ],
                          ),
                          SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Confirmed/Probable:",
                              ),
                              Text(
                                cases.caseList[index].possibility,
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Case Classification:",
                            ),
                            Text(
                              cases.caseList[index].classification,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}