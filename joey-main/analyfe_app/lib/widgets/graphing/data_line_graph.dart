import 'package:fl_chart/fl_chart.dart';
import 'package:sembast/timestamp.dart';

import '../models/outcome.dart';

List<FlSpot> linearData(List<Outcome> outcomeList, String graphType) {
  List<FlSpot> dataPoints = [];
  //DateTime now = DateTime.now();
  DateTime now = DateTime(2020, 7, 25, 21, 12, 52); //set to 7/25/2020 9:12:52PM
  switch (graphType) {
    //
    case 'daily':
      //
      //Function to convert DateTime objects to graph time
      double _timeToGraph(Timestamp timestamp) {
        double xAxisMaxValue = 12; //max graph time
        DateTime recordedTime =
            timestamp.toDateTime(); //convert timestamp to DateTime
        double graphTime = (recordedTime.hour + (recordedTime.minute / 60)) *
            xAxisMaxValue /
            24; //convert from 24 military time to graph time
        return graphTime;
      }
      //
      DateTime startToday = DateTime(now.year, now.month, now.day);
      DateTime endToday = DateTime(now.year, now.month, now.day + 1);
      for (int i = 0; i < outcomeList.length; i++) {
        DateTime recordedTime = outcomeList[i].recordedTime.toDateTime();
        //only add to datapoints if it is today's date
        if (recordedTime.isAfter(startToday) &&
            recordedTime.isBefore(endToday)) {
          double graphTime = _timeToGraph(outcomeList[i].recordedTime);
          double graphVal = outcomeList[i].sliderVal;
          dataPoints.add(FlSpot(graphTime, graphVal));
        }
      }
      //sort the time data to be chronological
      dataPoints.sort((a, b) => (a.x).compareTo(b.x));
      return dataPoints;
    //END OF DAILY DATA
    //
    case 'weekly':
      DateTime todayDate =
          DateTime(now.year, now.month, now.day); //start of today
      DateTime startWeek = todayDate
          .add(new Duration(days: -todayDate.weekday)); //beginning week
      DateTime endWeek = startWeek
          .add(new Duration(days: 7)); //end of week (crosses over months)
      //generate a list of list for a 7 day week
      int n = 7;
      List<List<double>> days = new List.generate(n, (i) => []);

      for (int i = 0; i < outcomeList.length; i++) {
        DateTime date = outcomeList[i].recordedTime.toDateTime();
        //only add to datapoints if it is in this week's range
        if (todayDate.isAfter(startWeek) && todayDate.isBefore(endWeek)) {
          //cycle through the days lists
          for (int j = 0; j < n; j++) {
            //Note weekdays go from 1-7 (Mon-Sun) but list is 0-6
            if (date.weekday == j + 1) {
              days[j].add(outcomeList[i].sliderVal);
            }
          }
        }
      }
      //
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
      for (int j = 0; j < n; j++) //cycle through the days lists
      {
        double dayAvg = _average(days[j]);
        double day = j.toDouble();
        // if (day == 7) {
        //   day = 0; //Sunday is weekday 7 but should be graphday 0
        // }
        dataPoints.add(FlSpot(day, dayAvg));
      }
      //sort the time data to be chronological
      dataPoints.sort((a, b) => (a.x).compareTo(b.x));
      return dataPoints;
    //END OF WEEKLY DATA
    //
    case 'monthly':
      DateTime startMonth = DateTime(now.year, now.month); //this month
      DateTime endMonth = DateTime(now.year,
          now.month + 1); //1+ to month goes to next year if month = Dec
      //generate a list of list for a 7 day week
      int n = endMonth
          .subtract(new Duration(days: 1))
          .day; //(n)umber of days in current month;
      List<List<double>> monthDays = new List.generate(n, (i) => []);

      for (int i = 0; i < outcomeList.length; i++) {
        DateTime date = outcomeList[i].recordedTime.toDateTime();
        //only add to datapoints if it is in this month's range
        if (date.isAfter(startMonth) && date.isBefore(endMonth)) {
          //cycle through the days lists
          for (int j = 0; j < n; j++) {
            //if the date.day matches the month date add it to the corresponding month day
            if (date.day == j + 1) {
              monthDays[j].add(outcomeList[i].sliderVal);
            }
          }
        }
      }
      //
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
      for (int j = 0; j < n; j++) //cycle through the days lists
      {
        double dayAvg = _average(monthDays[j]);
        double day = j.toDouble();
        // if (day == 7) {
        //   day = 0; //Sunday is weekday 7 but should be graphday 0
        // }
        dataPoints.add(FlSpot(day, dayAvg));
      }
      //sort the time data to be chronological
      dataPoints.sort((a, b) => (a.x).compareTo(b.x));
      return dataPoints;
    //END OF MONTHLY DATA
    //
    case 'YTD':
      return dataPoints = [FlSpot(0, 1)];
  }
  return null;
}
