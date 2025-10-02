import 'dart:async';

import 'package:app/features/session/data/model/session.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// スピーカーアイコンWidget
///
/// セッション登壇者のアイコン画像を表示するためのWidget。
class SessionSpeakerIcon extends StatelessWidget {
  const SessionSpeakerIcon({
    required this.speaker,
    required this.size,
    super.key,
  });

  final Speaker speaker;
  final double size;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () {
        if (speaker.xUrl != null) {
          unawaited(
            launchUrl(
              speaker.xUrl!,
              mode: LaunchMode.externalApplication,
            ),
          );
        }
      },
      child: CircleAvatar(
        radius: size / 2,
        backgroundColor: theme.colorScheme.surfaceContainerHighest,
        backgroundImage: speaker.avatarUrl != null
            ? NetworkImage(speaker.avatarUrl.toString())
            : null,
        child: speaker.avatarUrl == null
            ? Icon(
                Icons.person,
                size: size * 0.6,
                color: theme.colorScheme.onSurfaceVariant,
              )
            : null,
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Speaker>('speaker', speaker));
    properties.add(DoubleProperty('size', size));
  }
}
