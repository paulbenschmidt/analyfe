import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sembast/timestamp.dart';

import './activity.dart';
import './activity_repository.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ActivityRepository _activityRepository = GetIt.I.get();
  List<Activity> _activities = [];

  @override
  void initState() {
    super.initState();
    _loadActivities();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Activity Log'),
      ),
      body: ListView.builder(
        itemCount: _activities.length,
        itemBuilder: (context, index) {
          final activity = _activities[index];
          return Column(
            children: <Widget>[
              Text(activity.name),
              Text('startTime: ${activity.startTime.toDateTime()}'),
              Text('endTime: ${activity.endTime.toDateTime()}'),
              Text('sliderVal: ${activity.sliderVal}'),
              Text('counterVal: ${activity.countVal}'),
              Text('binaryVal: ${activity.binaryVal}'),
              FlatButton(
                  child: Text('Delete'),
                  onPressed: () => _deleteActivity(activity)),
              FlatButton(
                  child: Text('Update'),
                  onPressed: () => _editActivity(activity)),
              SizedBox(height: 20),
            ],
          );
          //   return ListTile(
          //     title: Text(activity.name),
          //     subtitle: Text('startTime: ${activity.countVal}'),
          //     trailing: IconButton(
          //       icon: Icon(Icons.delete),
          //       onPressed: () => _deleteActivity(activity),
          //     ),
          //     leading: IconButton(
          //       icon: Icon(Icons.thumb_up),
          //       onPressed: () => _editActivity(activity),
          //     ),
          //   );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _addActivity,
      ),
    );
  }

  _loadActivities() async {
    final activities = await _activityRepository.getAllActivities();
    setState(() => _activities = activities);
  }

  _addActivity() async {
    //final list = ['sleep', 'meditation', 'eating']..shuffle();
    final name = 'Sleep';
    final startTime = Timestamp.now();
    final endTime =
        Timestamp.fromDateTime(DateTime.now().add(new Duration(hours: 3)));
    final sliderVal = Random().nextDouble() * 10;
    final countVal = Random().nextDouble() * 10;
    final binaryVal = Random().nextBool();
    final newActivity = Activity(
      name: name,
      startTime: startTime,
      endTime: endTime,
      sliderVal: sliderVal,
      countVal: countVal,
      binaryVal: binaryVal,
    );
    await _activityRepository.insertActivity(newActivity);
    _loadActivities();
    //print(Timestamp.now());
  }

  _deleteActivity(Activity activity) async {
    await _activityRepository.deleteActivity(activity.id);
    _loadActivities();
  }

  _editActivity(Activity activity) async {
    final updatedActivity = activity.copyWith(countVal: activity.countVal + 1);
    await _activityRepository.updateActivity(updatedActivity);
    _loadActivities();
  }
}
