import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'router/app_router.dart';

/// Wurzel-Widget der App mit Navigations-Shell (Themes folgen in Task #43).
class MaestroFitApp extends ConsumerWidget {
  const MaestroFitApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    return MaterialApp.router(
      title: 'maestroFit',
      routerConfig: router,
    );
  }
}
