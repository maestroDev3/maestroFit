import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:maestrofit/core/app.dart';

Future<BuildContext> _pumpApp(WidgetTester tester) async {
  await tester.pumpWidget(const ProviderScope(child: MaestroFitApp()));
  await tester.pumpAndSettle();
  return tester.element(find.byType(NavigationBar));
}

void main() {
  testWidgets('Bei dunkler Systemeinstellung nutzt die App das dunkle Theme',
      (tester) async {
    tester.platformDispatcher.platformBrightnessTestValue = Brightness.dark;
    addTearDown(tester.platformDispatcher.clearPlatformBrightnessTestValue);

    final context = await _pumpApp(tester);

    expect(Theme.of(context).brightness, Brightness.dark);
  });

  testWidgets('Bei heller Systemeinstellung nutzt die App das helle Theme',
      (tester) async {
    tester.platformDispatcher.platformBrightnessTestValue = Brightness.light;
    addTearDown(tester.platformDispatcher.clearPlatformBrightnessTestValue);

    final context = await _pumpApp(tester);

    expect(Theme.of(context).brightness, Brightness.light);
  });
}
