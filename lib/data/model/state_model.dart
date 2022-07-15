import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

import '../../app_dependency.dart';
import '../database/app_database.dart';
import '../database/models/state_data.dart';
//
// class StateModel {
//   IconData icon;
//   Color color;
//   double size;
//
//   StateModel({required this.icon,required this.color,required this.size});
// }

class StateModelNotifier extends StateNotifier<StateData> {
  StateModelNotifier({required StateData initState}) : super(initState);

  void changeColor(Color color){
    state= StateData(icon:state.icon,color: color.value, size: state.size);
    AppDependency.instance.getItInstance.get<AppDatabase>().stateDataDao.addState(state);
  }

  void setSize(double size){
    state= StateData(icon:state.icon,color: state.color, size: size);
    AppDependency.instance.getItInstance.get<AppDatabase>().stateDataDao.addState(state);
  }

  void setIcon(IconData icon){
    state= StateData(icon:icon.codePoint,color: state.color, size: state.size);
    AppDependency.instance.getItInstance.get<AppDatabase>().stateDataDao.addState(state);
  }
}