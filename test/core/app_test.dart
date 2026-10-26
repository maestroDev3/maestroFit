import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:maestrofit/core/app.dart';

void main() {
  testWidgets('App startet und rendert den Startbereich ohne Fehler',
      (tester) async {
    await tester.pumpWidget(const ProviderScope(child: MaestroFitApp()));

    expect(find.text('maestroFit'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
