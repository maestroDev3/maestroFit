import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'router/app_router.dart';
import 'theme/app_theme.dart';

/// Wurzel-Widget der App mit Navigations-Shell und Themes.
///
/// Der Theme-Modus folgt der Systemeinstellung; ein manueller Umschalter
/// kommt mit den Einstellungen (spätere Story).
class MaestroFitApp extends ConsumerWidget {
  const MaestroFitApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    return MaterialApp.router(
      title: 'maestroFit',
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.system,
      routerConfig: router,
    );
  }
}
