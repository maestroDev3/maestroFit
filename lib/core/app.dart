import 'package:flutter/material.dart';

import 'ui/start_screen.dart';

/// Wurzel-Widget der App.
///
/// Die Navigations-Shell (go_router) folgt in Task #42, die Themes in
/// Task #43 – bis dahin zeigt die App den Platzhalter-Startbereich.
class MaestroFitApp extends StatelessWidget {
  const MaestroFitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'maestroFit',
      home: StartScreen(),
    );
  }
}
