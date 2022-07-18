import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/route/router.dart';

import 'app_dependency.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDependency = AppDependency.instance;
  await appDependency.initialize();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AppRouter appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
        child: MaterialApp.router(
      title: 'RiverPod Sample App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routeInformationParser: appRouter.goRouter.routeInformationParser,
      routerDelegate: appRouter.goRouter.routerDelegate,
    ));
  }
}
