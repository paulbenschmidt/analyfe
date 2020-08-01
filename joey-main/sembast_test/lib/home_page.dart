import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sembast/timestamp.dart';
import 'package:sembast/sembast.dart';

import 'models/activity.dart';
import 'models/outcome.dart';
import 'local_repository.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  LocalRepository _localRepository = GetIt.I.get();
  //
  static String activityListName = 'activityList';
  StoreRef<int, Map<String, dynamic>> _activityList =
      intMapStoreFactory.store(activityListName);
  static String outcomeListName = 'outcomeList';
  StoreRef<int, Map<String, dynamic>> _outcomeList =
      intMapStoreFactory.store(outcomeListName);

  List<Activity> _activities = [];
  List<Outcome> _outcomes = [];

  @override
  void initState() {
    super.initState();
    _loadActivities();
    _loadOutcomes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Activity Log'),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 260,
            child: ListView.builder(
              itemCount: _activities.length,
              itemBuilder: (context, index) {
                final activity = _activities[index];
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.green,
                      border: Border.all(color: Colors.black)),
                  child: Column(
                    children: <Widget>[
                      Text(activity.name),
                      Text('startTime: ${activity.startTime.toDateTime()}'),
                      Text('endTime: ${activity.endTime.toDateTime()}'),
                      Text('sliderVal: ${activity.sliderVal}'),
                      Text('counterVal: ${activity.countVal}'),
                      Text('binaryVal: ${activity.binaryVal}'),
                      FlatButton(
                          color: Colors.red[300],
                          child: Text('Delete'),
                          onPressed: () => _deleteActivity(activity)),
                      FlatButton(
                          color: Colors.blue[300],
                          child: Text('Update'),
                          onPressed: () => _editActivity(activity)),
                    ],
                  ),
                );
              },
            ),
          ),
          Row(
            children: <Widget>[
              FlatButton(
                color: Colors.blue[100],
                child: Text('Add to Activity List'),
                onPressed: _addActivity,
              ),
              FlatButton(
                color: Colors.red[100],
                child: Text('Delete Activity List'),
                onPressed: _deleteAllActivities,
              ),
            ],
          ),
          Row(
            children: <Widget>[
              FlatButton(
                color: Colors.blue[100],
                child: Text('Add to Outcome List'),
                onPressed: _addOutcome,
              ),
              FlatButton(
                color: Colors.red[100],
                child: Text('Delete Outcome List'),
                onPressed: _deleteAllOutcomes,
              ),
            ],
          ),
          SizedBox(
            height: 220,
            child: ListView.builder(
              itemCount: _outcomes.length,
              itemBuilder: (context, index) {
                final outcome = _outcomes[index];
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      border: Border.all(color: Colors.black)),
                  child: Column(
                    children: <Widget>[
                      Text(outcome.name),
                      Text('startTime: ${outcome.recordedTime.toDateTime()}'),
                      Text('sliderVal: ${outcome.sliderVal}'),
                      FlatButton(
                          color: Colors.red[400],
                          child: Text('Delete'),
                          onPressed: () => _deleteOutcome(outcome)),
                      FlatButton(
                          color: Colors.blue[300],
                          child: Text('Update'),
                          onPressed: () => _editOutcome(outcome)),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  _loadActivities() async {
    final activities = await _localRepository.getAllActivities();
    setState(() => _activities = activities);
  }

  _loadOutcomes() async {
    final outcomes = await _localRepository.getAllOutcomes();
    setState(() => _outcomes = outcomes);
  }

  //
  //
  //

  _addActivity() async {
    //final list = ['sleep', 'meditation', 'eating']..shuffle();
    final name = 'Activity';
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
    await _localRepository.insertActivity(newActivity);
    _loadActivities();
  }

  _addOutcome() async {
    //final list = ['sleep', 'meditation', 'eating']..shuffle();
    final name = 'Outcome';
    final recordedTime = Timestamp.now();
    final sliderVal = Random().nextDouble() * 10;
    final newOutcome = Outcome(
      name: name,
      recordedTime: recordedTime,
      sliderVal: sliderVal,
    );
    await _localRepository.insertOutcome(newOutcome);
    _loadOutcomes();
  }

  //
  //
  //

  _deleteActivity(Activity activity) async {
    await _localRepository.deleteActivity(activity.id);
    _loadActivities();
  }

  _deleteOutcome(Outcome outcome) async {
    await _localRepository.deleteOutcome(outcome.id);
    _loadOutcomes();
  }

  //
  //
  //

  _editActivity(Activity activity) async {
    final updatedActivity = activity.copyWith(countVal: activity.countVal + 1);
    await _localRepository.updateActivity(updatedActivity);
    _loadActivities();
  }

  _editOutcome(Outcome outcome) async {
    final updatedOutcome = outcome.copyWith(sliderVal: outcome.sliderVal + 1);
    await _localRepository.updateOutcome(updatedOutcome);
    _loadOutcomes();
  }

  //
  //
  //

  _deleteAllActivities() async {
    await _localRepository.deleteAllActivities();
    _loadActivities();
  }

  _deleteAllOutcomes() async {
    await _localRepository.deleteAllOutcomes();
    _loadOutcomes();
  }
}
