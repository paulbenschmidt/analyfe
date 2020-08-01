import 'package:flutter/material.dart';

import '../models/activity.dart';

class Activities with ChangeNotifier {
  List<Activity> _activities = [];

  List<Activity> get options {
    return [..._activities];
  }
}
