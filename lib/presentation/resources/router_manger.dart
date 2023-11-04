import 'package:go_router/go_router.dart';
import 'package:mars_app/view/home_view.dart';
import 'package:mars_app/view/settings_view.dart';

class Routes {
  static const String homeRoute = '/';
  static const String settingsRoute = '/setting';
}

GoRouter router() {
  return GoRouter(
    routes: [
      GoRoute(
        path: Routes.homeRoute,
        builder: (context, state) => const HomView(),
      ),
      GoRoute(
        path: Routes.settingsRoute,
        builder: (context, state) => const SettingsView(),
      ),
    ],
  );
}
