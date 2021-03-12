import 'package:covid19_app/Data/caseFigures.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math';
import 'dart:core';
import '../../constants.dart';

class FourBoxChart extends StatelessWidget {

  // Get the date for the x-axis
  String getDate(double value, List figures, ChartView view) {
    var xPos = value.toInt();
    String date = figures[xPos]["date"];
    return date.substring(0, 2) + "/" + date.substring(3, 5);
  }

  // Get the scale for y-axis
  String getYScale(double value, List figures) {
    var yPos = value.toInt() - 1;
    List<int> temp = figures.map((d) => int.parse(d["value"].toString())).toList();
    int minValue = temp.reduce(min) - 10;
    int maxValue = temp.reduce(max) + 10;
    int bound = ((maxValue - minValue) / 100).ceil() * 100;
    if (yPos == 0) {
      return (minValue).toString();
    }
    return (minValue + bound * yPos / 4).toInt().toString(); 
  }

  double normalizeY(double value, List figures) {
    List<int> temp = figures.map((d) => int.parse(d["value"].toString())).toList();
    int minValue = temp.reduce(min) - 10;
    //print("minValue" + minValue.toString());
    int maxValue = temp.reduce(max) + 10;
    int bound = ((maxValue - minValue) / 100).ceil() * 100;
    print("value " + value.toString());
    print((value - minValue) * 4 / bound);
    return (value - minValue) * 4 / bound + 1;
  }

  // Create lineGraph
  Widget lineGraph(List data, ChartView chartView) {
    if (chartView == ChartView.week) {
      data = data.sublist(data.length-7);
    }
    return LineChart(
      returnData(data, chartView),
    );
  }

  // Data for lineGraph
  LineChartData returnData(List data, ChartView chartView) {
    List<Color> gradientColors = [
      const Color(0xff23b6e6),
      const Color(0xff02d39a),
    ];
    print(data);
    return LineChartData(
      lineTouchData: LineTouchData(enabled: false),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        getDrawingVerticalLine: (x) => FlLine(color: Color(0xFFC4C4C4), strokeWidth: 1),
        getDrawingHorizontalLine: (y) => FlLine(color: Color(0xFFC4C4C4), strokeWidth: 1),
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 18,
          getTextStyles: (value) => const TextStyle(color: Color(0xff333333), fontSize: 12),
          getTitles: (value) => getDate(value, data, chartView)
        ),
        leftTitles: SideTitles(
          showTitles: true,
          reservedSize: 35,
          getTextStyles: (value) => const TextStyle(color: Color(0xff333333), fontSize: 12),
          getTitles: (value) => getYScale(value, data),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: Color(0xFFC4C4C4), width: 1),
      ),
      minX: 0,
      maxX: 6,
      minY: 1,
      maxY: 5,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, normalizeY(data[0]["value"].toDouble(), data)),
            FlSpot(1, normalizeY(data[1]["value"].toDouble(), data)),
            FlSpot(2, normalizeY(data[2]["value"].toDouble(), data)),
            FlSpot(3, normalizeY(data[3]["value"].toDouble(), data)),
            FlSpot(4, normalizeY(data[4]["value"].toDouble(), data)),
            FlSpot(5, normalizeY(data[5]["value"].toDouble(), data)),
            FlSpot(6, normalizeY(data[6]["value"].toDouble(), data)),
          ],
          isCurved: true,
          colors: [
            ColorTween(begin: gradientColors[0], end: gradientColors[1]).lerp(0.2),
            ColorTween(begin: gradientColors[0], end: gradientColors[1]).lerp(0.2),
          ],
          barWidth: 5,
        ),
      ],
    );
  }

  DateTime getLastDate(List<CaseFigures> figures) {
    String date = figures[figures.length-1].date;
    return DateTime.utc(int.parse(date.substring(6, 10)), int.parse(date.substring(3, 5)), int.parse(date.substring(0, 2)));
  }

  @override
  Widget build(BuildContext context) {

    final figures = Provider.of<CaseFiguresApi>(context)?.caseFigures;
    print(figures?.length);
    final lastDate = getLastDate(figures);
    

    return Container(
      margin: EdgeInsets.only(top: 10),
      height: MediaQuery.of(context).size.height - 200,
      child: Column(
      children: [
        Flexible(
          flex: 1,
          child: Container(
            //height: height,
            margin: EdgeInsets.all(5),
            child: lineGraph(figures.map((d) => ({"date": d.date, "value": d.confirmCase})).toList(), ChartView.week),
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(
            //height: height,
            margin: EdgeInsets.all(5),
            child: lineGraph(figures.map((d) => ({"date": d.date, "value": d.deathCase})).toList(), ChartView.week),
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(
            //height: height,
            margin: EdgeInsets.all(5),
            child: lineGraph(figures.map((d) => ({"date": d.date, "value": d.dischargeCase})).toList(), ChartView.week),
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(
            //height: height,
            margin: EdgeInsets.all(5),
            child: lineGraph(figures.map((d) => ({"date": d.date, "value": d.criticalCondition})).toList(), ChartView.week),
          ),
        ),
      ],
      ),
    );
  }
}