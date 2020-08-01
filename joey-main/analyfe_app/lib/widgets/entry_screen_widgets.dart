import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';

import '../screens/test_screen.dart';
import '../screens/settings_screen.dart';
import '../models/activity.dart';
import '../providers/activities.dart';
import '../providers/outcomes.dart';
import '../providers/activity_records.dart';
import '../providers/outcome_records.dart';
import '../widgets/add_record_widget.dart';
import '../style/soft_ui.dart';

AppBar entryAppBar(context, date) {
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
                Navigator.of(context).pushNamed(TestScreen.routeName);
              },
              child: Icon(Icons.more_horiz),
            ),
            decoration: SoftUi.boxDecoration(context),
            width: 60,
          ),
          Container(
            child: FlatButton(
              onPressed: () {},
              child: Text(
                date,
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            decoration: SoftUi.boxDecoration(context),
          ),
          Container(
            child: FlatButton(
              onPressed: () {
                Navigator.of(context).pushNamed(SettingsScreen.routeName);
              },
              child: Icon(Icons.settings),
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

Stack recordedActivities(context, height, date) {
  final minutesInDay = 24 * 60;
  final pixelsPerMinute = height / minutesInDay;

  final recordedActivitiesData =
      Provider.of<ActivityRecords>(context, listen: true);
  final recordedActivities = recordedActivitiesData.records;

  var entryWidgets = List<Widget>();
  for (var entry in recordedActivities) {
    var end = entry.endTime.toDateTime();
    var start = entry.startTime.toDateTime();
    var durationInMinutes = end.difference(start).inMinutes;
    var durationInPixels = durationInMinutes * pixelsPerMinute;
    var startTimeInMinutes = start.hour * 60 + start.minute;

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
                child: Text(entry.name),
              ),
              decoration: SoftUi.boxEntryOutline(context, Colors.green),
            ),
          ],
        ),
      ),
    );
  }
  return Stack(children: entryWidgets);
}

class Mood {
  final DateTime time;
  final int quality;

  Mood({
    @required this.time,
    @required this.quality,
  });
}

// Returns stack of mood entries
Stack recordedOutcomes(context, height, date) {
  final minutesInDay = 24 * 60;
  final pixelsPerMinute = (height - 30) / minutesInDay;

  final recordedOutcomesData =
      Provider.of<OutcomeRecords>(context, listen: true);
  final recordedOutcomes = recordedOutcomesData.records;

  var outcomeWidgets = List<Widget>();
  for (var outcome in recordedOutcomes) {
    var time = outcome.recordedTime.toDateTime();
    var startTimeInMinutes = time.hour * 60 + time.minute;

    outcomeWidgets.add(
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
                  outcome.sliderVal.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  return Stack(children: outcomeWidgets);
}

Column eventOptions(context, date) {
  final activitiesData = Provider.of<Activities>(context, listen: true);
  final activities = activitiesData.options;

  final outcomesData = Provider.of<Outcomes>(context, listen: true);
  final outcomes = outcomesData.options;

  var eventWidgets = List<Widget>();

  for (var outcome in outcomes) {
    eventWidgets.add(
      Padding(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 3),
        child: Container(
          height: 35,
          child: ButtonTheme(
            padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            minWidth: 0,
            height: 0,
            child: FlatButton(
              onPressed: () => addRecord(context, date, 'Outcome', outcome),
              child: Center(
                child: Text(
                  outcome.name,
                  style: Theme.of(context).textTheme.subtitle1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
          decoration: SoftUi.boxEntryOutline(context, Colors.green),
        ),
      ),
    );
  }

  eventWidgets.add(
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 3),
      child: Divider(
        thickness: 2,
      ),
    ),
  );

  for (var activity in activities) {
    eventWidgets.add(
      Padding(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 3),
        child: Container(
          height: 35,
          child: ButtonTheme(
            padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            minWidth: 0,
            height: 0,
            child: FlatButton(
              onPressed: () {
                addRecord(context, date, 'Activity', activity);
              },
              child: Center(
                child: Text(
                  activity.name,
                  style: Theme.of(context).textTheme.subtitle1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
          decoration: SoftUi.boxEntryOutline(context, Colors.green),
        ),
      ),
    );
  }
  return Column(children: eventWidgets);
}
