import 'package:app/core/gen/i18n/i18n.g.dart';
import 'package:app/core/router/router.dart';
import 'package:app/features/session/data/provider/bookmarked_sessions_provider.dart';
import 'package:app/features/session/data/provider/session_provider.dart';
import 'package:app/features/session/ui/components/session_card.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// お気に入りセッション一覧画面
class BookmarkedSessionsScreen extends ConsumerWidget {
  const BookmarkedSessionsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);
    final sessions = ref.watch(sessionsProvider);
    final bookmarkedSessions = ref.watch(bookmarkedSessionsProvider);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            title: Text(t.session.bookmarked.title),
          ),
          switch ((sessions, bookmarkedSessions)) {
            (AsyncData(:final value), AsyncData(value: final bookmarkedIds)) =>
              () {
                final bookmarkedSessionList = value
                    .where((session) => bookmarkedIds.contains(session.id))
                    .toList();

                return SliverPadding(
                  padding: const EdgeInsets.all(16),
                  sliver: SliverList.separated(
                    itemCount: bookmarkedSessionList.length,
                    itemBuilder: (context, index) {
                      final session = bookmarkedSessionList[index];
                      return SessionCard(
                        session: session,
                        onTap: () {
                          SessionDetailRoute(sessionId: session.id).go(context);
                        },
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16),
                  ),
                );
              }(),
            _ => const SliverFillRemaining(
              child: Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            ),
          },
        ],
      ),
    );
  }
}
