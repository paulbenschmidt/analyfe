import 'package:flutter/foundation.dart';

import '../models/entry.dart';

class GreatPlaces with ChangeNotifier {
  static List<Entry> DUMMY_ENTRY = [
    Entry(name: 'Wake', recordType: RecordType.StartTime),
    Entry(name: 'Mood', recordType: RecordType.Slider),
    Entry(name: 'Sleep Quality', recordType: RecordType.Binary),
    Entry(name: 'Exercise', recordType: RecordType.StartAndEndTime),
    Entry(name: 'Number of Meals', recordType: RecordType.Counter),
    Entry(name: 'Nutrition', recordType: RecordType.Counter),
    Entry(name: 'Sleep', recordType: RecordType.EndTime),
  ];

  List<Entry> _items = DUMMY_ENTRY;
}
