import 'package:flutter/material.dart';

/// Platzhalter-Inhalt eines Hauptbereichs, bis die fachlichen Stories ihn füllen.
class PlaceholderContent extends StatelessWidget {
  const PlaceholderContent({
    required this.title,
    required this.icon,
    this.footer,
    super.key,
  });

  /// Titel des Bereichs (erscheint in der AppBar).
  final String title;

  /// Symbol des Bereichs.
  final IconData icon;

  /// Optionale Fußzeile (z. B. App-Version in den Einstellungen).
  final String? footer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 56),
            const SizedBox(height: 12),
            // TODO(#14): Lokalisierung
            const Text('Inhalt folgt'),
            if (footer != null) ...[
              const SizedBox(height: 12),
              Text(footer!, style: Theme.of(context).textTheme.bodySmall),
            ],
          ],
        ),
      ),
    );
  }
}
