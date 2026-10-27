import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:maestrofit/core/app.dart';
import 'package:maestrofit/features/exercises/ui/exercises_screen.dart';
import 'package:maestrofit/features/settings/ui/settings_screen.dart';
import 'package:maestrofit/features/stats/ui/stats_screen.dart';
import 'package:maestrofit/features/workout/ui/workout_screen.dart';

/// Smoke-Test gemäß CLAUDE.md „Mergen“: läuft je PR.
void main() {
  testWidgets(
      'App startet und alle Hauptbereiche sind über die Bottom-Navigation erreichbar',
      (tester) async {
    await tester.pumpWidget(const ProviderScope(child: MaestroFitApp()));
    await tester.pumpAndSettle();

    expect(find.byType(ExercisesScreen), findsOneWidget);

    Future<void> goTo(String label, Finder screen) async {
      await tester.tap(find.descendant(
        of: find.byType(NavigationBar),
        matching: find.text(label),
      ));
      await tester.pumpAndSettle();
      expect(screen, findsOneWidget);
    }

    await goTo('Training', find.byType(WorkoutScreen));
    await goTo('Statistik', find.byType(StatsScreen));
    await goTo('Einstellungen', find.byType(SettingsScreen));

    expect(tester.takeException(), isNull);
  });
}
