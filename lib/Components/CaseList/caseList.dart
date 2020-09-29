import 'package:covid19_app/Components/CaseList/caseRecord.dart';
import 'package:covid19_app/Components/CaseList/sortFilter.dart';
import 'package:covid19_app/Data/cases.dart';
import 'package:covid19_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CaseListComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cases = Provider.of<CaseApi>(context, listen: false);
    //print(cases.caseList.length.toString());
    return ChangeNotifierProvider<SortFilter>.value(
      value: SortFilter(),
      builder: (context, _) {
        final sortFilter = Provider.of<SortFilter>(context);
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
              margin: EdgeInsets.only(bottom: 5),
              color: secondaryColor,
              height: 48,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: MaterialButton(
                      color: Colors.white,
                      elevation: 0,
                      child: Text(
                        (sortFilter.sortingOrder == SortingOrder.ascending) ? "Ascending" : "Descending",
                        style: Theme.of(context).textTheme.headline1.copyWith(fontSize: 24),
                      ),
                      onPressed: () {
                        print(sortFilter.sortingOrder);
                        (sortFilter.sortingOrder != SortingOrder.ascending) ? sortFilter.sortingOrder = SortingOrder.ascending : sortFilter.sortingOrder = SortingOrder.descending;
                        print(sortFilter.sortingOrder);
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: MaterialButton(
                      color: Colors.white,
                      elevation: 0,
                      child: Text(
                        (sortFilter.filterOrder == FilterOrder.showAll) ? "Show All" : "Show 100",
                        style: Theme.of(context).textTheme.headline1.copyWith(fontSize: 24),
                      ),
                      onPressed: () {
                        print(sortFilter.filterOrder);
                        (sortFilter.filterOrder != FilterOrder.showAll) ? sortFilter.filterOrder = FilterOrder.showAll : sortFilter.filterOrder = FilterOrder.show100;
                        print(sortFilter.filterOrder);
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                cacheExtent: 500,
                itemCount: (sortFilter.filterOrder == FilterOrder.showAll) ? cases.caseList.length : 100,
                itemBuilder: (context, index) {
                  return CaseRecord((sortFilter.sortingOrder == SortingOrder.ascending) ? index : cases.caseList.length - index - 1);
                }
              ),
            ),
          ],
        );
      },
    );
  }
}