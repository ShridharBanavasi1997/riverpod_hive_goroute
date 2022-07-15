import 'package:get_it/get_it.dart';

import 'data/database/app_database.dart';

class AppDependency{
  AppDependency._();
  static AppDependency instance = AppDependency._();

  final GetIt getItInstance = GetIt.instance;

  Future<void> initialize() async{
    try{
    AppDatabase appDatabase = AppDatabase();

    await appDatabase.initialize();

    getItInstance.registerSingleton(appDatabase);
    }catch(e){
      print("Failed to initialize");
    }
  }
}