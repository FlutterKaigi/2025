import 'package:app/features/session/data/model/session.dart';
import 'package:app/features/session/data/provider/bookmarked_sessions_provider.dart';
import 'package:app/features/session/ui/components/session_speaker_icon.dart';
import 'package:app/features/session/ui/components/session_type_chip.dart';
import 'package:app/features/session/ui/components/session_venue_chip.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

/// セッションカード
class SessionCard extends ConsumerWidget {
  const SessionCard({
    required this.session,
    required this.onTap,
    super.key,
  });

  final Session session;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isBookmarked = switch (ref.watch(bookmarkedSessionsProvider)) {
      AsyncData(:final value) => value.contains(session.id),
      AsyncLoading() => false,
      AsyncError() => false,
    };

    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      session.title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      isBookmarked ? Icons.bookmark : Icons.bookmark_outline,
                      size: 20,
                    ),
                    onPressed: () async {
                      if (isBookmarked) {
                        await ref
                            .read(bookmarkedSessionsProvider.notifier)
                            .remove(session.id);
                      } else {
                        await ref
                            .read(bookmarkedSessionsProvider.notifier)
                            .save(session.id);
                      }
                    },
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  SessionVenueChip(venueName: session.venue.name),
                  SessionTypeChip(session: session),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  for (
                    int i = 0;
                    i < session.speakers.length && i < 3;
                    i++
                  ) ...[
                    if (i > 0) const SizedBox(width: 8),
                    SessionSpeakerIcon(
                      speaker: session.speakers[i],
                      size: 32,
                    ),
                  ],
                  if (session.speakers.isNotEmpty) ...[
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        session.speakers.map((s) => s.name).join(', '),
                        style: theme.textTheme.bodyMedium,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ],
              ),
              const SizedBox(height: 8),
              Text(
                _buildSchedule(session.startsAt, session.endsAt),
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _buildSchedule(DateTime startsAt, DateTime endsAt) {
    final startTime = DateFormat.Hm().format(startsAt);
    final endTime = DateFormat.Hm().format(endsAt);
    return '$startTime~$endTime';
  }
}
