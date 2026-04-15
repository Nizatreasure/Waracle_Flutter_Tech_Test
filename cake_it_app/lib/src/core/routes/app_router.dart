import 'package:cake_it_app/src/features/cakes/presentation/views/cake_details_view.dart';
import 'package:cake_it_app/src/features/cakes/presentation/views/cake_list_view.dart';
import 'package:cake_it_app/src/features/settings/presentation/views/settings_view.dart';
import 'package:go_router/go_router.dart';

import '../../app.dart';
import '../../features/cakes/data/models/cake_model.dart';
import 'route_names.dart';

/// A class that defines the routes for the application using GoRouter.

class AppRouter {
  static GoRouter router = GoRouter(
    navigatorKey: MyApp.navigatorKey,
    routes: [
      GoRoute(
        path: RouteNames.home,
        name: RouteNames.home,
        builder: (context, state) => const CakeListView(),
      ),
      GoRoute(
        path: RouteNames.details,
        name: RouteNames.details,
        builder: (context, state) {
          final cake = state.extra as CakeModel;
          return CakeDetailsView(cake: cake);
        },
      ),
      GoRoute(
        path: RouteNames.settings,
        name: RouteNames.settings,
        builder: (context, state) => const SettingsView(),
      ),
    ],
  );
}
