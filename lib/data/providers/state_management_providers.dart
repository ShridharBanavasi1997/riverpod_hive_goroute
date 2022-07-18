import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app_dependency.dart';
import '../database/app_database.dart';
import '../database/models/state_data.dart';
import '../model/state_model.dart';
import 'state_management_providers_interface.dart';

class StateManagementProviders implements StateManagementProvidersInterface{
  final stateProvider = StateNotifierProvider<StateModelNotifier,StateData>((ref){
    return StateModelNotifier(initState:AppDependency.instance.getItInstance.get<AppDatabase>().stateDataDao.getState()??StateData(icon:Icons.email.codePoint,color: Colors.blue.value,size: 5));
  });
}