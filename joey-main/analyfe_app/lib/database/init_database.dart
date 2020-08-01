import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

import './local_repository.dart';
import './sembast_local_repository.dart';

//This file initializes/creates the database necessary to store the data locally

class Init {
  static Future initialize() async {
    //initialize Sembast database
    final appDir =
        await getApplicationDocumentsDirectory(); //find the file path to save files
    await appDir.create(recursive: true);
    final databasePath =
        join(appDir.path, "sembast.db"); //merges database name to filepath
    final database = await databaseFactoryIo.openDatabase(databasePath);
    GetIt.I.registerSingleton<Database>(
        database); //registers the database to be accessed later

    //register Repository
    GetIt.I
        .registerLazySingleton<LocalRepository>(() => SembastLocalRepository());
  }
}
