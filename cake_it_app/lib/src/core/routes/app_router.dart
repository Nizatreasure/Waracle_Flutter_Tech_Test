import 'package:cake_it_app/src/features/cake_details_view.dart';
import 'package:cake_it_app/src/features/cake_list_view.dart';
import 'package:cake_it_app/src/settings/settings_view.dart';
import 'package:go_router/go_router.dart';

import '../../app.dart';
import 'route_names.dart';

class AppRouter {
  static GoRouter get router => GoRouter(
        navigatorKey: MyApp.navigatorKey,
        routes: [
          GoRoute(
            path: RouteNames.home,
            builder: (context, state) => const CakeListView(),
          ),
          GoRoute(
            path: RouteNames.details,
            builder: (context, state) => const CakeDetailsView(),
          ),
          GoRoute(
            path: RouteNames.settings,
            builder: (context, state) => const SettingsView(),
          ),
        ],
      );
}
