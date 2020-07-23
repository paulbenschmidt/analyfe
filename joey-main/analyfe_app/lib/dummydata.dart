import 'package:sembast/timestamp.dart';

import './models/outcome.dart';

//
List<Outcome> outcomeList = [
  Outcome(
      name: 'mood',
      recordedTime: Timestamp.fromDateTime(
        DateTime.now().add(new Duration(days: -2)),
      ),
      value: 5.6),
  Outcome(
      name: 'mood',
      recordedTime: Timestamp.fromDateTime(
          DateTime.now().add(new Duration(days: -2, hours: 1))),
      value: 8.3),
  //
  //Two days previous
  //
  Outcome(
      name: 'mood',
      recordedTime: Timestamp.fromDateTime(
        DateTime.now().add(new Duration(days: -1)),
      ),
      value: 5.6),
  Outcome(
      name: 'mood',
      recordedTime: Timestamp.fromDateTime(
          DateTime.now().add(new Duration(days: -1, hours: 1))),
      value: 8.3),
  Outcome(
      name: 'mood',
      recordedTime: Timestamp.fromDateTime(
          DateTime.now().add(new Duration(days: -1, hours: 2))),
      value: 2.7),
  Outcome(
      name: 'mood',
      recordedTime: Timestamp.fromDateTime(
          DateTime.now().add(new Duration(days: -1, hours: 3))),
      value: 4.4),
  Outcome(
      name: 'mood',
      recordedTime: Timestamp.fromDateTime(
          DateTime.now().add(new Duration(days: -1, hours: 4))),
      value: 5.4),
  Outcome(
      name: 'mood',
      recordedTime: Timestamp.fromDateTime(
          DateTime.now().add(new Duration(days: -1, hours: 5, minutes: 26))),
      value: 7.2),
  //
  //yesterday
  //
  Outcome(
      name: 'mood',
      recordedTime:
          Timestamp.fromDateTime(DateTime.now().add(new Duration(minutes: 10))),
      value: 5.6),
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
  //
  //next day
  //
  Outcome(
      name: 'mood',
      recordedTime: Timestamp.fromDateTime(
        DateTime.now().add(new Duration(days: 1)),
      ),
      value: 3.6),
  Outcome(
      name: 'mood',
      recordedTime: Timestamp.fromDateTime(
          DateTime.now().add(new Duration(days: 1, hours: 1))),
      value: 5.3),
  Outcome(
      name: 'mood',
      recordedTime: Timestamp.fromDateTime(
          DateTime.now().add(new Duration(days: 1, hours: 2))),
      value: 5.7),
  Outcome(
      name: 'mood',
      recordedTime: Timestamp.fromDateTime(
          DateTime.now().add(new Duration(days: 1, hours: 3))),
      value: 4.7),
  Outcome(
      name: 'mood',
      recordedTime: Timestamp.fromDateTime(
          DateTime.now().add(new Duration(days: 1, hours: 4))),
      value: 8.4),
  Outcome(
      name: 'mood',
      recordedTime: Timestamp.fromDateTime(
          DateTime.now().add(new Duration(days: 1, hours: 5, minutes: 26))),
      value: 6.2),
];

// List<Event> activityList = [
//   Event(
//     activityName: 'Exercise',
//     id: DateTime.now().add(new Duration(hours: 3)),
//     startTime: DateTime.now(),
//     endTime: DateTime.now().add(new Duration(hours: 3)),
//   ),
//   Event(
//     activityName: 'Exercise',
//     id: DateTime.now().add(new Duration(hours: 6)),
//     startTime: DateTime.now().add(new Duration(hours: 5)),
//     endTime: DateTime.now().add(new Duration(hours: 6)),
//   ),
//   Event(
//     activityName: 'Exercise',
//     id: DateTime.now().add(new Duration(hours: 9)),
//     startTime: DateTime.now().add(new Duration(hours: 8)),
//     endTime: DateTime.now().add(new Duration(hours: 9)),
//   ),
//   Event(
//     activityName: 'Exercise',
//     id: DateTime.now().add(new Duration(hours: 6)),
//     startTime: DateTime.now().add(new Duration(hours: 5)),
//     endTime: DateTime.now().add(new Duration(hours: 6)),
//   ),
// ];
