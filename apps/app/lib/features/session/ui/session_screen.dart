import 'package:app/core/designsystem/components/error_screen.dart';
import 'package:app/core/gen/i18n/i18n.g.dart';
import 'package:app/core/util/share_util.dart';
import 'package:app/features/session/data/model/session_models.dart';
import 'package:app/features/session/data/provider/bookmarked_sessions_provider.dart';
import 'package:app/features/session/data/provider/session_provider.dart';
import 'package:app/features/session/ui/components/session_speaker_icon.dart';
import 'package:app/features/session/ui/components/session_type_chip.dart';
import 'package:app/features/session/ui/components/session_venue_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:url_launcher/url_launcher.dart';

/// セッション詳細画面
///
/// 主な役割:
/// - セッションの詳細情報（タイトル、概要、時間、会場）を表示する
/// - スピーカー情報（名前、プロフィール、SNSリンク）を表示する
/// - ブックマーク機能を提供する
/// - 録画動画へのリンクを提供する（録画がある場合）
class SessionScreen extends ConsumerWidget {
  const SessionScreen({
    required this.sessionId,
    super.key,
  });

  final String sessionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(
      sessionsProvider.select((sessions) {
        return switch (sessions) {
          AsyncData(:final value) => () {
            try {
              final foundSession = value.firstWhere((s) => s.id == sessionId);
              return AsyncData<ScheduleSession?>(foundSession);
            } on Exception {
              return const AsyncData<ScheduleSession?>(null);
            }
          }(),
          AsyncLoading() => const AsyncLoading<ScheduleSession?>(),
          AsyncError(:final error, :final stackTrace) =>
            AsyncError<ScheduleSession?>(
              error,
              stackTrace,
            ),
        };
      }),
    );

    return switch (session) {
      AsyncData<ScheduleSession?>(value: final value) when value != null =>
        Scaffold(
          body: _SessionDetailView(session: value),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              final bookmarkedSessions = await ref.read(
                bookmarkedSessionsProvider.future,
              );
              final isBookmarked = bookmarkedSessions.contains(sessionId);
              if (isBookmarked) {
                await ref
                    .read(bookmarkedSessionsProvider.notifier)
                    .remove(sessionId);
              } else {
                await ref
                    .read(bookmarkedSessionsProvider.notifier)
                    .save(sessionId);
              }
            },
            child: switch (ref.watch(bookmarkedSessionsProvider)) {
              AsyncData(:final value) =>
                value.contains(sessionId)
                    ? const Icon(Icons.bookmark)
                    : const Icon(Icons.bookmark_outline),
              _ => const Icon(Icons.bookmark_outline),
            },
          ),
        ),
      AsyncData<ScheduleSession?>(value: null) => Scaffold(
        body: Center(
          child: Text(Translations.of(context).session.empty.message),
        ),
      ),
      AsyncLoading<ScheduleSession?>() => const Scaffold(
        body: Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      ),
      AsyncError<ScheduleSession?>(:final error) => Scaffold(
        body: ErrorScreen(
          error: error,
          onRetry: () => ref.invalidate(sessionsProvider),
        ),
      ),
      _ => Scaffold(
        body: Center(
          child: Text(Translations.of(context).session.empty.message),
        ),
      ),
    };
  }
}

final _googleCalendarDateFormatter = DateFormat("yyyyMMdd'T'HHmmss'Z'");

class _SessionDetailView extends ConsumerWidget with SessionScreenMixin {
  _SessionDetailView({required this.session});

