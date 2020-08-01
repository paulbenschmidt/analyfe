import 'package:sembast_test/models/outcome.dart';

import 'models/activity.dart';

abstract class LocalRepository {
  Future<int> insertActivity(Activity activity);
  Future<int> insertOutcome(Outcome outcome);

  Future updateActivity(Activity activity);
  Future updateOutcome(Outcome outcome);

  Future deleteActivity(int activityId);
  Future deleteOutcome(int outcomeId);

  Future<List<Activity>> getAllActivities();
  Future<List<Outcome>> getAllOutcomes();

  Future deleteAllActivities();
  Future deleteAllOutcomes();
}
