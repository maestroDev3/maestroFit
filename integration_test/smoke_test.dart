import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:maestrofit/main.dart' as app;

/// Smoke-Test auf dem Emulator: läuft nightly bzw. manuell (nicht je PR),
/// siehe CLAUDE.md „Mergen“ und .github/workflows/nightly.yml.
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('App startet und erreicht alle Hauptbereiche', (tester) async {
    app.main();
    await tester.pumpAndSettle();

    for (final label in ['Training', 'Statistik', 'Einstellungen', 'Übungen']) {
      await tester.tap(find.descendant(
        of: find.byType(NavigationBar),
        matching: find.text(label),
      ));
      await tester.pumpAndSettle();
    }

    expect(tester.takeException(), isNull);
  });
}
