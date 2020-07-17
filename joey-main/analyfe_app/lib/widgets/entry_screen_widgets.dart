import 'package:flutter/material.dart';

import '../screens/test_activity_screen.dart';
import '../screens/settings_screen.dart';
import '../models/activities.dart';
import '../style/soft_ui.dart';

// Widget for App Bar that displays time and allows user to cycle through dates
AppBar entryAppBar(context) {
  return AppBar(
    backgroundColor: Theme.of(context).backgroundColor,
    elevation: 0,
    centerTitle: true,
    bottom: PreferredSize(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            child: FlatButton(
              onPressed: () {
                Navigator.of(context).pushNamed(TestActivityScreen.routeName);
              },
              child: Icon(Icons.chevron_left),
            ),
            decoration: SoftUi.boxDecoration(context),
            width: 60,
          ),
          Column(
            children: [
              Text(
                DateTime.now().toString().substring(0, 10),
                style: Theme.of(context).textTheme.headline1,
              ),
            ],
          ),
          Container(
            child: FlatButton(
              onPressed: () {
                Navigator.of(context).pushNamed(SettingsScreen.routeName);
              },
              child: Icon(Icons.chevron_right),
            ),
            decoration: SoftUi.boxDecoration(context),
            width: 60,
          ),
        ],
      ),
      preferredSize: null,
    ),
  );
}

// Widget builds the calendar portion of the entry screen
Column calendarHours(context) {
  final List<String> hoursInDay = [
    '12 AM',
    '1 AM',
    '2 AM',
    '3 AM',
    '4 AM',
    '5 AM',
    '6 AM',
    '7 AM',
    '8 AM',
    '9 AM',
    '10 AM',
    '11 AM',
    '12 PM',
    '1 PM',
    '2 PM',
    '3 PM',
    '4 PM',
    '5 PM',
    '6 PM',
    '7 PM',
    '8 PM',
    '9 PM',
    '10 PM',
    '11 PM',
    '12 AM',
  ];

  return new Column(
    children: hoursInDay
        .map(
          (hour) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 3, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  hour,
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                Expanded(
                  child: Divider(
                    indent: 10,
                    thickness: 1,
                    color: Theme.of(context).dividerColor,
                  ),
                ),
              ],
            ),
          ),
        )
        .toList(),
  );
}

Stack stackOfRecordedActivities(context, height) {
  final minutesInDay = 24 * 60;
  final pixelsPerMinute = height / minutesInDay;

  List<Entry> allEntries = [
    Entry(
      activityName: 'Read',
      startTime: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 9),
      endTime: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 11),
      quality: 1,
      color: Colors.green,
    ),
    Entry(
      activityName: 'Exercise',
      startTime: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 23),
      endTime: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 24),
      quality: 1,
      color: Colors.red,
    ),
    Entry(
      activityName: 'Meal',
      startTime: DateTime.now(),
      endTime: DateTime.now().add(Duration(hours: 2)),
      quality: 1,
      color: Colors.purple,
    ),
  ];

  var entryWidgets = List<Widget>();
  for (var entry in allEntries) {
    var durationInMinutes = entry.endTime.difference(entry.startTime).inMinutes;
    var durationInPixels = durationInMinutes * pixelsPerMinute;
    var startTimeInMinutes = entry.startTime.hour * 60 + entry.startTime.minute;

    entryWidgets.add(
      Container(
        height: height.toDouble(),
        child: Column(
          children: [
            SizedBox(
              height: startTimeInMinutes * pixelsPerMinute,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8),
              height: durationInPixels,
              width: 80,
              child: Center(
                child: Text(entry.activityName),
              ),
              decoration: SoftUi.boxEntryOutline(context, entry.color),
            ),
          ],
        ),
      ),
    );
  }
  return Stack(children: entryWidgets);
}

// Returns stack of mood entries
Stack stackOfMoods(context, height) {
  final minutesInDay = 24 * 60;
  final pixelsPerMinute = (height - 30) / minutesInDay;

  List<Mood> moods = [
    Mood(
      time: DateTime.now(),
      quality: 1,
    ),
    Mood(
      time: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 15),
      quality: -1,
    ),
  ];

  var moodWidgets = List<Widget>();
  for (var mood in moods) {
    var startTimeInMinutes = mood.time.hour * 60 + mood.time.minute;

    moodWidgets.add(
      Container(
        height: height.toDouble(),
        child: Column(
          children: [
            SizedBox(
              height: startTimeInMinutes * pixelsPerMinute,
            ),
            CircleAvatar(
              radius: 15,
              backgroundColor: Colors.indigo,
              child: Center(
                child: Text(
                  mood.quality.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  return Stack(children: moodWidgets);
}

Column activityOptions(context, height) {
  List<Activity> activities = [
    Activity(
      activityName: 'Run',
      color: Colors.purple,
    ),
    Activity(
      activityName: 'Meal',
      color: Colors.red,
    ),
  ];

  var activityWidgets = List<Widget>();
  activityWidgets.add(
    Padding(
      padding: EdgeInsets.symmetric(vertical: 1),
      child: FlatButton(
        onPressed: () {},
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8),
          width: 100,
          child: Center(
            child: Text('Mood'),
          ),
          decoration: SoftUi.boxEntryOutline(context, Colors.blueGrey),
        ),
      ),
    ),
  );

  for (var activity in activities) {
    activityWidgets.add(
      Padding(
        padding: EdgeInsets.symmetric(vertical: 1),
        child: FlatButton(
          onPressed: () {},
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8),
            width: 100,
            child: Center(
              child: Text(activity.activityName),
            ),
            decoration: SoftUi.boxEntryOutline(context, activity.color),
          ),
        ),
      ),
    );
  }
  return Column(children: activityWidgets);
}
