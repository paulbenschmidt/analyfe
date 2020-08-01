import '../models/userPref.dart';
import '../models/outcome.dart';
import '../models/activity.dart';

//allows the constructors for database operations to be called in any file (I guess?)
abstract class LocalRepository {
  Future<int> insertActivity(Activity activity);
  Future<int> insertOutcome(Outcome outcome);
  Future<int> insertUserPref(UserPreferences userPreferences);

  Future updateActivity(Activity activity);
  Future updateOutcome(Outcome outcome);
  Future updateUserPref(UserPreferences userPreferences);

  Future deleteActivity(int activityId);
  Future deleteOutcome(int outcomeId);

  Future<List<Activity>> getAllActivities();
  Future<List<Outcome>> getAllOutcomes();
  Future<List<UserPreferences>> getAllUserPref();

  Future clearAllActivities();
  Future clearAllOutcomes();
  Future clearAllUserPref();
}
