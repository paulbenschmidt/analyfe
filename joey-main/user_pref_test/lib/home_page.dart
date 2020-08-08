import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './models/userPrefs.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final UserPrefs userPrefs = UserPrefs();
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  List<String> _activities = [];
  List<String> _outcomes = [];

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
        title: Text('SharedPref Demo'),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 200,
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
                      FlatButton(
                        color: Colors.red[300],
                        child: Text('Delete'),
                        onPressed: () {},
                      ),
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
            ],
          ),
          Row(
            children: <Widget>[
              FlatButton(
                color: Colors.blue[100],
                child: Text('Add to Outcome List'),
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(
            height: 200,
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
                      FlatButton(
                        color: Colors.red[400],
                        child: Text('Delete'),
                        onPressed: () => {},
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 50,
            child: Column(
              children: <Widget>[
                Text('Oo'),
                Text('Hola'),
              ],
            ),
          )
        ],
      ),
    );
  }

  _loadActivities() async {
    final Set<String> keys = await userPrefs.getAllKeys();
    final name = keys.elementAt(2);
    print(name);
    print(await userPrefs.retrieveActivity(name));
  }

  _loadOutcomes() async {
    final keys = await userPrefs.getAllKeys();
    print(keys);
    //print();
  }

  _addActivity() async {
    final activityName = 'med';
    final color = 'blue';
    userPrefs.addActivity(activityName, color);
    _activities.add(activityName);
    _loadActivities();
  }

  _addOutcome() {
    final outcomeName = 'mood';
    final color = 'blue';
    userPrefs.addActivity(outcomeName, color);
    _outcomes.add(outcomeName);
    _loadOutcomes();
  }

  _deleteActivity(activityName) {
    userPrefs.removeActivity(activityName);
    _activities.remove(activityName);
    _loadActivities();
  }

  _deleteOutcome(outcomeName) {
    userPrefs.removeOutcome(outcomeName);
    _outcomes.remove(outcomeName);
    _loadOutcomes();
  }
}

// Future<int> _counter;

//   //
//   //
//   //
//   Future<void> _incrementCounter() async {
//     final SharedPreferences prefs = await _prefs;
//     final int counter = (prefs.getInt('counter') ?? 0) + 1;

//     setState(() {
//       _counter = prefs.setInt("counter", counter).then((bool success) {
//         return counter;
//       });
//     });
//   }
//   //
//   //
//   //

//   @override
//   void initState() {
//     super.initState();
//     _counter = _prefs.then((SharedPreferences prefs) {
//       return (prefs.getInt('counter') ?? 0);
//     });
//   }
//   //
//   //
//   //

// _getUserPrefs() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   //counter = prefs.getInt('counter') ?? 0;
// }
