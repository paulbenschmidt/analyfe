import 'package:flutter/material.dart';
import 'package:sembast/timestamp.dart';

import '../models/outcome.dart';
import '../models/activity.dart';

class TestScreen extends StatefulWidget {
  static const routeName = '/test';

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 550,
            child: ListView.builder(
              itemBuilder: _buildList,
              itemCount: activityList.length,
            ),
          ),
          Container(
            child: Text('gosa'),
          ),
          FlatButton(
            child: Text('Press Me'),
            onPressed: _onPressed,
          ),
        ],
      ),
    );
  }

  void _onPressed() async {
    List<Activity> newActivityList = await Activity.returnList();
    setState(() {
      activityList = newActivityList;
    });
  }

  Widget _buildList(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Text(activityList[index].name.toString()),
          SizedBox(height: 40),
          Text('id: ${activityList[index].id.toString()}'),
          SizedBox(height: 20),
          Text('start time: ${activityList[index].startTime.toString()}'),
          SizedBox(height: 20),
          Text('end time: ${activityList[index].endTime.toString()}'),
          SizedBox(height: 20),
          if (activityList[index].sliderVal != null)
            Text('slider value: ${activityList[index].sliderVal.toString()}'),
          if (activityList[index].countVal != null)
            Text('slider value: ${activityList[index].countVal.toString()}'),
        ],
      ),
    );
  }

  List<Activity> activityList = [
    Activity(
      name: 'Exercise',
      id: 1,
      startTime: Timestamp.fromDateTime(DateTime.now()),
      endTime:
          Timestamp.fromDateTime(DateTime.now().add(new Duration(hours: 3))),
    ),
    Activity(
      name: 'Exercise',
      id: 2,
      startTime:
          Timestamp.fromDateTime(DateTime.now().add(new Duration(hours: 3))),
      endTime:
          Timestamp.fromDateTime(DateTime.now().add(new Duration(hours: 4))),
    ),
    Activity(
      name: 'Exercise',
      id: 3,
      startTime:
          Timestamp.fromDateTime(DateTime.now().add(new Duration(hours: 6))),
      endTime:
          Timestamp.fromDateTime(DateTime.now().add(new Duration(hours: 7))),
    ),
    Activity(
      name: 'Exercise',
      id: 4,
      startTime:
          Timestamp.fromDateTime(DateTime.now().add(new Duration(hours: 8))),
      endTime:
          Timestamp.fromDateTime(DateTime.now().add(new Duration(hours: 9))),
    ),
  ];

  List<Outcome> outcomeList = [
    Outcome(name: 'mood', recordedTime: Timestamp.now(), sliderVal: 5.6),
    Outcome(
        name: 'mood',
        recordedTime:
            Timestamp.fromDateTime(DateTime.now().add(new Duration(hours: 1))),
        sliderVal: 6.7),
    Outcome(
        name: 'mood',
        recordedTime:
            Timestamp.fromDateTime(DateTime.now().add(new Duration(hours: 2))),
        sliderVal: 5.5),
    Outcome(
        name: 'mood',
        recordedTime:
            Timestamp.fromDateTime(DateTime.now().add(new Duration(hours: 3))),
        sliderVal: 6.2),
    Outcome(
        name: 'mood',
        recordedTime:
            Timestamp.fromDateTime(DateTime.now().add(new Duration(hours: 4))),
        sliderVal: 7.7),
    Outcome(
        name: 'mood',
        recordedTime: Timestamp.fromDateTime(
            DateTime.now().add(new Duration(hours: 5, minutes: 26))),
        sliderVal: 6.4),
  ];
}
