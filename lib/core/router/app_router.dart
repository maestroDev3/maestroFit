import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/exercises/ui/exercises_screen.dart';
import '../../features/settings/ui/settings_screen.dart';
import '../../features/stats/ui/stats_screen.dart';
import '../../features/workout/ui/workout_screen.dart';
import '../ui/app_shell.dart';

part 'app_router.g.dart';

/// Baut den Router der App.
///
/// [initialLocation] ist überschreibbar, damit Tests einzelne Bereiche
/// direkt aufrufen können.
GoRouter createAppRouter({String initialLocation = ExercisesScreen.route}) {
  return GoRouter(
    initialLocation: initialLocation,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            AppShell(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(routes: [
            GoRoute(
              path: ExercisesScreen.route,
              builder: (context, state) => const ExercisesScreen(),
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: WorkoutScreen.route,
              builder: (context, state) => const WorkoutScreen(),
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: StatsScreen.route,
              builder: (context, state) => const StatsScreen(),
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: SettingsScreen.route,
              builder: (context, state) => const SettingsScreen(),
            ),
          ]),
        ],
      ),
    ],
  );
}

/// Stellt den Router der laufenden App bereit.
@riverpod
GoRouter appRouter(Ref ref) {
  final router = createAppRouter();
  ref.onDispose(router.dispose);
  return router;
}
