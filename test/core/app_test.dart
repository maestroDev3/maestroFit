import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:maestrofit/core/app.dart';
import 'package:maestrofit/features/exercises/ui/exercises_screen.dart';

void main() {
  testWidgets('App startet und rendert den Startbereich ohne Fehler',
      (tester) async {
    await tester.pumpWidget(const ProviderScope(child: MaestroFitApp()));
    await tester.pumpAndSettle();

    expect(find.byType(ExercisesScreen), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
