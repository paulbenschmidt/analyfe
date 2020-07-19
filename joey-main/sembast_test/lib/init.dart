import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:sembast_test/activity_repository.dart';

import './sembast_activity_repository.dart';

class Init {
  static Future initialize() async {
    await _initSembast();
    _registerRepositories();
  }

  static _registerRepositories() {
    GetIt.I.registerLazySingleton<ActivityRepository>(
        () => SembastActivityRepository(activityName: 'Sleep'));
  }

  static Future _initSembast() async {
    final appDir = await getApplicationDocumentsDirectory();
    await appDir.create(recursive: true);
    final databasePath = join(appDir.path, "sembast.db");
    final database = await databaseFactoryIo.openDatabase(databasePath);
    GetIt.I.registerSingleton<Database>(database);
  }
}
