import 'package:dashboard/core/util/screen_size.dart';
import 'package:flutter/material.dart';

/// A destination for the [ResponsiveScaffold].
class ResponsiveScaffoldDestination {
  const ResponsiveScaffoldDestination({
    required this.title,
    required this.icon,
  });
  final String title;
  final IconData icon;
}

/// A responsive scaffold widget that automatically switches between a [Drawer]
/// (for large screens), [NavigationRail] (for medium screens), and
/// [BottomNavigationBar] (for small screens) based on the display size.
/// The navigation destinations are provided via the [destinations] parameter.
class ResponsiveScaffold extends StatelessWidget {
  const ResponsiveScaffold({
    required this.currentIndex,
    required this.destinations,
    required this.onNavigationIndexChange,
    required this.body,
    super.key,
  });

  final int currentIndex;
  final List<ResponsiveScaffoldDestination> destinations;
  final ValueChanged<int> onNavigationIndexChange;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.widthOf(context);
    final screenSize = ScreenSize.fromWidth(width);

    return switch (screenSize) {
      ScreenSize.large => _LargeScreen(
        destinations: destinations,
        currentIndex: currentIndex,
        onNavigationIndexChange: onNavigationIndexChange,
        body: body,
      ),
      ScreenSize.medium => _MediumScreen(
        destinations: destinations,
        currentIndex: currentIndex,
        onNavigationIndexChange: onNavigationIndexChange,
        body: body,
      ),
      ScreenSize.small => _SmallScreen(
        destinations: destinations,
        currentIndex: currentIndex,
        onNavigationIndexChange: onNavigationIndexChange,
        body: body,
      ),
    };
  }
}

class _LargeScreen extends StatelessWidget {
  const _LargeScreen({
    required this.currentIndex,
    required this.destinations,
    required this.onNavigationIndexChange,
    required this.body,
  });

  final int currentIndex;
  final List<ResponsiveScaffoldDestination> destinations;
  final ValueChanged<int> onNavigationIndexChange;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NavigationDrawer(
          selectedIndex: currentIndex,
          onDestinationSelected: onNavigationIndexChange,
          children: [
            const SizedBox(height: 16),
            ...destinations.map(
              (d) => NavigationDrawerDestination(
                icon: Icon(d.icon),
                label: Text(d.title),
              ),
            ),
          ],
        ),
        Expanded(child: Scaffold(body: body)),
      ],
    );
  }
}

class _MediumScreen extends StatelessWidget {
  const _MediumScreen({
    required this.currentIndex,
    required this.destinations,
    required this.onNavigationIndexChange,
    required this.body,
  });

  final int currentIndex;
  final List<ResponsiveScaffoldDestination> destinations;
  final ValueChanged<int> onNavigationIndexChange;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            destinations: destinations
                .map(
                  (d) => NavigationRailDestination(
                    icon: Icon(d.icon),
                    label: Text(d.title),
                  ),
                )
                .toList(),
            selectedIndex: currentIndex,
            onDestinationSelected: onNavigationIndexChange,
          ),
          Expanded(child: body),
        ],
      ),
    );
  }
}

class _SmallScreen extends StatelessWidget {
  const _SmallScreen({
    required this.currentIndex,
    required this.destinations,
    required this.onNavigationIndexChange,
    required this.body,
  });

  final int currentIndex;
  final List<ResponsiveScaffoldDestination> destinations;
  final ValueChanged<int> onNavigationIndexChange;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar: NavigationBar(
        destinations: destinations
            .map(
              (d) => NavigationDestination(
                icon: Icon(d.icon),
                label: d.title,
              ),
            )
            .toList(),
        selectedIndex: currentIndex,
        onDestinationSelected: onNavigationIndexChange,
      ),
    );
  }
}
