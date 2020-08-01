import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:sembast_test/local_repository.dart';

import 'sembast_local_repository.dart';

class Init {
  static Future initialize() async {
    //initialize Sembast database
    final appDir = await getApplicationDocumentsDirectory();
    await appDir.create(recursive: true);
    final databasePath = join(appDir.path, "sembast.db");
    final database = await databaseFactoryIo.openDatabase(databasePath);
    GetIt.I.registerSingleton<Database>(database);

    //register Repository
    GetIt.I
        .registerLazySingleton<LocalRepository>(() => SembastLocalRepository());
    // GetIt.I.registerLazySingleton<ActivityRepository>(
    //     () => SembastActivityRepository(activityName: 'Exercise'));
  }
}
