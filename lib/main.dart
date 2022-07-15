import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/modules/editicon/edit_icon.dart';

import 'app_dependency.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final appDependency = AppDependency.instance;
  await appDependency.initialize();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RiverPod Sample App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: EditIcon(),
    );
  }
}
