import 'package:flutter/material.dart';

/// Zentrale Themes der App.
///
/// Erste Design-Tokens; der Feinschliff (eigene Farbwelt, Typografie,
/// Komponenten) kommt mit Epic #7.
abstract final class AppTheme {
  /// Ausgangsfarbe, aus der beide Farbschemata abgeleitet werden.
  static const Color seedColor = Color(0xFF00897B);

  /// Helles Theme.
  static ThemeData light() => _base(Brightness.light);

  /// Dunkles Theme.
  static ThemeData dark() => _base(Brightness.dark);

  static ThemeData _base(Brightness brightness) {
    final scheme = ColorScheme.fromSeed(
      seedColor: seedColor,
      brightness: brightness,
    );
    return ThemeData(colorScheme: scheme, useMaterial3: true);
  }
}
