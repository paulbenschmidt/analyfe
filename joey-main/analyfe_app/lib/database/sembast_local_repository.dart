import 'package:get_it/get_it.dart';
import 'package:sembast/sembast.dart';

import '../models/activity.dart';
import '../models/outcome.dart';
import './local_repository.dart';

class SembastLocalRepository extends LocalRepository {
  final Database _database = GetIt.I.get();
  final StoreRef<int, Map<String, dynamic>> _activityList =
      intMapStoreFactory.store('activityList');
  final StoreRef<int, Map<String, dynamic>> _outcomeList =
      intMapStoreFactory.store('outcomeList');

  SembastLocalRepository();

  //Constructor to insert
  @override
  Future<int> insertActivity(Activity activity) async {
    return await _activityList.add(_database, activity.toMap());
  }

  @override
  Future<int> insertOutcome(Outcome outcome) async {
    return await _outcomeList.add(_database, outcome.toMap());
  }

  //Constructors to update/modify a current entry in a store
  @override
  Future updateActivity(Activity activity) async {
    await _activityList.record(activity.id).update(_database, activity.toMap());
  }

  @override
  Future updateOutcome(Outcome outcome) async {
    await _outcomeList.record(outcome.id).update(_database, outcome.toMap());
  }

  //Constructor to delete an entry in a store
  @override
  Future deleteActivity(int activityId) async {
    await _activityList.record(activityId).delete(_database);
  }

  @override
  Future deleteOutcome(int outcomeId) async {
    await _outcomeList.record(outcomeId).delete(_database);
  }

  //Constructor to get all entries from a store
  @override
  Future<List<Activity>> getAllActivities() async {
    final snapshots = await _activityList.find(_database);
    return snapshots
        .map((snapshot) => Activity.fromMap(snapshot.key, snapshot.value))
        .toList(growable: false);
  }

  @override
  Future<List<Outcome>> getAllOutcomes() async {
    final snapshots = await _outcomeList.find(_database);
    return snapshots
        .map((snapshot) => Outcome.fromMap(snapshot.key, snapshot.value))
        .toList(growable: false);
  }

  //Constructor to delete contents of an entire store
  Future clearAllActivities() async {
    await _activityList.delete(_database);
  }

  Future clearAllOutcomes() async {
    await _outcomeList.delete(_database);
  }
}
