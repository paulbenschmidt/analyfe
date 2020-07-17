import 'package:flutter/material.dart';

import '../models/event.dart';

class TestActivityScreen extends StatefulWidget {
  static const routeName = '/test_activity';

  @override
  _TestActivityScreenState createState() => _TestActivityScreenState();
}

class _TestActivityScreenState extends State<TestActivityScreen> {
  List<Event> list = [
    Event(
      activity: 'Sleep',
      id: DateTime.now(),
      startTime: DateTime.now(),
      endTime: DateTime.now().add(new Duration(hours: 3)),
    ),
    Event(
      activity: 'Eat',
      id: DateTime.now().add(new Duration(hours: 3)),
      startTime: DateTime.now().add(new Duration(hours: 3)),
      endTime: DateTime.now().add(new Duration(hours: 6)),
    ),
  ];

  void _onPressed() async {
    //call documents
    //List<Event> newlist = [];
    List<Event> newlist = await Event.returnList();

    setState(() {
      list = newlist;
    });
    //print(list[0].id);
  }

  Widget _buildList(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Text(list[index].activity.toString()),
          SizedBox(height: 40),
          Text('id: ${list[index].id.toString()}'),
          SizedBox(height: 20),
          Text('start time: ${list[index].startTime.toString()}'),
          SizedBox(height: 20),
          Text('end time: ${list[index].endTime.toString()}'),
          SizedBox(height: 20),
          if (list[index].sliderValue != null)
            Text('slider value: ${list[index].sliderValue.toString()}'),
          if (list[index].counterValue != null)
            Text('slider value: ${list[index].counterValue.toString()}'),
          if (list[index].binaryValue != null)
            Text('slider value: ${list[index].binaryValue.toString()}'),
        ],
      ),
    );
  }

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
              itemCount: list.length,
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
}
