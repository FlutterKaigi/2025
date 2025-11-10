import 'package:app/features/session/data/model/session.dart';
import 'package:flutter/material.dart';

class SessionTypeChip extends StatelessWidget {
  const SessionTypeChip({
    required this.session,
    super.key,
  });

  final Session session;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: session.types
          .map(
            (type) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: type.backgroundColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                type.label,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: type.textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}

extension on SessionType {
  String get label => switch (this) {
    SessionType.regularTalk => 'Regular Talk',
    SessionType.sponsorTalk => 'Sponsored Talk',
    SessionType.lightningTalk => 'Lightning Talk',
    SessionType.beginnersLightningTalk => 'Beginners Lightning Talk',
    SessionType.handsOn => 'Hands-On Session',
    SessionType.keynote => 'Keynote',
  };

  Color get backgroundColor => switch (this) {
    SessionType.regularTalk => Colors.grey.shade800,
    SessionType.sponsorTalk => Colors.blue.shade800,
    SessionType.lightningTalk => Colors.green.shade800,
    SessionType.beginnersLightningTalk => Colors.orange.shade800,
    SessionType.handsOn => Colors.purple.shade800,
    SessionType.keynote => Colors.red.shade800,
  };

  Color get textColor => switch (this) {
    SessionType.regularTalk => Colors.white,
    SessionType.sponsorTalk => Colors.white,
    SessionType.lightningTalk => Colors.white,
    SessionType.beginnersLightningTalk => Colors.white,
    SessionType.handsOn => Colors.white,
    SessionType.keynote => Colors.white,
  };
}
