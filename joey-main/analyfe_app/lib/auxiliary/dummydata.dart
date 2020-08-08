import 'package:sembast/timestamp.dart';

import '../models/activity.dart';
import '../models/outcome.dart';

//
List<Outcome> outcomeList = [
  Outcome(
      name: 'mood',
      recordedTime: Timestamp.fromDateTime(
        DateTime(2020, 7, 18, 5, 23),
      ),
      sliderVal: 8.5),
  Outcome(
      name: 'mood',
      recordedTime: Timestamp.fromDateTime(
        DateTime(2020, 7, 19, 1, 33),
      ),
      sliderVal: 7.6),
  Outcome(
      name: 'mood',
      recordedTime: Timestamp.fromDateTime(
        DateTime(2020, 7, 20, 17, 53),
      ),
      sliderVal: 3.5),
  Outcome(
      name: 'mood',
      recordedTime: Timestamp.fromDateTime(
        DateTime(2020, 7, 20, 6, 23),
      ),
      sliderVal: 7.3),
  Outcome(
      name: 'mood',
      recordedTime: Timestamp.fromDateTime(
        DateTime(2020, 7, 21, 12, 23),
      ),
      sliderVal: 5.6),

  //
  //
  //
  Outcome(
      name: 'mood',
      recordedTime: Timestamp.fromDateTime(
        DateTime(2020, 7, 23, 7, 23),
      ),
      sliderVal: 5.6),
  Outcome(
      name: 'mood',
      recordedTime: Timestamp.fromDateTime(
        DateTime(2020, 7, 23, 9, 43),
      ),
      sliderVal: 8.3),
  //
  //Two days previous
  //
  Outcome(
      name: 'mood',
      recordedTime: Timestamp.fromDateTime(
        DateTime(2020, 7, 24, 7, 43),
      ),
      sliderVal: 5.6),
  Outcome(
      name: 'mood',
      recordedTime: Timestamp.fromDateTime(
        DateTime(2020, 7, 24, 9, 43),
      ),
      sliderVal: 8.3),
  Outcome(
      name: 'mood',
      recordedTime: Timestamp.fromDateTime(
        DateTime(2020, 7, 24, 14, 33),
      ),
      sliderVal: 2.7),
  Outcome(
      name: 'mood',
      recordedTime: Timestamp.fromDateTime(
        DateTime(2020, 7, 24, 15, 1),
      ),
      sliderVal: 4.4),
  Outcome(
      name: 'mood',
      recordedTime: Timestamp.fromDateTime(
        DateTime(2020, 7, 24, 18, 33),
      ),
      sliderVal: 5.4),
  Outcome(
      name: 'mood',
      recordedTime: Timestamp.fromDateTime(
        DateTime(2020, 7, 24, 22, 13),
      ),
      sliderVal: 7.2),
  //
  //yesterday
  //
  Outcome(
      name: 'mood',
      recordedTime: Timestamp.fromDateTime(
        DateTime(2020, 7, 25, 7, 33),
      ),
      sliderVal: 5.6),
  Outcome(
      name: 'mood',
      recordedTime: Timestamp.fromDateTime(
        DateTime(2020, 7, 25, 9, 43),
      ),
      sliderVal: 6.7),
  Outcome(
      name: 'mood',
      recordedTime: Timestamp.fromDateTime(
        DateTime(2020, 7, 25, 11, 13),
      ),
      sliderVal: 5.5),
  Outcome(
      name: 'mood',
      recordedTime: Timestamp.fromDateTime(
        DateTime(2020, 7, 25, 13, 31),
      ),
      sliderVal: 6.2),
  Outcome(
      name: 'mood',
      recordedTime: Timestamp.fromDateTime(
        DateTime(2020, 7, 25, 14, 16),
      ),
      sliderVal: 7.7),
  Outcome(
      name: 'mood',
      recordedTime: Timestamp.fromDateTime(
        DateTime(2020, 7, 25, 11, 52),
      ),
      sliderVal: 6.4),
  //
];

List<Activity> activityList = [
  Activity(
    name: 'Exercise',
    id: 1,
    startTime: Timestamp.fromDateTime(DateTime.now()),
    endTime: Timestamp.fromDateTime(DateTime.now().add(new Duration(hours: 3))),
  ),
  Activity(
    name: 'Exercise',
    id: 2,
    startTime:
        Timestamp.fromDateTime(DateTime.now().add(new Duration(hours: 5))),
    endTime: Timestamp.fromDateTime(DateTime.now().add(new Duration(hours: 6))),
  ),
  Activity(
    name: 'Exercise',
    id: 3,
    startTime:
        Timestamp.fromDateTime(DateTime.now().add(new Duration(hours: 8))),
    endTime: Timestamp.fromDateTime(DateTime.now().add(new Duration(hours: 9))),
  ),
  Activity(
    name: 'Exercise',
    id: 4,
    startTime:
        Timestamp.fromDateTime(DateTime.now().add(new Duration(hours: 5))),
    endTime: Timestamp.fromDateTime(DateTime.now().add(new Duration(hours: 6))),
  ),
  //
  //
  //
  Activity(
    name: 'Meditation',
    id: 5,
    startTime: Timestamp.fromDateTime(DateTime.now()),
    endTime: Timestamp.fromDateTime(DateTime.now().add(new Duration(hours: 2))),
  ),
  Activity(
    name: 'Meditation',
    id: 6,
    startTime:
        Timestamp.fromDateTime(DateTime.now().add(new Duration(hours: 5))),
    endTime: Timestamp.fromDateTime(DateTime.now().add(new Duration(hours: 6))),
  ),
  Activity(
    name: 'Meditation',
    id: 7,
    startTime:
        Timestamp.fromDateTime(DateTime.now().add(new Duration(hours: 8))),
    endTime: Timestamp.fromDateTime(DateTime.now().add(new Duration(hours: 9))),
  ),
  Activity(
    name: 'Meditation',
    id: 8,
    startTime:
        Timestamp.fromDateTime(DateTime.now().add(new Duration(hours: 6))),
    endTime: Timestamp.fromDateTime(DateTime.now().add(new Duration(hours: 7))),
  ),
];
