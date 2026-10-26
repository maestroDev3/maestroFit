import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/app_info.dart';
import '../../../core/ui/placeholder_content.dart';

/// Hauptbereich „Einstellungen“: Sprache, Einheiten, Credits (spätere Stories).
class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  /// Route dieses Bereichs.
  static const String route = '/settings';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final info = ref.watch(appInfoProvider);
    return PlaceholderContent(
      title: 'Einstellungen',
      icon: Icons.settings,
      footer: '${info.name} ${info.version}',
    );
  }
}
