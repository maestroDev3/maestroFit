import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:maestrofit/core/app_info.dart';

void main() {
  test(
      'build_runner-Codegenerierung läuft fehlerfrei durch und das Ergebnis kompiliert',
      () {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    final info = container.read(appInfoProvider);

    expect(info, const AppInfo(name: 'maestroFit', version: '0.1.0'));
  });
}
