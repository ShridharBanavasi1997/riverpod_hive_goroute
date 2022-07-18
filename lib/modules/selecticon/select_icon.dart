import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_sample/modules/selecticon/selecticon_controller.dart';

import '../../route/app_route_names.dart';

class SelectIcons extends ConsumerWidget {
  final selectIconController = SelectIconController();
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text("Select Icon")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                IconButton(onPressed: () {
                  ref.read(selectIconController.stateProvider.notifier).setIcon(Icons.account_box);
                  context.go(AppRouth.editIcon.routePath);
                }, icon: Icon(Icons.account_box)),
                IconButton(onPressed: () {
                  ref.read(selectIconController.stateProvider.notifier).setIcon(Icons.home);
                  context.go(AppRouth.editIcon.routePath);
                }, icon: Icon(Icons.home)),
                IconButton(onPressed: () {
                  ref.read(selectIconController.stateProvider.notifier).setIcon(Icons.email);
                  context.go(AppRouth.editIcon.routePath);
                }, icon: Icon(Icons.email)),
                IconButton(onPressed: () {
                  ref.read(selectIconController.stateProvider.notifier).setIcon(Icons.delete);
                  context.go(AppRouth.editIcon.routePath);
                }, icon: Icon(Icons.delete))
              ],
            )
          ],
        ),
      ),
    );
  }
}
