import 'package:app/features/session/data/model/session.dart';
import 'package:flutter/material.dart';

/// 会場切り替えボタン
class VenueSwitcherButton extends StatelessWidget {
  const VenueSwitcherButton({
    required this.current,
    required this.venue,
    super.key,
  });

  final String current;
  final SessionVenue venue;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isSelected = current == venue.id;

    return Container(
      decoration: ShapeDecoration(
        color: isSelected ? theme.colorScheme.tertiaryContainer : null,
        shape: const StadiumBorder(),
      ),
      padding: const EdgeInsets.all(6),
      child: Text(
        venue.name,
        style: theme.textTheme.titleMedium?.copyWith(
          color: isSelected
              ? theme.colorScheme.onTertiaryContainer
              : theme.colorScheme.onTertiary,
        ),
      ),
    );
  }
}