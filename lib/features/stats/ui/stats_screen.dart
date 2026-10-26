import 'package:flutter/material.dart';

import '../../../core/ui/placeholder_content.dart';

/// Hauptbereich „Statistik“: Fortschritt und Heatmap (Epic #12).
class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  /// Route dieses Bereichs.
  static const String route = '/stats';

  @override
  Widget build(BuildContext context) {
    return const PlaceholderContent(title: 'Statistik', icon: Icons.bar_chart);
  }
}
