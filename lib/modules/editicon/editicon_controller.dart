import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/app_dependency.dart';

import '../../data/database/app_database.dart';
import '../../data/database/models/state_data.dart';
import '../../data/model/state_model.dart';
import '../../data/providers/state_management_providers.dart';

class EditIconController{

  final stateProvider = AppDependency.instance.getItInstance.get<StateManagementProviders>().stateProvider;
  // final stateProvider = StateNotifierProvider<StateModelNotifier,StateData>((ref){
  //   return StateModelNotifier(initState:AppDependency.instance.getItInstance.get<AppDatabase>().stateDataDao.getState()??StateData(icon:Icons.email.codePoint,color: Colors.blue.value,size: 5));
  // });
}