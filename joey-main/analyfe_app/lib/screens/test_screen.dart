import 'package:flutter/material.dart';
import 'package:sembast/timestamp.dart';

import '../models/outcome.dart';
import '../models/event.dart';

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
    List<Event> newActivityList = await Event.returnList();
    setState(() {
      activityList = newActivityList;
    });
  }

  Widget _buildList(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Text(activityList[index].activityName.toString()),
          SizedBox(height: 40),
          Text('id: ${activityList[index].id.toString()}'),
          SizedBox(height: 20),
          Text('start time: ${activityList[index].startTime.toString()}'),
          SizedBox(height: 20),
          Text('end time: ${activityList[index].endTime.toString()}'),
          SizedBox(height: 20),
          if (activityList[index].sliderValue != null)
            Text('slider value: ${activityList[index].sliderValue.toString()}'),
          if (activityList[index].counterValue != null)
            Text(
                'slider value: ${activityList[index].counterValue.toString()}'),
          if (activityList[index].binaryValue != null)
            Text('slider value: ${activityList[index].binaryValue.toString()}'),
        ],
      ),
    );
  }

  List<Event> activityList = [
    Event(
      activityName: 'Exercise',
      id: DateTime.now().add(new Duration(hours: 3)),
      startTime: DateTime.now(),
      endTime: DateTime.now().add(new Duration(hours: 3)),
    ),
    Event(
      activityName: 'Exercise',
      id: DateTime.now().add(new Duration(hours: 6)),
      startTime: DateTime.now().add(new Duration(hours: 5)),
      endTime: DateTime.now().add(new Duration(hours: 6)),
    ),
    Event(
      activityName: 'Exercise',
      id: DateTime.now().add(new Duration(hours: 9)),
      startTime: DateTime.now().add(new Duration(hours: 8)),
      endTime: DateTime.now().add(new Duration(hours: 9)),
    ),
    Event(
      activityName: 'Exercise',
      id: DateTime.now().add(new Duration(hours: 6)),
      startTime: DateTime.now().add(new Duration(hours: 5)),
      endTime: DateTime.now().add(new Duration(hours: 6)),
    ),
  ];

  List<Outcome> outcomeList = [
    Outcome(name: 'mood', recordedTime: Timestamp.now(), value: 5.6),
    Outcome(
        name: 'mood',
        recordedTime:
            Timestamp.fromDateTime(DateTime.now().add(new Duration(hours: 1))),
        value: 6.7),
    Outcome(
        name: 'mood',
        recordedTime:
            Timestamp.fromDateTime(DateTime.now().add(new Duration(hours: 2))),
        value: 5.5),
    Outcome(
        name: 'mood',
        recordedTime:
            Timestamp.fromDateTime(DateTime.now().add(new Duration(hours: 3))),
        value: 6.2),
    Outcome(
        name: 'mood',
        recordedTime:
            Timestamp.fromDateTime(DateTime.now().add(new Duration(hours: 4))),
        value: 7.7),
    Outcome(
        name: 'mood',
        recordedTime: Timestamp.fromDateTime(
            DateTime.now().add(new Duration(hours: 5, minutes: 26))),
        value: 6.4),
  ];
}
