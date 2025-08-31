import 'package:app/core/util/window_size.dart';
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
    final screenSize = WindowSize.fromWidth(width);

    return switch (screenSize) {
      WindowSize.expanded => _ExpandedScreen(
        destinations: destinations,
        currentIndex: currentIndex,
        onNavigationIndexChange: onNavigationIndexChange,
        body: body,
      ),
      WindowSize.medium => _MediumScreen(
        destinations: destinations,
        currentIndex: currentIndex,
        onNavigationIndexChange: onNavigationIndexChange,
        body: body,
      ),
      WindowSize.compact => _CompactScreen(
        destinations: destinations,
        currentIndex: currentIndex,
        onNavigationIndexChange: onNavigationIndexChange,
        body: body,
      ),
    };
  }
}

class _ExpandedScreen extends StatelessWidget {
  const _ExpandedScreen({
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
            extended: true,
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
            labelType: NavigationRailLabelType.all,
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

class _CompactScreen extends StatelessWidget {
  const _CompactScreen({
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
