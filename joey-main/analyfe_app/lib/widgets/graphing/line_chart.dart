import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:sembast/timestamp.dart';

import '../../models/outcome.dart';
import '../../dummydata.dart';

dynamic grapher(String graphType) {
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
                right: 30.0, left: 12.0, top: 24, bottom: 16),
            child: LineChart(
              _graphSwitcher(graphType),
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
          onPressed: () {},
        ),
      ),
    ],
  );
}

List<FlSpot> data(List<Outcome> outcomeList, String graphType) {
  List<FlSpot> dataPoints = [];
  switch (graphType) {
    //
    case 'daily':
      DateTime now = DateTime.now();
      for (int i = 0; i < outcomeList.length; i++) {
        DateTime date = outcomeList[i].recordedTime.toDateTime();
        //only add to datapoints if it is today's date
        if (date.year == now.year &&
            date.month == now.month &&
            date.day == now.day) {
          double graphTime = _timeToGraph(outcomeList[i].recordedTime);
          double graphVal = outcomeList[i].value;
          dataPoints.add(FlSpot(graphTime, graphVal));
        }
      }
      return dataPoints;
    //
    case 'weekly':
      DateTime todayDate = DateTime.now();
      DateTime startWeek =
          todayDate.add(new Duration(days: -todayDate.weekday));
      DateTime endWeek = startWeek.add(new Duration(days: 7));
      List sun = [];
      List mon = [];
      List tue = [];
      List wed = [];
      List thu = [];
      List fri = [];
      List sat = [];
      for (int i = 0; i < outcomeList.length; i++) {
        DateTime date = outcomeList[i].recordedTime.toDateTime();
        //only add to datapoints if it is in this week's range
        if ((date.year >= startWeek.year &&
                date.month >= startWeek.month &&
                date.day >= startWeek.day) &&
            (date.year <= endWeek.year &&
                date.month <= endWeek.month &&
                date.day <= endWeek.day)) {
          if (date.weekday == 7) {
            sun.add(outcomeList[i].value);
          } else if (date.weekday == 1) {
            mon.add(outcomeList[i].value);
          } else if (date.weekday == 2) {
            tue.add(outcomeList[i].value);
          } else if (date.weekday == 3) {
            wed.add(outcomeList[i].value);
          } else if (date.weekday == 4) {
            thu.add(outcomeList[i].value);
          } else if (date.weekday == 5) {
            fri.add(outcomeList[i].value);
          } else if (date.weekday == 6) {
            sat.add(outcomeList[i].value);
          }
        }
      }

      double _average(List list) {
        double sum = 0;
        double average = 0;
        for (int k = 0; k < list.length; k++) {
          sum = sum + list[k];
        }
        if (list.length > 0) {
          average = sum / list.length;
          average = double.parse((average).toStringAsFixed(1));
        } else {
          average = null;
        }
        return average;
      }

      double sunAvg = _average(sun);
      double monAvg = _average(mon);
      double tueAvg = _average(tue);
      double wedAvg = _average(wed);
      double thuAvg = _average(thu);
      double friAvg = _average(fri);
      double satAvg = _average(sat);
      dataPoints = [
        FlSpot(0, sunAvg),
        FlSpot(1, monAvg),
        FlSpot(2, tueAvg),
        FlSpot(3, wedAvg),
        FlSpot(4, thuAvg),
        FlSpot(5, friAvg),
        FlSpot(6, satAvg),
      ];

      return dataPoints;
    case 'monthly':
      return dataPoints = [FlSpot(0, 1)];
    case 'YTD':
      return dataPoints = [FlSpot(0, 1)];
  }

  //DateTime todayDate = DateTime.now();
  //DateTime startWeek = todayDate.add(new Duration(days: -todayDate.weekday));
  //DateTime endWeek = startWeek.add(new Duration(days: 7));
}

//switch between different graph types
LineChartData _graphSwitcher(String graphType) {
  switch (graphType) {
    case 'daily':
      return dailyChartData(graphType);
    case 'weekly':
      return weeklyChartData(graphType);
    case 'monthly':
      return dailyChartData(graphType);
    case 'YTD':
      return weeklyChartData(graphType);
  }
  return null; //error
}

List<Color> gradientColors = [
  Colors.blue,
  Colors.green,
];

//daily graph
double xAxisMaxValue = 12; //max graph time
LineChartData dailyChartData(String graphType) {
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
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        getTitles: (value) {
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
          // for (int i = 0; i <= outcomeList.length; i++) {
          //   return outcomeList[i].recordedTime.toString();
          // }
        },
        rotateAngle: 50,
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
    maxX: xAxisMaxValue,
    minY: 0,
    maxY: 10,
    lineBarsData: [
      LineChartBarData(
        spots: data(outcomeList, graphType),
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

double _timeToGraph(Timestamp timestamp) {
  DateTime day = timestamp.toDateTime(); //convert timestamp to DateTime
  double graphTime = (day.hour + (day.minute / 60)) *
      xAxisMaxValue /
      24; //convert from 24 military time to graph time
  return graphTime;
}

//Weekly graph
LineChartData weeklyChartData(String graphType) {
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
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        getTitles: (value) {
          switch (value.toInt()) {
            case 0:
              return 'Sun';
            case 1:
              return 'Mon';
            case 2:
              return 'Tue';
            case 3:
              return 'Wed';
            case 4:
              return 'Thu';
            case 5:
              return 'Fri';
            case 6:
              return 'Sat';
          }
          return '';
          // for (int i = 0; i <= outcomeList.length; i++) {
          //   return outcomeList[i].recordedTime.toString();
          // }
        },
        rotateAngle: 0,
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
    maxX: 6,
    minY: 0,
    maxY: 10,
    lineBarsData: [
      LineChartBarData(
        spots: data(outcomeList, graphType), //data(outcomeList, graphType),
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