  final ScheduleSession session;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return SafeArea(
      top: false,
      child: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            expandedHeight: getExpandedHeight(
              title: session.title,
              context: context,
            ),
            title: Text(session.title),
            actions: [
              IconButton(
                tooltip: 'Xでシェア',
                padding: const EdgeInsets.all(12),
                onPressed: () async {
                  final sessionUrl =
                      'https://2025-app.flutterkaigi.jp/sessions/${session.id}';
                  await ShareUtil.shareToX(
                    text: session.title,
                    url: sessionUrl,
                    hashtags: 'FlutterKaigi2025',
                    via: 'FlutterKaigi',
                  );
                },
                icon: const Icon(Icons.share),
              ),
            ],
          ),
          SliverList.list(
            children: [
              if (session.videoUrl != null) ...[
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  height: 200,
                  color: Colors.black,
                  child: const Center(
                    child: Icon(
                      Icons.play_circle_outline,
                      size: 64,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Wrap(
                  runSpacing: 8,
                  spacing: 8,
                  children: [
                    IntrinsicWidth(
                      child: SessionVenueChip(
                        venueName: session.venue,
                      ),
                    ),
                    IntrinsicWidth(
                      child: SessionTypeChip(session: session),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              for (final speaker in session.speakers) ...[
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 16,
                  ),
                  leading: SessionSpeakerIcon(
                    speaker: speaker,
                    size: 56,
                  ),
                  title: Text(speaker.name),
                ),
              ],
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: MarkdownBody(
                  data: session.description,
                ),
              ),
              const SizedBox(height: 8),
              ListTile(
                title: Text(
                  _buildSchedule(session.startsAt, session.endsAt),
                  style: theme.textTheme.bodyLarge,
                ),
                leading: const Icon(Icons.event_outlined),
                onTap: () => _addToCalendar(session),
              ),
              // TODO: フィードバック用のフォームが作成されたら復活させる
              // const SizedBox(height: 16),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 16),
              //   child: Text(
              //     Translations.of(context).session.feedback.title,
              //     style: theme.textTheme.titleMedium,
              //   ),
              // ),
              // const SizedBox(height: 8),
              // ListTile(
              //   title: Text(Translations.of(context).session.feedback.send),
              //   trailing: const Icon(Icons.arrow_outward),
              //   onTap: () {},
              // ),
              const SizedBox(height: 64),
            ],
          ),
        ],
      ),
    );
  }

  String _buildSchedule(DateTime startsAt, DateTime endsAt) {
    final startDate = DateFormat.Md().format(startsAt);
    final startTime = DateFormat.Hm().format(startsAt);
    final endTime = DateFormat.Hm().format(endsAt);
    return '$startDate $startTime~$endTime';
  }

  /// カレンダーにセッションを追加する
  Future<void> _addToCalendar(ScheduleSession session) async {
    // すべてのプラットフォームでGoogle Calendar URLを使用
    final url = _createGoogleCalendarUrl(session);
    await launchUrl(url, mode: LaunchMode.externalApplication);
  }

  /// Google Calendar用のURLを作成
  Uri _createGoogleCalendarUrl(ScheduleSession session) {
    return Uri.https(
      'www.google.com',
      'calendar/render',
      {
        'action': 'TEMPLATE',
        'text': 'FlutterKaigi 2025: ${session.title}',
        'details': session.description,
        'location': session.venue,
        'dates':
            '${_googleCalendarDateFormatter.format(session.startsAt.toUtc())}/${_googleCalendarDateFormatter.format(session.endsAt.toUtc())}',
      },
    );
  }
}

mixin SessionScreenMixin {
  final appBarSize = kToolbarHeight;
  final padding = 32;

  /// title の長さに応じて、SliverAppBar の expandedHeight を計算します
  double getExpandedHeight({
    required String title,
    required BuildContext context,
    bool forLarge = true,
  }) {
    final textPainter =
        TextPainter(
          text: TextSpan(
            text: title,
            style: forLarge
                ? Theme.of(context).textTheme.headlineMedium
                : Theme.of(context).textTheme.headlineSmall,
          ),
          textDirection: TextDirection.ltr,
        )..layout(
          maxWidth: MediaQuery.sizeOf(context).width - padding,
        );
    return appBarSize + padding + textPainter.height;
  }
}
