import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mars_app/data/repo/repo.dart';
import 'package:mars_app/logic/mars_cubit/mars_cubit.dart';
import 'package:mars_app/view/home_view.dart';
import 'package:mars_app/view/photo_by_date.dart';
import 'package:mars_app/view/settings_view.dart';

class Routes {
  static const String PhotoByDateRoute = '/';
  static const String homeRoute = '/home';
  static const String settingsRoute = '/setting';
}

final MarsCubit marsCubit = MarsCubit(repo: Repo());

GoRouter router() {
  return GoRouter(
    routes: [
      GoRoute(
        path: Routes.PhotoByDateRoute,
        builder: (context, state) => BlocProvider<MarsCubit>.value(
          value: marsCubit,
          child: const PhotoByDateView(),
        ),
      ),
      GoRoute(
        path: Routes.homeRoute,
        builder: (context, state) => BlocProvider<MarsCubit>.value(
          value: marsCubit,
          child: HomeView(
            date: state.extra as DateTime?,
          ),
        ),
      ),
      GoRoute(
        path: Routes.settingsRoute,
        builder: (context, state) => BlocProvider<MarsCubit>.value(
          value: marsCubit,
          child: const SettingsView(),
        ),
      ),
    ],
  );
}
