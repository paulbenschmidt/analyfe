import 'package:get_it/get_it.dart';
import 'package:sembast/sembast.dart';

import './activity.dart';
import './activity_repository.dart';

class SembastActivityRepository extends ActivityRepository {
  final String activityName;
  final StoreRef<int, Map<String, dynamic>> _store;

  SembastActivityRepository({this.activityName})
      : _store = intMapStoreFactory.store(activityName);

  final Database _database = GetIt.I.get();

  @override
  Future<int> insertActivity(Activity activity) async {
    return await _store.add(_database, activity.toMap());
  }

  @override
  Future updateActivity(Activity activity) async {
    await _store.record(activity.id).update(_database, activity.toMap());
  }

  @override
  Future deleteActivity(int activityId) async {
    await _store.record(activityId).delete(_database);
  }

  @override
  Future<List<Activity>> getAllActivities() async {
    final snapshots = await _store.find(_database);
    return snapshots
        .map((snapshot) => Activity.fromMap(snapshot.key, snapshot.value))
        .toList(growable: false);
  }
}
