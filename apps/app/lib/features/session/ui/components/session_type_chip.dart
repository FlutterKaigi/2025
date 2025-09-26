import 'package:app/features/session/data/model/session.dart';
import 'package:flutter/material.dart';

enum SessionType {
  regularTalk,
  sponsorTalk,
  lightningTalk,
  beginnersLightningTalk,
  handsOn,
}

class SessionTypeChip extends StatelessWidget {
  const SessionTypeChip({
    required this.session,
    super.key,
  });

  final Session session;

  SessionType get _sessionType {
    if (session.isBeginnersLightningTalk) {
      return SessionType.beginnersLightningTalk;
    } else if (session.isLightningTalk) {
      return SessionType.lightningTalk;
    } else if (session.isSponsorTalk) {
      return SessionType.sponsorTalk;
    } else if (session.isHandsOn) {
      return SessionType.handsOn;
    } else {
      return SessionType.regularTalk;
    }
  }

  String get _label {
    switch (_sessionType) {
      case SessionType.regularTalk:
        return 'Regular Talk';
      case SessionType.sponsorTalk:
        return 'Sponsored Talk';
      case SessionType.lightningTalk:
        return 'Lightning Talk';
      case SessionType.beginnersLightningTalk:
        return 'Beginners Lightning Talk';
      case SessionType.handsOn:
        return 'Hands-On Session';
    }
  }

  Color _getBackgroundColor(ColorScheme colorScheme) {
    switch (_sessionType) {
      case SessionType.regularTalk:
        return colorScheme.tertiaryFixedDim;
      case SessionType.sponsorTalk:
        return colorScheme.primaryFixedDim;
      case SessionType.lightningTalk:
        return colorScheme.secondaryFixedDim;
      case SessionType.beginnersLightningTalk:
        return Colors.orange.shade800;
      case SessionType.handsOn:
        return Colors.blue.shade800;
    }
  }

  Color _getTextColor(ColorScheme colorScheme) {
    switch (_sessionType) {
      case SessionType.regularTalk:
        return colorScheme.onTertiaryFixedVariant;
      case SessionType.sponsorTalk:
        return colorScheme.onPrimaryFixedVariant;
      case SessionType.lightningTalk:
        return colorScheme.onSecondaryFixedVariant;
      case SessionType.beginnersLightningTalk:
        return Colors.orange.shade100;
      case SessionType.handsOn:
        return Colors.blue.shade100;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: _getBackgroundColor(colorScheme),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        _label,
        style: theme.textTheme.labelSmall?.copyWith(
          color: _getTextColor(colorScheme),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
