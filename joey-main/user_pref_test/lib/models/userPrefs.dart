import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class UserPrefs {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  dynamic getAllKeys() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getKeys();
  }

  //---------------------------------------------------
  void setInitialTheme() async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString('Theme', 'default');
  }

  void updateTheme(String theme) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString('Theme', theme);
  }

  //---------------------------------------------------
  dynamic retrieveActivity(String activityName) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString(activityName);
  }

  dynamic retrieveOutcome(String outcomeName) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString(outcomeName);
  }

  //---------------------------------------------------
  void addActivity(String activityName, String color) async {
    final SharedPreferences prefs = await _prefs;
    color = 'green';
    prefs.setString('Activity: $activityName', color);
  }

  void addOutcome(String outcomeName, String color) async {
    final SharedPreferences prefs = await _prefs;
    color = 'blue';
    prefs.setString('Outcome: $outcomeName', color);
  }

  //---------------------------------------------------
  void removeOutcome(String outcomeName) async {
    final SharedPreferences prefs = await _prefs;
    prefs.remove('Outcome: $outcomeName');
  }

  void removeActivity(String activityName) async {
    final SharedPreferences prefs = await _prefs;
    prefs.remove('Activity: $activityName');
  }
}
