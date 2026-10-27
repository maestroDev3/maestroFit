@Tags(['screenshots'])
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:maestrofit/core/app.dart';

/// Erzeugt Screenshots der Hauptbereiche (hell und dunkel) als Goldens.
///
/// Läuft NICHT im normalen Testlauf (Tag `screenshots`), sondern in einem
/// eigenen CI-Schritt mit `--update-goldens`; die PNGs werden als Artefakt
/// hochgeladen – das visuelle Feedback für den Agenten (Story #15).
void main() {
  const screens = [
    (tab: 'Übungen', datei: 'uebungen'),
    (tab: 'Training', datei: 'training'),
    (tab: 'Statistik', datei: 'statistik'),
    (tab: 'Einstellungen', datei: 'einstellungen'),
  ];

  for (final (name: modus, brightness: brightness) in [
    (name: 'hell', brightness: Brightness.light),
    (name: 'dunkel', brightness: Brightness.dark),
  ]) {
    testWidgets('Screenshots der Hauptbereiche ($modus)', (tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.625;
      addTearDown(tester.view.reset);
      tester.platformDispatcher.platformBrightnessTestValue = brightness;
      addTearDown(tester.platformDispatcher.clearPlatformBrightnessTestValue);

      await tester.pumpWidget(const ProviderScope(child: MaestroFitApp()));
      await tester.pumpAndSettle();

      for (final screen in screens) {
        await tester.tap(find.descendant(
          of: find.byType(NavigationBar),
          matching: find.text(screen.tab),
        ));
        await tester.pumpAndSettle();
        await expectLater(
          find.byType(MaestroFitApp),
          matchesGoldenFile('goldens/${screen.datei}_$modus.png'),
        );
      }
    });
  }
}
