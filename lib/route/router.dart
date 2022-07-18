import 'package:go_router/go_router.dart';
import 'package:riverpod_sample/modules/selecticon/select_icon.dart';
import 'package:riverpod_sample/route/app_route_names.dart';

import '../modules/editicon/edit_icon.dart';

class AppRouter {
  final goRouter = GoRouter(
    routes: [
      GoRoute(
          name: AppRouth.editIcon.routeName,
          path: AppRouth.editIcon.routePath,
          builder: (_, GoRouterState state) {
            return EditIcon();
          }),
      GoRoute(
          name: AppRouth.selectIcon.routeName,
          path: AppRouth.selectIcon.routePath,
          builder: (_, GoRouterState state) {
            return SelectIcons();
          })
    ],
  );
}
