import 'package:analyfe_app/dummydata.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

dynamic grapher(List<FlSpot> data, String graphType) {
  return Stack(
    children: <Widget>[
      AspectRatio(
        aspectRatio: 1.70,
        child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(18),
              ),
              color: Colors.black),
          child: Padding(
            padding: const EdgeInsets.only(
                right: 30.0, left: 0.0, top: 24, bottom: 16),
            child: LineChart(
              chartData(data, graphType),
            ),
          ),
        ),
      ),
      Center(
        child: FlatButton(
          child: Text(
            'Test 2',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            DateTime now = DateTime(2020, 9, 23);
            DateTime startMonth = DateTime(now.year, now.month);
            DateTime endMonth = DateTime(now.year, now.month + 1);
            int monthDays = endMonth.subtract(new Duration(days: 1)).day;
            print(startMonth);
            print(endMonth);
            print(monthDays);
          },
        ),
      ),
    ],
  );
}

//
//_____________________________________________________________________
//
LineChartData chartData(List<FlSpot> data, String graphType) {
  return LineChartData(
    gridData: FlGridData(
      show: true,
      drawVerticalLine: true,
      getDrawingHorizontalLine: (value) {
        return FlLine(
          color: Colors.grey,
          strokeWidth: 1,
        );
      },
      getDrawingVerticalLine: (value) {
        return FlLine(
          color: Colors.grey,
          strokeWidth: 1,
        );
      },
    ),
    titlesData: FlTitlesData(
      show: true,
      bottomTitles: SideTitles(
        showTitles: true,
        reservedSize: 22,
        textStyle: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
        getTitles: _horizAxis(graphType),
        rotateAngle: _angleText(graphType),
        margin: 8,
      ),
      leftTitles: SideTitles(
        showTitles: true,
        textStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
        getTitles: (value) {
          return value.round().toString();
        },
        reservedSize: 28,
        margin: 12,
      ),
    ),
    borderData: FlBorderData(
        show: true, border: Border.all(color: Colors.grey, width: 1)),
    minX: 0,
    maxX: _xAxisCount(graphType),
    minY: 0,
    maxY: 10,
    lineBarsData: [
      LineChartBarData(
        spots: data,
        isCurved: true,
        colors: gradientColors,
        barWidth: 5,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
          show: true,
          colors:
              gradientColors.map((color) => color.withOpacity(0.3)).toList(),
        ),
      ),
    ],
  );
}
//
//_____________________________________________________________________
//

List<Color> gradientColors = [
  Colors.blue,
  Colors.green,
];

double _angleText(String graphType) {
  switch (graphType) {
    case 'daily':
      return 50;
    case 'weekly':
      return 0;
    case 'monthly':
      return 90;
    case 'YTD':
      return 50;
  }
  return null; //error
}

double _xAxisCount(String graphType) {
  switch (graphType) {
    case 'daily':
      return 12;
    case 'weekly':
      return 6;
    case 'monthly':
      DateTime now = DateTime.now(); //current month
      DateTime endMonth =
          DateTime(now.year, now.month + 1); //start of next month
      int monthDays =
          endMonth.subtract(new Duration(days: 1)).day; //days of current month
      return monthDays.toDouble() - 1; //because graph starts with 0
    case 'YTD':
      return 11;
  }
  return null; //error
}

Function(double) _horizAxis(String graphType) {
  switch (graphType) {
    case 'daily':
      return (value) {
        switch (value.toInt()) {
          case 1:
            return '2AM';
          case 2:
            return '4AM';
          case 3:
            return '6AM';
          case 4:
            return '8AM';
          case 5:
            return '10AM';
          case 6:
            return '12PM';
          case 7:
            return '2PM';
          case 8:
            return '4PM';
          case 9:
            return '6PM';
          case 10:
            return '8PM';
          case 11:
            return '10PM';
          case 12:
            return '12AM';
        }
        return '';
      };

    case 'weekly':
      return (value) {
        switch (value.toInt()) {
          case 0:
            return 'Mon';
          case 1:
            return 'Tue';
          case 2:
            return 'Wed';
          case 3:
            return 'Thu';
          case 4:
            return 'Fri';
          case 5:
            return 'Sat';
          case 6:
            return 'Sun';
        }
        return '';
      };
    case 'monthly':
      return (value) {
        value++; //add to value so it starts at 1 instead of 0
        return value.toInt().toString();
      };
    //FIX THIS TO GO START AT 1

    case 'YTD':
      return (value) {
        switch (value.toInt()) {
          case 0:
            return 'Jan';
          case 1:
            return 'Feb';
          case 2:
            return 'Mar';
          case 3:
            return 'Apr';
          case 4:
            return 'May';
          case 5:
            return 'Jun';
          case 6:
            return 'Jul';
          case 7:
            return 'Aug';
          case 8:
            return 'Sep';
          case 9:
            return 'Oct';
          case 10:
            return 'Nov';
          case 11:
            return 'Dec';
        }
        return '';
      };
  }
  return null; //error
}
