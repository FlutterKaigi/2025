import 'dart:async';

import 'package:app/core/provider/shared_preferences.dart';
import 'package:app/features/session/data/provider/notification_service_provider.dart';
import 'package:app/features/session/data/provider/session_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bookmarked_sessions_provider.g.dart';

@Riverpod(keepAlive: true)
class BookmarkedSessions extends _$BookmarkedSessions {
  static const String _key = 'bookmarked_sessions';

  @override
  Future<Set<String>> build() async {
    final preferences = ref.read(sharedPreferencesProvider);
    final sessionIds = await preferences.getStringList(_key);
    return sessionIds?.toSet() ?? <String>{};
  }

  Future<void> save(String sessionId) async {
    final current = await future;
    final newSessionIds = {...current, sessionId};
    state = AsyncData(newSessionIds);
    unawaited(_saveToDisk());

    // セッション情報を取得して通知をスケジュール
    try {
      final sessions = await ref.read(sessionsProvider.future);
      final session = sessions.firstWhere((s) => s.id == sessionId);

      await ref
          .read(notificationServiceProvider.notifier)
          .scheduleSessionNotification(
            sessionId: session.id,
            sessionTitle: session.title,
            venue: session.venue,
            sessionStartsAt: session.startsAt,
          );
    } on Exception catch (_) {
      // break
    }
  }

  Future<void> remove(String sessionId) async {
    final current = await future;
    final newSessionIds = <String>{...current}..remove(sessionId);
    state = AsyncData(newSessionIds);
    unawaited(_saveToDisk());

    // 通知をキャンセル
    try {
      await ref
          .read(notificationServiceProvider.notifier)
          .cancelSessionNotification(sessionId);
    } on Exception catch (_) {
      // 通知のキャンセルに失敗した場合は無視
      // お気に入り機能自体は正常に動作する
    }
  }

  Future<void> _saveToDisk() async {
    final preferences = ref.read(sharedPreferencesProvider);
    final current = await future;
    await preferences.setStringList(_key, current.toList());
  }
}
