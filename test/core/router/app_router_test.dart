import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:maestrofit/core/app.dart';
import 'package:maestrofit/core/router/app_router.dart';
import 'package:maestrofit/features/stats/ui/stats_screen.dart';
import 'package:maestrofit/features/workout/ui/workout_screen.dart';

void main() {
  testWidgets(
      'Bottom-Navigation zeigt die vier Bereiche Übungen, Training, Statistik, Einstellungen',
      (tester) async {
    await tester.pumpWidget(const ProviderScope(child: MaestroFitApp()));
    await tester.pumpAndSettle();

    expect(find.byType(NavigationBar), findsOneWidget);
    for (final label in ['Übungen', 'Training', 'Statistik', 'Einstellungen']) {
      expect(
        find.descendant(
          of: find.byType(NavigationBar),
          matching: find.text(label),
        ),
        findsOneWidget,
      );
    }
  });

  testWidgets('Antippen eines Tabs wechselt zur jeweiligen Ansicht',
      (tester) async {
    await tester.pumpWidget(const ProviderScope(child: MaestroFitApp()));
    await tester.pumpAndSettle();
    expect(find.byType(WorkoutScreen), findsNothing);

    await tester.tap(find.descendant(
      of: find.byType(NavigationBar),
      matching: find.text('Training'),
    ));
    await tester.pumpAndSettle();

    expect(find.byType(WorkoutScreen), findsOneWidget);
  });

  testWidgets('Direktaufruf einer Route (z. B. /stats) zeigt den richtigen Bereich',
      (tester) async {
    final router = createAppRouter(initialLocation: StatsScreen.route);
    addTearDown(router.dispose);
    await tester.pumpWidget(MaterialApp.router(routerConfig: router));
    await tester.pumpAndSettle();

    expect(find.byType(StatsScreen), findsOneWidget);
  });
}
