import 'dart:async';

import 'package:app/core/provider/shared_preferences.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bookmarked_sessions_provider.g.dart';

@Riverpod(keepAlive: true)
class BookmarkedSessions extends _$BookmarkedSessions {
  static const String _key = 'bookmarked_sessions';

  @override
  Future<Set<String>> build() async {
    final prefs = ref.read(sharedPreferencesProvider);
    final sessionIds = await prefs.getStringList(_key);
    return sessionIds?.toSet() ?? <String>{};
  }

  Future<void> save(String sessionId) async {
    debugPrint('Saving session: $sessionId');
    final current = await future;
    debugPrint('Current bookmarks: $current');
    final newSessionIds = {...current, sessionId};
    debugPrint('New bookmarks: $newSessionIds');
    state = AsyncData(newSessionIds);
    unawaited(_saveToDisk());
  }

  Future<void> remove(String sessionId) async {
    final current = await future;
    final newSessionIds = <String>{...current}..remove(sessionId);
    state = AsyncData(newSessionIds);
    unawaited(_saveToDisk());
  }

  Future<void> _saveToDisk() async {
    final prefs = ref.read(sharedPreferencesProvider);
    final current = await future;
    await prefs.setStringList(_key, current.toList());
  }
}
