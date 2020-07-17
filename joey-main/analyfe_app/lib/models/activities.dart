import 'package:flutter/material.dart';

class Activity {
  final String activityName;
  final Color color;
  final bool isRecordingQuality;
  final bool isRecordingCount;

  Activity({
    @required this.activityName,
    this.color,
    this.isRecordingCount,
    this.isRecordingQuality,
  });
}

class Entry {
  final String activityName;
  final DateTime startTime;
  final DateTime endTime;
  final int quality;
  final Color color;

  Entry({
    @required this.activityName,
    @required this.startTime,
    @required this.endTime,
    this.quality,
    this.color,
  });
}

class Mood {
  final time;
  final quality;

  Mood({
    @required this.time,
    @required this.quality,
  });
}
