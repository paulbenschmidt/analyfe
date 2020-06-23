import 'package:flutter/foundation.dart';

enum RecordType {
  Counter,
  Slider,
  Binary,
  StartTime,
  EndTime,
  StartAndEndTime,
}

enum Affordability { Counter, Slider, StartTime, EndTime, StartAndEndTime }

class Entry {
  final String name;
  final RecordType recordType;

  const Entry({
    @required this.name,
    @required this.recordType,
  });
}