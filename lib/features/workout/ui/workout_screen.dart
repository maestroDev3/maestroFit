import 'package:flutter/material.dart';

import '../../../core/ui/placeholder_content.dart';

/// Hauptbereich „Training“: Workout-Logger (Epic #11).
class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({super.key});

  /// Route dieses Bereichs.
  static const String route = '/workout';

  @override
  Widget build(BuildContext context) {
    return const PlaceholderContent(
      title: 'Training',
      icon: Icons.fitness_center,
    );
  }
}
