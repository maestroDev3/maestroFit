import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Navigations-Shell mit Bottom-Navigation über die vier Hauptbereiche.
///
/// TODO(#14): Beschriftungen in die Lokalisierung (DE/EN) überführen.
class AppShell extends StatelessWidget {
  const AppShell({required this.navigationShell, super.key});

  /// Von go_router verwaltete Shell mit dem Zustand je Bereich.
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (index) => navigationShell.goBranch(
          index,
          initialLocation: index == navigationShell.currentIndex,
        ),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.menu_book),
            label: 'Übungen',
          ),
          NavigationDestination(
            icon: Icon(Icons.fitness_center),
            label: 'Training',
          ),
          NavigationDestination(
            icon: Icon(Icons.bar_chart),
            label: 'Statistik',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: 'Einstellungen',
          ),
        ],
      ),
    );
  }
}
