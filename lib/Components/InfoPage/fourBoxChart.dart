import 'package:flutter/material.dart';

class FourBoxChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      childAspectRatio: 2,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Container(
          margin: EdgeInsets.all(5),
          color: Colors.yellow,
        ),
        Container(
          margin: EdgeInsets.all(5),
          color: Colors.yellow,
        ),
        Container(
          margin: EdgeInsets.all(5),
          color: Colors.yellow,
        ),
        Container(
          margin: EdgeInsets.all(5),
          color: Colors.yellow,
        ),
      ],
    );
  }
}