import 'package:app/core/designsystem/components/error_view.dart';
import 'package:app/core/gen/i18n/i18n.g.dart';
import 'package:app/core/router/router.dart';
import 'package:app/features/session/data/model/session.dart';
import 'package:app/features/session/data/model/timeline_item.dart';
import 'package:app/features/session/data/provider/bookmarked_sessions_provider.dart';
import 'package:app/features/session/data/provider/session_provider.dart';
import 'package:app/features/session/data/provider/session_timeline_provider.dart';
import 'package:app/features/session/ui/components/session_type_chip.dart';
import 'package:app/features/session/ui/components/timeline_item_view.dart';
import 'package:app/features/session/ui/components/venue_switcher_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// セッションタイムライン画面
///
/// 主な役割:
/// - 1日開催のセッションを会場(Venue 1-4)ごとに表示する
/// - タイムラインビューでセッションと休憩・イベント情報を表示する
/// - ブックマーク機能とセッション詳細画面への導線を提供する
class SessionTimelineScreen extends HookConsumerWidget {
  const SessionTimelineScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);
    final currentVenue = useState('venue1');
    final scrollControllers = useMemoized(
      () => List.generate(4, (_) => ScrollController()),
      [],
    );

    final venueIndex = int.parse(currentVenue.value.substring(5)) - 1;
    final scrollController = scrollControllers[venueIndex];
    final pageStorageKey = PageStorageKey('venue${currentVenue.value}');

    final timeline = ref.watch(
      sessionTimelineForVenueProvider(currentVenue.value),
    );

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              AppBar(
                title: Text(t.session.title),
                actions: [
                  IconButton(
                    tooltip: t.session.detail.bookmark,
                    onPressed: () {
                      const BookmarkedSessionsRoute().go(context);
                    },
                    icon: const Icon(Icons.bookmarks_outlined),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  key: pageStorageKey,
                  controller: scrollController,
                  itemCount: switch (timeline) {
                    AsyncData(value: final List<TimelineItem> value) =>
                      value.length,
                    AsyncLoading() => 0,
                    AsyncError() => 0,
                  },
                  itemBuilder: (context, index) => switch (timeline) {
                    AsyncData(value: final List<TimelineItem> value) => () {
                      final item = value[index];
                      final isDateVisible =
                          index == 0 ||
                          item.startsAt != value[index - 1].startsAt;

                      return TimelineItemView(
                        item: item,
                        isDateVisible: isDateVisible,
                        sessionCardBuilder: (session) => _SessionCard(
                          session: session.session,
                          onTap: () {
                            SessionDetailRoute(
                              sessionId: session.session.id,
                            ).go(context);
                          },
                        ),
                      );
                    }(),
                    AsyncLoading() => const SizedBox.shrink(),
                    AsyncError() => const SizedBox.shrink(),
                  },
                ),
              ),
            ],
          ),
          if (switch (timeline) {
            AsyncData() => false,
            AsyncLoading() => true,
            AsyncError() => false,
          })
            const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          if (switch (timeline) {
            AsyncData() => false,
            AsyncLoading() => false,
            AsyncError() => true,
          })
            ErrorView(
              error: switch (timeline) {
                AsyncError(:final error) => error,
                _ => Exception('Unknown error'),
              },
              onRetry: () => ref.invalidate(sessionTimelineProvider),
            ),
          _VenueSwitcher(
            current: currentVenue,
            scrollController: scrollController,
          ),
        ],
      ),
    );
  }
}

class _VenueSwitcher extends HookConsumerWidget {
  const _VenueSwitcher({
    required this.current,
    required this.scrollController,
  });

  final ValueNotifier<String> current;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isShowing = useState(true);
    final venues = ref.watch(sessionVenuesProvider);

    useEffect(
      () {
        void listener() {
          if (scrollController.hasClients &&
              scrollController.position.hasContentDimensions) {
            final direction = scrollController.position.userScrollDirection;
            if (direction == ScrollDirection.reverse) {
              isShowing.value = false;
            } else if (direction == ScrollDirection.forward) {
              isShowing.value = true;
            }
          }
        }

        scrollController.addListener(listener);
        return () => scrollController.removeListener(listener);
      },
      [current.value],
    );

    return AnimatedPositioned(
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
      bottom: isShowing.value ? 16 : -80,
      left: 0,
      right: 0,
      child: Center(
        child: Material(
          elevation: 2,
          borderRadius: BorderRadius.circular(20),
          color: theme.colorScheme.tertiary,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16,
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: switch (venues) {
                  AsyncData(:final value) => () {
                    final venueWidgets = <Widget>[];
                    for (var i = 0; i < value.length; i++) {
                      if (i > 0) {
                        venueWidgets.add(const SizedBox(width: 12));
                      }
                      venueWidgets.add(
                        GestureDetector(
                          onTap: () => current.value = value[i].id,
                          child: VenueSwitcherButton(
                            current: current.value,
                            venue: value[i],
                          ),
                        ),
                      );
                    }
                    return venueWidgets;
                  }(),
                  AsyncLoading() => [
                    const CircularProgressIndicator.adaptive(),
                  ],
                  AsyncError() => <Widget>[],
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SessionCard extends ConsumerWidget {
  const _SessionCard({
    required this.session,
    this.onTap,
  });

  final Session session;
  final VoidCallback? onTap;

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
      margin: const EdgeInsets.symmetric(
        vertical: 4,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: theme.colorScheme.outline,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        title: Text(
          session.title,
          style: theme.textTheme.titleMedium,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            if (session.speakers.isNotEmpty) ...[
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: theme.colorScheme.surfaceContainerHighest,
                    backgroundImage: session.speakers.first.avatarUrl != null
                        ? NetworkImage(
                            session.speakers.first.avatarUrl.toString(),
                          )
                        : null,
                    child: session.speakers.first.avatarUrl == null
                        ? Icon(
                            Icons.person,
                            size: 20,
                            color: theme.colorScheme.onSurfaceVariant,
                          )
                        : null,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      session.speakers.first.name,
                      style: theme.textTheme.labelMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
            ],
            Row(
              children: [
                SessionTypeChip(session: session),
                const Spacer(),
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
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
          ],
        ),
      ),
    );
  }
}

