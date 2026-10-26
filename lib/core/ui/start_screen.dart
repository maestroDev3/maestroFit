import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_info.dart';

/// Platzhalter-Startbereich, bis die Navigations-Shell (Task #42) steht.
class StartScreen extends ConsumerWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final info = ref.watch(appInfoProvider);
    return Scaffold(
      appBar: AppBar(title: Text(info.name)),
      body: Center(child: Text('Version ${info.version}')),
    );
  }
}
