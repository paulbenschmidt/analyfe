import 'activity.dart';

abstract class ActivityRepository {
  Future<int> insertActivity(Activity activity);

  Future updateActivity(Activity activity);

  Future deleteActivity(int activityId);

  Future<List<Activity>> getAllActivities();
}
