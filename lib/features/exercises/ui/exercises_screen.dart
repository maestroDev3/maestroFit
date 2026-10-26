import 'package:flutter/material.dart';

import '../../../core/ui/placeholder_content.dart';

/// Hauptbereich „Übungen“: Bibliothek und Body-Map (Epics #8, #9, #10).
class ExercisesScreen extends StatelessWidget {
  const ExercisesScreen({super.key});

  /// Route dieses Bereichs.
  static const String route = '/exercises';

  @override
  Widget build(BuildContext context) {
    return const PlaceholderContent(title: 'Übungen', icon: Icons.menu_book);
  }
}
