import 'package:app/core/designsystem/components/error_view.dart';
import 'package:app/core/gen/i18n/i18n.g.dart';
import 'package:app/core/router/router.dart';
import 'package:app/features/session/data/model/session_models.dart';
import 'package:app/features/session/data/model/timeline_item.dart';
import 'package:app/features/session/data/provider/bookmarked_sessions_provider.dart';
import 'package:app/features/session/data/provider/session_provider.dart';
import 'package:app/features/session/data/provider/session_timeline_provider.dart';
import 'package:app/features/session/ui/components/session_speaker_icon.dart';
import 'package:app/features/session/ui/components/session_type_chip.dart';
import 'package:app/features/session/ui/components/timeline_item_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// セッションタイムライン画面
///
/// 主な役割:
/// - 1日開催のセッションをルーム(Room 1-4)ごとに表示する
/// - タイムラインビューでセッションと休憩・イベント情報を表示する
/// - ブックマーク機能とセッション詳細画面への導線を提供する
class SessionTimelineScreen extends HookConsumerWidget {
  const SessionTimelineScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);
    final venues = ref.watch(venuesWithSessionsProvider);

    return switch (venues) {
      AsyncData(value: final venueList) when venueList.isNotEmpty =>
        _SessionTimelineContent(
          t: t,
          venues: venueList,
        ),
      AsyncLoading() => const Scaffold(
        body: Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      ),
      AsyncError(:final error) => Scaffold(
        body: ErrorView(
          error: error,
          onRetry: () => ref.invalidate(venuesWithSessionsProvider),
        ),
      ),
      _ => const Scaffold(
        body: Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      ),
    };
  }
}

class _SessionTimelineContent extends HookConsumerWidget {
  const _SessionTimelineContent({
    required this.t,
    required this.venues,
  });

  final Translations t;
  final List<VenueWithSessions> venues;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentVenueIndex = useState(0);

    // venue一覧ごとにスクロールコントローラーを保持
    final scrollControllers = useMemoized(
      () => List.generate(venues.length, (_) => ScrollController()),
      [venues.length],
    );

    useEffect(
      () => () {
        for (final controller in scrollControllers) {
          controller.dispose();
        }
      },
      [scrollControllers],
    );

    return _buildContent(
      context: context,
      ref: ref,
      t: t,
      venues: venues,
      currentVenueIndex: currentVenueIndex,
      scrollControllers: scrollControllers,
    );
  }

  Widget _buildContent({
    required BuildContext context,
    required WidgetRef ref,
    required Translations t,
    required List<VenueWithSessions> venues,
    required ValueNotifier<int> currentVenueIndex,
    required List<ScrollController> scrollControllers,
  }) {
    final currentVenue = venues[currentVenueIndex.value];
    final scrollController = scrollControllers[currentVenueIndex.value];
    final pageStorageKey = PageStorageKey('venue_${currentVenue.id}');

    final timeline = ref.watch(
      sessionTimelineForVenueProvider(currentVenue.id),
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
                child: switch (timeline) {
                  AsyncData(value: final List<TimelineItem> value) =>
                    ListView.builder(
                      key: pageStorageKey,
                      controller: scrollController,
                      itemCount: value.length,
                      itemBuilder: (context, index) {
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
                      },
                    ),
                  AsyncLoading() => const Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                  AsyncError(:final error) => ErrorView(
                    error: error,
                    onRetry: () => ref.invalidate(sessionTimelineProvider),
                  ),
                },
              ),
            ],
          ),
          _RoomSwitcher(
            venues: venues,
            currentVenueIndex: currentVenueIndex,
            scrollController: scrollController,
          ),
        ],
      ),
    );
  }
}

class _RoomSwitcher extends HookConsumerWidget {
  const _RoomSwitcher({
    required this.venues,
    required this.currentVenueIndex,
    required this.scrollController,
  });

  final List<VenueWithSessions> venues;
  final ValueNotifier<int> currentVenueIndex;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isShowing = useState(true);

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
      [currentVenueIndex.value],
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
          borderRadius: BorderRadius.circular(24),
          color: theme.colorScheme.tertiary,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: () {
                  final venueWidgets = <Widget>[];
                  for (var i = 0; i < venues.length; i++) {
                    if (i > 0) {
                      venueWidgets.add(const SizedBox(width: 12));
                    }
                    venueWidgets.add(
                      GestureDetector(
                        onTap: () => currentVenueIndex.value = i,
                        child: _VenueSwitcherButton(
                          isSelected: currentVenueIndex.value == i,
                          venue: venues[i],
                        ),
                      ),
                    );
                  }
                  return venueWidgets;
                }(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _VenueSwitcherButton extends StatelessWidget {
  const _VenueSwitcherButton({
    required this.isSelected,
    required this.venue,
  });

  final bool isSelected;
  final VenueWithSessions venue;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isSelected ? theme.colorScheme.onTertiary : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        venue.name,
        style: TextStyle(
          color: isSelected
              ? theme.colorScheme.tertiary
              : theme.colorScheme.onTertiary,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
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

  final ScheduleSession session;
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
            ...session.speakers.map(
              (speaker) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    SessionSpeakerIcon(
                      speaker: speaker,
                      size: 40,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        speaker.name,
                        style: theme.textTheme.labelMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
