import 'package:path_provider/path_provider.dart';

import 'package:hive/hive.dart';
import 'package:riverpod_sample/data/model/state_model.dart';

import 'daos/state_data_daos.dart';
import 'models/state_data.dart';

class AppDatabase {
  AppDatabase();
  late SateDataDao stateDataDao;
  Future<void> initialize() async{
      Hive.init((await getApplicationSupportDirectory()).path);

      Hive.registerAdapter(StateDataAdapter());

      stateDataDao = SateDataDao(await Hive.openBox<StateData>(StateData.hiveBoxName));
  }





}