import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app_dependency.dart';
import '../../data/providers/state_management_providers.dart';

class SelectIconController{

  final stateProvider = AppDependency.instance.getItInstance.get<StateManagementProviders>().stateProvider;
}