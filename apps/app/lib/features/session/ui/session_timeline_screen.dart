import 'package:app/core/designsystem/components/error_screen.dart';
import 'package:app/core/gen/i18n/i18n.g.dart';
import 'package:app/core/router/router.dart';
import 'package:app/core/util/window_size.dart';
import 'package:app/features/session/data/model/session.dart';
import 'package:app/features/session/data/model/timeline_item.dart';
import 'package:app/features/session/data/provider/bookmarked_sessions_provider.dart';
import 'package:app/features/session/data/provider/session_provider.dart';
import 'package:app/features/session/data/provider/session_timeline_provider.dart';
import 'package:app/features/session/ui/components/session_speaker_icon.dart';
import 'package:app/features/session/ui/components/session_type_chip.dart';
import 'package:app/features/session/ui/components/timeline_item_view.dart';
import 'package:bff_client/bff_client.dart' hide Session;
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
        body: ErrorScreen(
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
    final pageController = usePageController();

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

    final currentScrollController = scrollControllers[currentVenueIndex.value];

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
                child: PageView.builder(
                  controller: pageController,
                  itemCount: venues.length,
                  onPageChanged: (index) {
                    currentVenueIndex.value = index;
                  },
                  itemBuilder: (context, index) {
                    final venue = venues[index];
                    final scrollController = scrollControllers[index];

                    return _VenueTimelineView(
                      venue: venue,
                      scrollController: scrollController,
                    );
                  },
                ),
              ),
            ],
          ),
          _RoomSwitcher(
            venues: venues,
            currentVenueIndex: currentVenueIndex,
            scrollController: currentScrollController,
            pageController: pageController,
          ),
        ],
      ),
    );
  }
}

class _VenueTimelineView extends ConsumerWidget {
  const _VenueTimelineView({
    required this.venue,
    required this.scrollController,
  });

  final VenueWithSessions venue;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timeline = ref.watch(
      sessionTimelineForVenueProvider(venue.id),
    );

    final pageStorageKey = PageStorageKey('venue_${venue.id}');

    return switch (timeline) {
      AsyncData(value: final List<TimelineItem> value) => RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(
            sessionTimelineForVenueProvider(venue.id),
          );
          // プロバイダーが更新されるまで待つ
          await ref.read(
            sessionTimelineForVenueProvider(venue.id).future,
          );
        },
        child: ListView.builder(
          key: pageStorageKey,
          controller: scrollController,
          itemCount: value.length,
          itemBuilder: (context, index) {
            final item = value[index];
            final isDateVisible =
                index == 0 || item.startsAt != value[index - 1].startsAt;

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
      ),
      AsyncLoading() => const Center(
        child: CircularProgressIndicator.adaptive(),
      ),
      AsyncError(:final error) => ErrorScreen(
        error: error,
        onRetry: () => ref.invalidate(sessionTimelineProvider),
      ),
    };
  }
}

class _RoomSwitcher extends HookConsumerWidget {
  const _RoomSwitcher({
    required this.venues,
    required this.currentVenueIndex,
    required this.scrollController,
    required this.pageController,
  });

  final List<VenueWithSessions> venues;
  final ValueNotifier<int> currentVenueIndex;
  final ScrollController scrollController;
  final PageController pageController;

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

    final screenWidth = MediaQuery.sizeOf(context).width;
    final windowSize = WindowSize.fromWidth(screenWidth);
    // ResponsiveScaffoldと同じブレークポイント（600px以下がモバイル）
    final isCompact = windowSize == WindowSize.compact;

    return AnimatedPositioned(
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
      bottom: isShowing.value ? 16 : -80,
      left: 0,
      right: 0,
      child: Center(
        child: SizedBox(
          width: isCompact ? screenWidth * 0.9 : 600,
          child: Material(
            elevation: 2,
            borderRadius: BorderRadius.circular(24),
            color: theme.colorScheme.tertiary,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  venues.length,
                  (i) => GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      pageController
                          .animateToPage(
                            i,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          )
                          .ignore();
                    },
                    child: _VenueSwitcherButton(
                      isSelected: currentVenueIndex.value == i,
                      venue: venues[i],
                      isCompact: isCompact,
                    ),
                  ),
                ),
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
    required this.isCompact,
  });

  final bool isSelected;
  final VenueWithSessions venue;
  final bool isCompact;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? theme.colorScheme.onTertiary : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        venue.name,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: isSelected
              ? theme.colorScheme.tertiary
              : theme.colorScheme.onTertiary,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          // compactモード（モバイル）では選択時のみ大きく、それ以外は全て同じサイズ
          fontSize: isCompact ? (isSelected ? 14 : 8) : 14,
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

  /// タイトルからプレフィックス（`[XXX]`形式）を抽出する
  /// 戻り値: (プレフィックス, プレフィックスを除去したタイトル)
  (String?, String) _extractPrefix(String title) {
    final regex = RegExp(r'^\[([^\]]+)\]\s*(.+)$');
    final match = regex.firstMatch(title);
    if (match != null) {
      return (match.group(1), match.group(2) ?? '');
    }
    return (null, title);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isBookmarked = switch (ref.watch(bookmarkedSessionsProvider)) {
      AsyncData(:final value) => value.contains(session.id),
      AsyncLoading() => false,
      AsyncError() => false,
    };

    final (prefix, titleWithoutPrefix) = _extractPrefix(session.title);

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
          titleWithoutPrefix,
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
                if (prefix != null)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primaryFixedDim,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      prefix,
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: theme.colorScheme.onPrimaryFixedVariant,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                else
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
