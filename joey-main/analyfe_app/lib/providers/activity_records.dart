import 'package:flutter/material.dart';

import '../models/activity.dart';

class ActivityRecords with ChangeNotifier {
  List<Activity> _activityRecords = [];

  List<Activity> get records {
    return [..._activityRecords];
  }

  void addActivityEntry(newActivityEntry) {
    _activityRecords.add(newActivityEntry);
    notifyListeners();
  }
}
